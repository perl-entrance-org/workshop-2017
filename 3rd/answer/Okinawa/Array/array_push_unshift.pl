#!/usr/bin/env perl
use strict;
use warnings;

my @array = qw[ Alice Bob Chirs];

push @array,"Diana";

print "@array\n";

unshift @array,"Eve";

print "@array\n";

for  my $member (@array){
    print "$member\n";
}
