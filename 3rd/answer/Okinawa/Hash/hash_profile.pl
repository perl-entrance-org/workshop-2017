#!/usr/bin/env perl
use strict;
use warnings;

my %profile = (
    name => "Seiko",
    age => 18,
    food => 'Sushi',
);

my @key = keys %profile;

for my $key (@key){
    print "$key\n";
}

delete $profile{age};

if (exists $profile{age}) {
    # keyがあった場合
   print "Age is exists\n"; 
} else {
    # 無かった場合
   print "Age is no exists\n"; 
}

if (!(exists $profile{age})){
    print "Age is no exists\n";
}

