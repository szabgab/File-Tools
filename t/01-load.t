#!/usr/bin/perl
use strict;
use warnings;

my @funcs;
BEGIN {@funcs = qw(awk cat df diff rm sed tail) }
use Test::More tests => 1+@funcs;
BEGIN { use_ok "File::Tools"; }


foreach my $func (@funcs) {
  eval "File::Tools::$func()";
  is ($@, "Not implemented\n", "$func not implemented");
};
