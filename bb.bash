#!/usr/bin/env bash

BB_VERSION="0.1.0"

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

if [ "$0" = "${BASH_SOURCE}" ]; then
  bb "$@"
fi

if [ $BB_NO_FUNCTION ]; then
  unset -f _bb_bench
  unset -f bb
fi

: <<'__EOF__'

=encoding utf8

=head1 NAME

B<bb> - A Benchmark tool for Bash script

=head1 SYNOPSYS

    # Run as script
    loop=1000 bb.bash "<bash code A>" [...]

    # Run as function
    . bb.bash
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

