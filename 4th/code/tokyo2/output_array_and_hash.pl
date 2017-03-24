#!/usr/bin/perl

use strict;
use warnings;

sub output_array_and_hash {
    my ($array, $hash) = @_;
    # array 出力
    print "array reference output\n";
    for my $element (@{$array}) {
        print ">>> $element\n";
    }
    # hash 出力
    print "hash reference output\n";
    for my $key (keys %{$hash}) {
        my $value = $hash->{$key};
        print ">>> key / value = $key / $value\n";
    }
}

my $array = [1,3,5,7,9];
my $hash  = {
    name => "alice",
    country => "england",
};

output_array_and_hash($array, $hash);
