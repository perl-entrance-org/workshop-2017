#!/usr/bin/env perl
use strict;
use warnings;

my $in = <STDIN>;

my $r = $in % 2;

if ($r == 0){
    print "even\n";
} else {
    print "odd\n";
}
