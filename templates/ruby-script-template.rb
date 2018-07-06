#!/usr/bin/ruby
# -*- Mode: Ruby; tab-width: 2; indent-tabs-mode: nil -*- vim:sta:et:sw=2:ts=2:syntax=ruby
#
# Revision History:
# YYYYmmdd - whoami - initial version
#

def getExec(cmd, rc)


  printf ("[executing] %s\n", $cmd if @debug

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

def doExec(cmd)
  getExec(cmd, rc)
  rc
end
