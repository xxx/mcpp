Mcpp
====

A gem to wrap the libmcpp C preprocessor.

Mcpp itself can be found at http://mccp.sourceforge.net

Installation
============

1. Install [mcpp](http://mccp.sourceforge.net) as a shared library.
1. `gem install mcpp`

[ffi](https://github.com/ffi/ffi) is a requirement, but should be installed
automatically by this gem if not already installed.

Use
===

Mcpp is a very simple wrapper that exposes a single method, `preprocess`,
that expects 0 or more arguments that correspond to the arguments that
you would pass to mcpp if running it on the command line.

The examples are hopefully more enlightening than the previous paragraph was.

The actual arguments that can be passed are identical to those used by the
command line program, and are enumerated in the mcpp man page, or online at
http://mcpp.svn.sourceforge.net/viewvc/mcpp/trunk/doc/mcpp-manual.html

Examples
--------

    require 'mccp'

    # Read from stdin, write to stdout
    Mcpp.preprocess

    # Read from a file, write to stdout
    Mcpp.preprocess '/path/to/file.c' 

    # Read from a file, write to another file
    Mcpp.preprocess '/path/to/infile.c', '/path/to/outfile'

    # More arguments
    Mcpp.preprocess '-DSOME_DEFINE', '-N', '-P', '-eutf8', 'relative/path/to/infile.c', 'path/to/outfile.cpp'
