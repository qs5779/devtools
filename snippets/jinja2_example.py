import errno
import os
from pathlib import Path

import click
from jinja2 import Template
from wtforglib.kinds import Fspec


def generate_template(
    target: Fspec, tmpl_fn: Fspec, tmpl_data: dict[str, str], replace: bool = True
):
    tf = Path(tmpl_fn)
    tp = Path(target)
    if not tf.is_file():
        raise FileNotFoundError(errno.ENOENT, os.strerror(errno.ENOENT), str(tf))
    with open(tmpl_fn) as fd:
        template = Template(fd.read())
    if not tp.parent.is_dir():
        raise FileNotFoundError(errno.ENOENT, os.strerror(errno.ENOENT), str(tp.parent))
    if replace:
        if tp.exists():
            tp.unlink()
    with open(target, "a") as fd:
        if not replace:
            fd.write("\n")
        fd.write(template.render(**tmpl_data))
        fd.write("\n")
    if replace:
        click.echo("generated: %s" % target)
    else:
        click.echo("appended to: %s" % target)
