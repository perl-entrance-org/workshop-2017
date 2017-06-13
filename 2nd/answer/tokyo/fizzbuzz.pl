#!/usr/bin/env perl
use strict;
use warnings;

my @array = (1..100);

for my $number (@array) {
    if ( $number % 3 == 0 && $number % 5 == 0 ) {
        print "FizzBuzz\n";
    } elsif ( $number % 3 == 0 ) {
        print "Fizz\n";
    } elsif ( $number % 5 == 0 ) {
        print "Buzz\n";
    } else {
        print "$number\n";
    }
}
