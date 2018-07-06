#!/usr/bin/ruby
# -*- Mode: Ruby; tab-width: 2; indent-tabs-mode: nil -*- vim:sta:et:sw=2:ts=2:syntax=ruby
#
# Revision History:
# YYYYmmdd - whoami - initial version
#

require 'getoptlong'

basenm = File.basename( $0 );
SCRDIR = File.dirname( $0 );

# TODO: convert below perl to ruby

debug = 0
verbose = 0
man = 0
help = 0
version = 0

ERRORS = 0
VERSION = '$Revision: 24951 $'

opts = GetoptLong.new(
  [ '--debug', '-d', GetoptLong::NO_ARGUMENT ],
  [ '--verbose', '-v', GetoptLong::NO_ARGUMENT ],
  [ '--version', '-V', GetoptLong::NO_ARGUMENT ],
  [ '--help', '--man', '-h', GetoptLong::NO_ARGUMENT ],
#  [ '--repeat', '-n', GetoptLong::REQUIRED_ARGUMENT ],
#  [ '--name', GetoptLong::OPTIONAL_ARGUMENT ]
)

opts.each do |opt, arg|
  case opt
    when '--help'
      puts <<-EOF
hello [OPTION] ... DIR

-h, --help:
   show help

--repeat x, -n x:
   repeat x times

--name [name]:
   greet user by name, if name not supplied default is John

DIR: The directory in which to issue the greeting.
      EOF
      exit 0
    when '--version'
      puts "#{basenm} #{VERSION[/\d+/]}"
      exit 0
    when '--verbose'
      verbose += 1
    when '--debug'
      debug += 1
  end
end

if debug > 0
  puts "debug: #{debug}"
end

if verbose > 0
  puts "verbose: #{verbose}"
end

def getExec(cmd, rc = nil)

  if debug > 0
    puts "[executing] #{cmd}\n"
  end

  v = %x{cmd};
  ec = $?;

  if rc != nil
    rc[0] = ec
  end

  v.strip!
  v.chomp!

  v
end

def doExec(cmd)
  rc = Array.new
  getExec(cmd, rc)
  rc[0]
end


exit ERRORS
