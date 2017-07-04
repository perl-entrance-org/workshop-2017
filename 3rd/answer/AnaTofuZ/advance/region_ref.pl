#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

my @tokyo = qw[ gotanda shibuya];

my %japan = (
    tokyo => \@tokyo,
    osaka => [qw/ sjinsaibashi /],
    okinawa => [qw/ naha yomitan/],
    hokkaido => [qw/ sapporo obihiro/],
    fukuoka => [qw/ hakata /],
);


# 練習問題1

print "$japan{tokyo}->[0]\n";
print "$japan{hokkaido}->[0]\n";

# 最終問題2
#
push @{$japan{osaka}},"umeda";

## 最終問題3

print Dumper \%japan;

