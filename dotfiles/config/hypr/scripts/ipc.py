#!/usr/bin/env python

import sys
import subprocess
from typing import List


def main():
    for line in iter(sys.stdin.readline, b""):
        event, args = line.rstrip().split(">>")

        match event:
            case "openwindow":
                run_openwindow_handler(args)
            case _:
                pass


def run_openwindow_handler(args: str):
    window_addr, workspace_name, window_class, window_title = args.split(",", 4)

    if window_title == "Firefox — Sharing Indicator":
        dispatch(["closewindow", f"address:0x{window_addr}"])


def dispatch(args: List[str]):
    args = ["hyprctl", "dispatch"] + args
    subprocess.run(args)


if __name__ == "__main__":
    main()
