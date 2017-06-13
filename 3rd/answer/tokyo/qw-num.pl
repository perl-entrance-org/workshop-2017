#!/usr/bin/env perl
use strict;
use warnings;

my @data = (qw/1 20 300 4000/);
#my @data = ("1", "20", "300", "400");

print $data[3] + $data[2], "\n";
print $data[3] . $data[2], "\n";
