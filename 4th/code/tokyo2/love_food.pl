#!/usr/bin/perl

use strict;
use warnings;

my $array = [
    "papix loves perl",
    "xtetsuji loves bus",
    "goma loves maguro",
    "members love earth",
    "this is good",
];

love_food($array);

sub love_food {
    my $array = shift;
    for my $line (@{$array}) {
        if ( $line =~ /(.+?) loves (.+)/ ) {
            print "$1 -> $2\n";
        }
    }
}
