#!/usr/bin/perl -w
use strict;

use Test::More skip_all => 'These are just ideas on how to use the module in OOP, nothing implemented yet';

use PPT;


{
  my $shell = PPT->new;
  $shell->copy("old", "new");
}


{
  my $shell = PPT->new;
  $shell->things([qw(.)]);  # things are directories, files
  $shell->recoursive(1);
  $shell->chown("username", "groupname");
}


{
  my $shell = PPT->new(file => "filename");
  grep /regex/, $shell->cat;
}




