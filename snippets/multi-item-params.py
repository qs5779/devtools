#!/usr/bin/env python
# -*- Mode: Python; tab-width: 2; indent-tabs-mode: nil -*-

import sys
from optparse import OptionParser


def main():
    usage = "usage: %prog [options]"
    parser = OptionParser(usage)
    parser.add_option(
        "-s", "--server", action="append", dest="servers", help="specify servers"
    )

    (opts, _args) = parser.parse_args()
    options = vars(opts)
    print(options)

    if options["servers"]:
        sep = ","
        joined = sep.join(options["servers"])
        servers = joined.split(sep)
    else:
        servers = None
    print(servers)


if __name__ == "__main__":
    main()
