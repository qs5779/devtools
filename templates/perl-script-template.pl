#!/usr/bin/perl -w
# -*- Mode: Perl; tab-width: 2; indent-tabs-mode: nil -*- vim:sta:et:sw=2:ts=2:syntax=perl
#
# Revision History:
# YYYYmmdd - whoami - initial version
#

use strict;
use File::Basename qw/ basename dirname /;
use Getopt::Long;
use Pod::Usage;

use constant TRUE => 1;
use constant FALSE => 0;

my $SCRIPT = basename( "$0" );
my $SCRDIR = dirname("$0");

my $debug = 0;
my $verbose = 0;
my $man = 0;
my $help = 0;
my $version = 0;
my $error_count = 0;

Getopt::Long::Configure("bundling");

GetOptions(
  'd|debug+'       => \$debug,
  'v|verbose+'     => \$verbose,
  'V|Version'     => \$version,
  'man' => \$man,
  'h|help|?'  => \$help
) or pod2usage( 2 );

pod2usage( 1 ) if $help;
pod2usage(-exitstatus => 0, -verbose => 2) if $man;

my $VERSION = '$Revision: 990 $';

if ( $version ) {
  $VERSION =~ s/\$//g;
  print "$SCRIPT $VERSION\n";
  exit(0);
}

sub getExec {
  my ($c, $rcref) = @_;
  my $v;
  my $rc;

  printf "[executing] %s\n", $c if($debug);

  # NOTE: if the script must run on SunOS and the command uses a sub shell convention like "dirname $(<appl>SUBDIR -I)"
  #       then you need to wrap it with [ /bin/ksh -c "command with double quotes escaped" ]
  #       the reason is that "sh" on SunOS does not support the sub shell convention indicated above

  $v = qx/$c/;
  $rc = $?;

  if (defined($rcref)) {
    $$rcref = $rc;
  }

  # trim leading/trailing spaces
  $v =~ s/^\s+//;
  $v =~ s/\s+$//;

  chomp($v);
  return $v;
}

sub doExec {
  my $c = $_[0];
  my $rc;
  getExec($c, \$rc);
  return $rc;
}

my $HOME=glob("~");   # This is a simple and apparently effective way to find $HOME

printf "Hello World.\nMy HOME is: %s\n", $HOME;

exit($error_count);

__END__

=head1 NAME

perl-script-template.pl - example perl script template

=head1 SYNOPSIS

perl-script-template.pl [-d] [-h] [-v] [-V]

  example perl script template

=head1 OPTIONS

=over 8

=item B<-d|--debug>

  Sets debug flag to show more output.

=item B<-h|--help>

  Print a brief help message and exits.

=item B<-v|--verbose>

  Sets verbose flag to show more output.

=item B<-V|--version>

  Prints version and exits


=back
