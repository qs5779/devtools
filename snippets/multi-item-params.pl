#!/usr/bin/env perl
# -*- Mode: Perl; tab-width: 2; indent-tabs-mode: nil -*- vim:sta:et:sw=2:ts=2:syntax=perl
#

my @servers = ();
use Getopt::Long;

GetOptions(
  's|server|hosts=s' => \@servers
) or pod2usage(2);

@servers = split(/[,; ]+/, join(',', @servers));
