#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1, caller_info => 1};

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
    return $left / $right;
}

ok(add(1,   1) == 2);
ok(add(123, 234) == 357);
ok(min(123, 234) == -111);
ok(min(2,   2) == 0);
ok(mul(2, 2) == 4);
ok(mul(0, 234566) == 0);
ok(div(4,  2) == 2);
ok(div(15, 3) == 5);

sub ok {
    if (shift) {
        print "OK\n";
    }
    else {
        print "NG\n";
    }
}
