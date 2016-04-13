#!/usr/bin/env bash

__a=$1
__b=$2

_bb_bench() {
  local script=$1
  local loop=$2
  echo -n "Exec '${script}' ${loop} times ..."
  local i
  time for i in $(seq 1 $loop); do
    bash -c ${script} >/dev/null 2>&1
  done
}

bb() {
  local a=$1
  local b=$2
  local loop=${loop:-1000}

  if [ $BB_DEBUG ]; then
    echo "Exec '${a}'"
    bash -cx "$a"
    echo "Exec '${b}'"
    bash -cx "$b"
  else
    _bb_bench "${a}" ${loop}
    _bb_bench "${b}" ${loop}
  fi
}

if [ "$0" = "${BASH_SOURCE}" ]; then
  bb "${__a}" "${__b}"
fi

unset __a
unset __b

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
    loop=1000 bb.bash "<bash code A>" "<bash code B>"

    # Run as function
    . bb.bash
    loop=1000 bb "<bash code A>" "<bash code B>"

    # Debug
    BB_DEBUG=1 bb "<bash code A>" "<bash code B>"

=head1 DESCRIPTION

A Benchmark script for Bash.

=head1 AUTHORS

YASUTAKE Kiyoshi E<lt>yasutake.kiyoshi@gmail.comE<gt>

=head1 LICENSE

The MIT License (MIT)

Copyright (c) 2016 YASUTAKE Kiyoshi

=cut

__EOF__

