#!/usr/bin/env perl

use strict;
use warnings;

# https://github.com/perl-entrance-org/workshop-2017/blob/master/3rd/slide.md

# --- Reference ---
# https://github.com/perl-entrance-org/workshop-2017/blob/master/3rd/slide.md#リファレンス

# --- exercises ---
# https://github.com/perl-entrance-org/workshop-2017/blob/master/3rd/slide.md#練習問題-2

# --- i ---

# take a reference using the anonymous array constructor
my $ref_dog  = [qw/shiba bulldog/];
my $ref_cat  = [qw/mike abyssinian/];
my $ref_bird = [qw/eagle crow/];

# make a data structure
my @animal = ($ref_dog, $ref_cat, $ref_bird);

# --- ii ---

print "--- take 'eagle' ---\n";
# dereferencing an element of array-of-array
my $eagle = ${$animal[2]}[0];
# or
#my $eagle = $animal[2]->[0];
# or
#my $eagle = $animal[2][0];

print "$eagle\n";

# --- iii ---

print "--- take ohter elements ---\n";
# dereferencing each element of array-of-array
my $shiba      = $animal[0]->[0];
my $bulldog    = $animal[0]->[1];
my $mike       = $animal[1]->[0];
my $abyssinian = $animal[1]->[1];
   $eagle      = $animal[2]->[0];
my $crow       = $animal[2]->[1];

print "$shiba,$bulldog,$mike,$abyssinian,$eagle,$crow\n";

# or
#foreach my $ref (@animal) {
#  # dereferencing as whole array
#  foreach my $elm (@{$ref}) {
#    print "$elm ";
#  }
#  print "\n";
#}

