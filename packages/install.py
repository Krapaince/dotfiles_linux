#!/usr/bin/env python

from pathlib import Path
import subprocess
import sys
from typing import List

PROFILES_LIST = ["Krapaince-MASTER-arch", "Krapaince-arch", "krapaince_tty"]


def make_packages_files_list(profile: str) -> List[Path]:
    common_pkg_file = [Path("aur"), Path("aur.ls"), Path("pacman"), Path("pacman.ls")]
    common_gui_pkg_file = common_pkg_file + [
        Path("aur.gui"),
        Path("pacman.gui"),
    ]

    profiles_packages_files = {
        PROFILES_LIST[0]: common_gui_pkg_file
        + [Path("aur.gui-x"), Path("pacman.gui-x")],
        PROFILES_LIST[1]: common_gui_pkg_file
        + [Path("aur.gui-wayland"), Path("pacman.gui-wayland")],
        PROFILES_LIST[2]: [],
    }

    return profiles_packages_files[profile]


def install_packages(profile_packages_files: List[Path]):
    packages: List[str] | str = []

    for profile_packages_file in profile_packages_files:
        if profile_packages_file.exists() and profile_packages_file.is_file():
            with open(profile_packages_file, "r") as ppf:
                packages.extend(ppf.readlines())
        else:
            print(f"{profile_packages_file.as_posix()} doesn't exist.")
    packages.sort()
    packages[-1] = packages[-1].removesuffix("\n")
    packages = "".join(packages)
    p = subprocess.Popen(
        ["paru", "-Syu", "--needed", "--skipreview", "-"],
        stdin=subprocess.PIPE,
        text=True,
    )
    p.communicate(packages)


def main():
    if len(sys.argv) != 2:
        exit(1)

    profile = sys.argv[1]
    if not profile in PROFILES_LIST:
        print(f"`{profile} isn't a valid profile.")
        exit(1)

    packages = make_packages_files_list(profile)
    install_packages(packages)


if __name__ == "__main__":
    main()
