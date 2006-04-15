#!/usr/bin/perl -w
use strict;

use Test::More skip_all => 'not implemented';
use PPT;

is_deeply( [PPT::uniq(qw(a b c))], [qw(a b c)], "uniq originally" );
is_deeply( [PPT::uniq(qw(a b c a))], [qw(a b c)] );
is_deeply(  [PPT::uniq(qw(b b a a b c a))], [qw(b a c)] );


