#!/usr/bin/perl -w
use strict;

use Test::More tests => 6;
use File::Tools;

{
  my $full_path = File::Tools::catfile("a",  "b", "c");
  is File::Tools::basename($full_path), "c", "catfile and basename";
  is File::Tools::dirname($full_path), File::Tools::catfile("a", "b"), "catfile, dirname, catfile";
}

{
  my $data = File::Tools::slurp "t/data/file1";
  open my $fh1, "<", "t/data/file1" or die;
  my $expected = join "", <$fh1>;
  is $data, $expected, "slurp of one file works";

  my $data2 = File::Tools::slurp "t/data/file1", "t/data/file2";
  open my $fh2, "<", "t/data/file2" or die;
  my $expected2 = $expected . join "", <$fh2>;
  is $data2, $expected2, "slurp of two files works";

  my $warn;
  local $SIG{__WARN__} = sub {$warn = shift};
  my $data3 = File::Tools::slurp "t/data/file1", "t/data/nosuch", "t/data/file2";
  is $data3, $expected2, "slurp of two files (and one missing) works";
  is $warn, "Could not open 't/data/nosuch'\n", "warning received correctly";
}


# chmod
# copy
# cwd
# date
# fileparse
# find
# move
# mail
# popd
# pushd
# rmtree
