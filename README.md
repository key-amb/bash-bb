# NAME

**bb** - A Benchmark tool for Bash script

# SYNOPSYS

    # Run as script
    loop=1000 bb.bash "<bash code A>" [...]

    # Run as function
    . bb.bash
    loop=1000 bb "<bash code A>" [...]

    # Debug
    BB_DEBUG=1 bb "<bash code A>" [...]

# DESCRIPTION

A Benchmark script for Bash.

All arguments for this script or function `bb` are taken as bash codes to test.

You can test only single command.
And you can compare any number of commands.

# AUTHORS

YASUTAKE Kiyoshi <yasutake.kiyoshi@gmail.com>

# LICENSE

The MIT License (MIT)

Copyright (c) 2016 YASUTAKE Kiyoshi
