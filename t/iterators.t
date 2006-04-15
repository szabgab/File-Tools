#!/usr/bin/perl -w
use strict;

use Test::More skip_all => 'Not implemented, just trying how it might look to use iterators';

use PPT;



{
  my $shell = PPT->new;
  $shell->copy("old", "new");
}

{
  # cat "file1", "file2" > "newfile"
  # 
}
  

