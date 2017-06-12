#!/usr/bin/env perl

use strict;
use warnings;

# https://github.com/perl-entrance-org/workshop-2017/blob/master/3rd/slide.md

# --- Reference ---
# https://github.com/perl-entrance-org/workshop-2017/blob/master/3rd/slide.md#リファレンス

# --- exercises ---
# https://github.com/perl-entrance-org/workshop-2017/blob/master/3rd/slide.md#最終問題

# --- i ---

# take a reference using the anonymouse array construcotr
my $ref_ary_tokyo    = [qw/gotanda shibuya/];
my $ref_ary_osaka    = [qw/shinsaibashi/];
my $ref_ary_okinawa  = [qw/naha yomitan/];
my $ref_ary_hokkaido = [qw/sapporo obihiro/];
my $ref_ary_fukuoka  = [qw/hakata/];

# make a data structor
my %japan = (
    tokyo => $ref_ary_tokyo,
    osaka => $ref_ary_osaka,
    okinawa => $ref_ary_okinawa,
    hokkaido => $ref_ary_hokkaido,
    fukuoka => $ref_ary_fukuoka,
);

# --- 2 ---

print "--- take 'gotanda' and 'sapporo' ---\n";
# dereferencing a value of hash-of-array
my $gotanda = ${$japan{tokyo}}[0];
# or
#my $gotanda= $japan{tokyo}->[0];
# or
#my $gotanda = $japan{tokyo}[0];
print "$gotanda\n";

my $sapporo = $japan{hokkaido}->[0];
print "$sapporo\n";

# --- 3 ---

print "--- adding 'umeda' to 'osaka' ---\n"; 
push @{$japan{osaka}}, 'umeda';

# --- 4 ---

print "--- Dump out the contents of %japan (added 'umeda' to 'osaka') ---\n";
use Data::Dumper;
print Dumper (\%japan);

# --- extra ---

print "--- take each element ---\n";

foreach my $key (keys %japan) {
  # dereferencing as whole array
  foreach my $elm (@{$japan{$key}}) {
    print "$elm ";
  }
  print "\n";
}

