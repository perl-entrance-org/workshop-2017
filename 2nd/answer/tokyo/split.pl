#!/usr/bin/env perl
use strict;
use warnings;

my $string = "There's more than one way to do it.";

print "=== string part 1 ===\n";
my @array = split / /, $string;
for my $element (@array) {
    print "$element\n";
}

print "=== string part 2 ===\n";
my $string2 = "It is fine. Today is good.";
my @array2 = split / /, $string2;
for my $element (@array2) {
    print "$element\n";
}
