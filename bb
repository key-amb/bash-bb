#!/usr/bin/env bash

version="0.2.0"

_bb_bench() {
  local script=$1
  local loop=$2
  echo -n "Exec '${script}' ${loop} times ..."
  local i
  time bash -c "for i in \$(seq 1 $loop); do
    ${script} >/dev/null 2>&1
  done"
}

bb() {
  local loop=${loop:-1000}
  local sbj

  for sbj in "$@"; do
    if [ $BB_DEBUG ]; then
      echo "Exec '${sbj}'"
      bash -cx "${sbj}"
    else
      _bb_bench "${sbj}" ${loop}
    fi
  done
}

version() {
  echo $version
  exit 0
}

case $1 in
  "-v" | "--version" )
    version
    ;;
  * )
    ;;
esac

bb "$@"

exit 0

: <<'__EOF__'

=encoding utf8

=head1 NAME

B<bb> - A Benchmark tool for Bash script

=head1 SYNOPSYS

    loop=1000 bb "<bash code A>" [...]

    # Debug
    BB_DEBUG=1 bb "<bash code A>" [...]

=head1 DESCRIPTION

A Benchmark script for Bash.

All arguments for this script or function C<bb> are taken as bash codes to test.

You can test only single command.
And you can compare any number of commands.

=head1 AUTHORS

YASUTAKE Kiyoshi E<lt>yasutake.kiyoshi@gmail.comE<gt>

=head1 LICENSE

The MIT License (MIT)

Copyright (c) 2016 YASUTAKE Kiyoshi

=cut

__EOF__

