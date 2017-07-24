#!/usr/bin/env perl
use strict;
use warnings;

my $str = "There's more than one way to do it."; 
my @array = split / /, $str;

for my $word ( @array ) {
    print $word ."\n";
}
