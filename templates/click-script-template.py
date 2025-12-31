#!/usr/bin/env python3
# -*- Mode: Python; tab-width: 4; indent-tabs-mode: nil -*-
"""Click_script_template module."""
import sys
from types import MappingProxyType

import click

CONTEXT_SETTINGS = MappingProxyType({"help_option_names": ["-h", "--help"]})
VERSION = "1.0.0"


@click.command(context_settings=CONTEXT_SETTINGS)
@click.version_option(VERSION)
def main():
    """This is the main function."""
    click.echo("Hello World!")
    exit_code = 0
    return exit_code


if __name__ == "__main__":
    sys.exit(main())
