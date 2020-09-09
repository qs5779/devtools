#!/usr/bin/env ruby
# frozen_string_literal: true

# -*- Mode: Ruby; tab-width: 2; indent-tabs-mode: nil -*-
# vim:sta:et:sw=2:ts=2:syntax=ruby
#
# Revision History:
# YYYYmmdd - whoami - initial version
#

require 'getoptlong'

basenm = File.basename($PROGRAM_NAME)
# scrdir = File.dirname($PROGRAM_NAME)

# TODO: convert below perl to ruby

debug = 0
verbose = 0

errors = 0
VERSION = '0.0.1'

opts = GetoptLong.new(
  ['--debug', '-d', GetoptLong::NO_ARGUMENT],
  ['--verbose', '-v', GetoptLong::NO_ARGUMENT],
  ['--version', '-V', GetoptLong::NO_ARGUMENT],
  ['--help', '--man', '-h', GetoptLong::NO_ARGUMENT]
  #  [ '--repeat', '-n', GetoptLong::REQUIRED_ARGUMENT ],
  #  [ '--name', GetoptLong::OPTIONAL_ARGUMENT ],
)

opts.each do |opt, _arg|
  case opt
  when '--help'
    puts <<-USG
  usage: #{@basenm} [-d] [-h] [-v] [-V]
    where:
      -d - specify debug mode
      -h - show this message and exit
      -v - add verbosity
      -V - show version and exit
    USG
    exit 0
  when '--version'
    puts "#{basenm} #{VERSION}"
    exit 0
  when '--verbose'
    verbose += 1
  when '--debug'
    debug += 1
  end
end

puts "debug: #{debug}" if debug.positive?

puts "verbose: #{verbose}" if verbose.positive?

def get_exec(cmd)
  puts "[executing] #{cmd}\n" if debug.positive?

  v = `cmd`
  ec = $CHILD_STATUS

  v.strip!
  v.chomp!

  [v, ec]
end

def do_exec(cmd)
  _ignore, ec = get_exec(cmd)
  ec
end

exit errors
