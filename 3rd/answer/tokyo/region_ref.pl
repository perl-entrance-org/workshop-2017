#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

my %japan = (
    tokyo    => ["gotanda", "shibuya"],
    #tokyo    => [qw/gotanda shibuya/],
    osaka    => ["shinsaibashi"],
    okinawa  => ["naha", "yomitan"],
    hokkaido => ["sapporo", "obihiro"],
    fukuoka  => ["hakata"],
);

print "this region " . $japan{tokyo}->[0] . "\n";

print "second region is " . $japan{hokkaido}->[0] . "\n";

push @{$japan{osaka}}, "umeda";
# $japan{osaka}->[1] = "umeda";

print Dumper(\%japan);
