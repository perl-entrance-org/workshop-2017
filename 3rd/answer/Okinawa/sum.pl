#!/usr/bin/env perl
use strict;
use warnings;
use List::Util;

my @array = (1..100);

my $result;

print List::Util::reduce{$a+$b}(1..100);

for my $now  (@array){

#    $result += $now ;
#    $result = $result + $now;

}

#print "result is $result\n";
