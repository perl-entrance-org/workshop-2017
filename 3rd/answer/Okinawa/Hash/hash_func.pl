#!/usr/bin/env perl
use strict;
use warnings;

my %user = (
    name => "Matuda Seiko",
    age => 18,
    "food" => "Sushi",
);

delete $user{food};

my @keys = keys %user;

for  (@keys){
    print "$_\n";
}
