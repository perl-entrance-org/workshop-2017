#!/usr/bin/env perl
use strict;
use warnings;

my @array = (100, "Hello", 200);
for my $element (@array) {
    print "$element\n";
}

my @array2;
print "1> ";
my $input1 = <STDIN>;
chomp $input1;

print "2> ";
my $input2 = <STDIN>;
chomp $input2;

print "3> ";
my $input3 = <STDIN>;
chomp $input3;

my @array2 = ($input1, $input2, $input3);
for my $element (@array2) {
    print "$element\n";
}
