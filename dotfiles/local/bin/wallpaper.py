#!/usr/bin/env python

import argparse
import json
import os
from pathlib import Path
import shutil
import signal
import subprocess
import time
from typing import List, TypedDict
import uuid

WALLPAPER_CONFIG = Path.joinpath(Path.home(), ".config/wallpaper")
SETTING_PATH = Path.joinpath(WALLPAPER_CONFIG, "settings.json")
WALLPAPER_CACHE_PATH = Path.joinpath(Path.home(), ".cache/wallpaper")

{%@@ if is_wayland is not defined @@%}
WALLPAPER_PATH = Path("{{@@ wallpaper_destination @@}}/{{@@ wallpaper_filename @@}}")
{%@@ endif @@%}


{%@@ if is_wayland is defined and is_wayland @@%}
class Monitor(TypedDict):
    name: str
    path: Path
{%@@ endif @@%}


class Color(TypedDict):
    l: int
    h: int
    r: int
    y: int
    g: int
    c: int
    b: int
    m: int


ColorSet = List[Color]


class Setting(TypedDict):
    enable: bool
    paused: bool
    sleep: int
    index: int


{%@@ if is_wayland is defined and is_wayland @@%}
def load_monitors() -> List[Monitor]:
    with open(Path.joinpath(WALLPAPER_CONFIG, "monitors.json"), "r") as f:
        monitors: List[Monitor] = []

        for monitor in json.load(f):
            monitors.append(
                Monitor(name=monitor.get("name"), path=Path(monitor.get("path")))
            )

        return monitors
{%@@ endif @@%}


def load_color_set() -> ColorSet:
    with open(Path.joinpath(WALLPAPER_CONFIG, "color_set.json")) as f:
        return json.load(f)


def load_setting() -> Setting:
    if SETTING_PATH.exists():
        with open(SETTING_PATH, "r") as f:
            return json.load(f)
    else:
        default = Setting(enable=True, paused=False, sleep=60, index=0)
        with open(SETTING_PATH, "w") as f:
            json.dump(default, f)
        return default


def is_original(color: Color) -> bool:
    return sum(color.values()) == 0


{%@@ if is_wayland is defined and is_wayland @@%}
def set_wallpaper(path: Path, monitor: str):
    change_wallpaper = lambda: subprocess.Popen(
        ["swaybg", "-o", monitor, "-i", path.as_posix()]
    )

    maybe_pid = subprocess.run(
        " ".join(["pgrep", "-f", f'"swaybg -o {monitor}"']),
        capture_output=True,
        text=True,
        shell=True,
    ).stdout

    if len(maybe_pid):
        pid = int(maybe_pid)
        change_wallpaper()
        time.sleep(0.5)
        os.kill(pid, signal.SIGTERM)
    else:
        change_wallpaper()
{%@@ else @@%}
def set_wallpaper(path: Path):
    subprocess.Popen( ["feh", "--bg-fill", "--no-xinerama", path]).wait()
{%@@ endif @@%}


def make_img_fielanme_from_color(color: Color) -> str:
    return (
        "_".join(
            "{}{:03}".format(key, color[key])
            for key in [
                "l",
                "h",
                "r",
                "y",
                "g",
                "c",
                "b",
                "m",
            ]
        )
        + ".png"
    )


# origin: The path to the original image (return if every parameters are equal to 0)
# monitor: For wayland
def make_img_filename_from_index(
    color_set: ColorSet, i: int, origin: Path, monitor: str = ""
) -> Path:
    cache_path = Path.joinpath(WALLPAPER_CACHE_PATH, monitor)

    if i < len(color_set) and not is_original(color_set[i]):
        return Path.joinpath(cache_path, make_img_fielanme_from_color(color_set[i]))
    else:
        return origin


# monitor: For wayland
def generate_wallpaper(wallpaper: Path, color: Color, monitor: str = "") -> None:
    output = Path.joinpath(WALLPAPER_CACHE_PATH, monitor).joinpath(
        make_img_fielanme_from_color(color)
    )

    if is_original(color) or output.exists():
        return

    tmp_out_dir = Path("/tmp")

    input_file = wallpaper
    out_filename = Path(str(uuid.uuid4()) + wallpaper.suffix)

    for value in ["r", "y", "g", "c", "b", "m"]:
        amount = color[value]

        if amount != 0:
            out_filename = Path(str(uuid.uuid4()) + wallpaper.suffix)
            process = subprocess.Popen(
                [
                    "colorbalance2",
                    "-l",
                    str(color["l"]),
                    "-h",
                    str(color["h"]),
                    "-c",
                    value,
                    "-a",
                    str(amount),
                    "-r",
                    "h",
                    input_file,
                    Path.joinpath(tmp_out_dir, out_filename),
                ]
            ).wait()
            if process != 0:
                exit(1)

            if input_file.as_posix() != wallpaper.as_posix():
                os.remove(input_file)
            input_file = Path.joinpath(tmp_out_dir, out_filename)
    shutil.move(tmp_out_dir.joinpath(out_filename), output)


####
#
# Commands
#
####


def change_wallpaper() -> None:
    color_set = load_color_set()
{%@@ if is_wayland is defined and is_wayland @@%}
    monitors = load_monitors()
{%@@ endif @@%}

    while True:
        setting = load_setting()

        setting["index"] += 1
        if len(color_set) <= setting["index"]:
            setting["index"] = 0
        with open(SETTING_PATH, "w") as fs:
            json.dump(setting, fs)

        if setting["enable"] == False:
{%@@ if is_wayland is defined and is_wayland @@%}
            subprocess.Popen(["killall", "swaybg"]).wait()
            for monitor in monitors:
                set_wallpaper(monitor["path"], monitor["name"])
            return
{%@@ else @@%}
            set_wallpaper(WALLPAPER_PATH)
{%@@ endif @@%}

{%@@ if is_wayland is defined and is_wayland @@%}
        for monitor in monitors:
            wallpaper = make_img_filename_from_index(
                color_set, setting["index"], monitor["path"], monitor["name"]
            )

            if not wallpaper.exists():
                generate_wallpaper(
                    monitor["path"],
                    color_set[setting["index"]],
                    monitor["name"],
                )
            set_wallpaper(wallpaper, monitor["name"])
{%@@ else @@%}
        wallpaper = make_img_filename_from_index(
            color_set, setting["index"], WALLPAPER_PATH
        )

        if not wallpaper.exists():
            generate_wallpaper(
                WALLPAPER_PATH,
                color_set[setting["index"]]
            )
        set_wallpaper(wallpaper)
{%@@ endif @@%}

        time.sleep(setting["sleep"])

        while setting["paused"]:
            setting = load_setting()
            time.sleep(setting["sleep"])


def print_wallpapers() -> None:
    setting = load_setting()
    color_set = load_color_set()

    i = setting["index"]

{%@@ if is_wayland is defined and is_wayland @@%}
    monitors = load_monitors()

    ret = ""

    for monitor in monitors:
        wallpaper = make_img_filename_from_index(
            color_set, i, monitor["path"], monitor["name"]
        )
        ret += "-i {}:{}".format(monitor["name"], wallpaper)
{%@@ else @@%}
    ret = make_img_filename_from_index(color_set, i, WALLPAPER_PATH)
{%@@ endif @@%}
    print(ret)


def generate_wallpapers() -> None:
    color_set = load_color_set()
{%@@ if is_wayland is defined and is_wayland @@%}
    monitors = load_monitors()

    for monitor in monitors:
        monitor["path"] = Path(monitor["path"])
        os.makedirs(Path.joinpath(WALLPAPER_CACHE_PATH, monitor["name"]), exist_ok=True)

        for color in color_set:
            generate_wallpaper(monitor["path"], color, monitor["name"])
{%@@ else @@%}
    for color in color_set:
        generate_wallpaper(WALLPAPER_PATH, color)
{%@@ endif @@%}


def toggle_pause() -> None:
    setting = load_setting()
    setting["paused"] = not setting["paused"]

    with open(SETTING_PATH, "w") as f:
        json.dump(setting, f)


def main(args: argparse.Namespace):
    match args.command:
        case "change":
            change_wallpaper()
        case "get":
            print_wallpapers()
        case "generate":
            generate_wallpapers()
        case "toggle":
            toggle_pause()
        case _:
            return


if __name__ == "__main__":
    parser = argparse.ArgumentParser(prog="Wallpaper manager")

    subparser = parser.add_subparsers(dest="command")
    subparser.add_parser("change", help="Loop mode to change the wallpaper")
    subparser.add_parser("generate", help="Generate all wallpapers variant")
    subparser.add_parser(
        "toggle", help="Toggle the change wallpaper loop (for lock purpose)"
    )
    subparser.add_parser("get", help="Print monitors and wallpapers path for swaylock")
    main(parser.parse_args())
