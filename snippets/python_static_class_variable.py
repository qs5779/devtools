#!/usr/bin/env python

import click


class Cls:
    counter = 0

    def __init__(self, name):
        self.name = name
        Cls.counter += 1

    def count(self):
        click.echo(f"name: {self.name}, count: {Cls.counter}")


first = Cls("first")
first.count()
second = Cls("second")
second.count()
first.count()
