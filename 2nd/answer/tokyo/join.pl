#!/usr/bin/env perl
use strict;
use warnings;

my @array = ("0120", "123", "XXX");
# my @array = qw(0120 123 XXX); # これでもOK

print join '-', @array;
print "\n";
