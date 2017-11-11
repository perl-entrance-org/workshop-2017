#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1, caller_info => 1};

sub love_food {
    my $array_ref = shift;
    for my $str (@{$array_ref}) {
        if ($str =~ /(.+?) loves (.+?)!/) {
            print qq{$1 -> $2\n};
        }
    }
}

my $words_ref = +['alice loves meat!', 'bob loves sushi!', 'nqounet loves ramen!',];

love_food($words_ref);
