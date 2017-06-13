#!/usr/bin/env perl
use strict;
use warnings;

my @numbers = (1..100);

my $sum = 0;
for my $number (@numbers) {
    $sum = $sum + $number;
}

print "sum is $sum\n";
