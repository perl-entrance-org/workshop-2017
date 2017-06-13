#!/usr/bin/env perl
use strict;
use warnings;

print "input first> ";
my $input1 = <STDIN>;
chomp $input1;
print "input second> ";
my $input2 = <STDIN>;
chomp $input2;

# print "input1 => $input1 / input2 => $input2\n";

print "$input1 + $input2 = " . ($input1 + $input2) . "\n";
print "$input1 - $input2 = " . ($input1 - $input2) . "\n";
print "$input1 * $input2 = " . ($input1 * $input2) . "\n";
print "$input1 / $input2 = " . ($input1 / $input2) . "\n";
