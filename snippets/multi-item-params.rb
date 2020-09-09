#!/usr/bin/env ruby
# -*- Mode: Ruby; tab-width: 2; indent-tabs-mode: nil -*-
# vim:sta:et:sw=2:ts=2:syntax=sh
#

params = %w{ten nine eight}

param = ARGV.size.positive? ? ARGV[0] : 'one,two three;four   five'

params = param.split(%r{[,; ]+})

pp params
