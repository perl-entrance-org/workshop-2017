#!/usr/bin/perl

use strict;
use warnings;

sub add {
    my ($left, $right) = @_;
    return $left + $right;
}

sub min {
    my ($left, $right) = @_;
    return $left - $right;
}

sub mul {
    my ($left, $right) = @_;
    return $left * $right;
}

sub div {
    my ($left, $right) = @_;
    if ( $right == 0 ) {
        print "ゼロはだめよ\n";
        return;
    }
    return $left / $right;
}

my $min_value = min(10, 4);
if ( $min_value == 6 ) {
    print "min is ok\n";
} else {
    print "min is ng?\n";
}

if ( mul(8, 7) == 56 ) {
    print "mul is ok\n";
}

if ( div(8, 0) == 0 ) {
    print "div is ok\n";
}
