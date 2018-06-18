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
      debug += 1
    when '--debug'
      verbose += 1
  end
end

puts "debug: #{debug}"
puts "verbose: #{verbose}"



exit ERRORS

# __END__

# =head1 NAME

# ruby-script-template.pl - example script script template

# =head1 SYNOPSIS

# ruby-script-template.pl [-d] [-h] [-v] [-V]

  # example ruby script template

# =head1 OPTIONS

# =over 8

# =item B<-d|--debug>

  # Sets debug flag to show more output.

# =item B<-h|--help>

  # Print a brief help message and exits.

# =item B<-v|--verbose>

  # Sets verbose flag to show more output.

# =item B<-V|--version>

  # Prints version and exits


# =back
