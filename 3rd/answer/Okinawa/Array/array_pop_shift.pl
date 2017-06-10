#!/usr/bin/env perl
use strict;
use warnings;

my @array = qw[ Alice Bob Chirs ];

my $elemnt = pop @array;

print "$elemnt\n";

$elemnt = shift @array;

print "$elemnt\n";
