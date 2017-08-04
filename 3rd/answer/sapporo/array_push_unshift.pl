#!/usr/bin/env perl
use strict;
use warnings;

my @array = qw(Alice Bob Chris);

push @array, 'Diana';
unshift @array, 'Eve';

for my $name (@array){
    print $name . "\n";
}