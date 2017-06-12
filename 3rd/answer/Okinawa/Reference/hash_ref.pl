#!/usr/bin/env perl

use strict;
use warnings;

# https://github.com/perl-entrance-org/workshop-2017/blob/master/3rd/slide.md

# --- Reference ---
# https://github.com/perl-entrance-org/workshop-2017/blob/master/3rd/slide.md#リファレンス

# --- exercises ---
# https://github.com/perl-entrance-org/workshop-2017/blob/master/3rd/slide.md#練習問題-3

# --- i ---

# take a reference using the anonymouse hash construcotr
my $ref_dog = { name => 'Taro', color => 'brown' };
my $ref_cat = { name => 'Tama', color => 'white' };

# make a data structor
my %animal = (
    dog => $ref_dog,
    cat => $ref_cat,
);

# --- ii ---

print "--- take 'white' ---\n";
# dereferencing a value of hash-of-hash
my $white = ${$animal{cat}}{color};
# or
#my $white = $animal{cat}->{color};
# or
#my $white = $animal{cat}{color};

print "$white\n";

# --- iii ---

print "--- take ohter values ---\n";
# dereferencing each value of hash-of-hash
my $taro_name  = $animal{dog}->{name};
my $taro_color = $animal{dog}->{color};
my $tama_name  = $animal{cat}->{name};
my $tama_color = $animal{cat}->{color};

print "$taro_name, $taro_color, $tama_name, $tama_color\n";

# or
#foreach my $ref (keys %animal) {
#  # dereferencing as whole hash
#  foreach my $key (keys %{$animal{$ref}}) {
#    print "$animal{$ref}->{$key} ";
#  }
#  print "\n";
#}

