#!/usr/bin/perl -w
use strict;

use Test::More tests => 10;
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

{
  my $cwd1 = File::Tools::cwd;
  my $pushd = File::Tools::pushd("t");
  my $cwd2 = File::Tools::cwd;
  is $cwd2, "$cwd1/t", "pushd changes to the new directory";
  is $pushd, "$cwd1/t", "pushd returns the new directory";

  my $popd = File::Tools::popd;
  my $cwd3 = File::Tools::cwd;
  is $popd, $cwd1, "popd returns the original directory";
  is $cwd3, $cwd1, "popd changes to the original directory";
}



# chmod
# copy
# date
# fileparse
# find
# move
# mail
# rmtree
