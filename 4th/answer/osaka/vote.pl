#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1, caller_info => 1};

my @favorite_foods = ('寿司', 'ラーメン', 'ハンバーグ');
my %hash = (
    name           => '若林',
    favorite_foods => \@favorite_foods,
);

my $hash = \%hash;
p $hash;

my %tomcha = (
    name           => 'tomcha',
    favorite_foods => +['オムライス', '寿司', 'ラーメン'],
);
my $yuzu = +{
    name           => 'oosako',
    favorite_foods => +['ラーメン', 'カレーライス', 'ハンバーグ'],
};

# my @array = ($hash, \%tomcha, $yuzu);

my @array;
push @array, $hash, $yuzu, \%tomcha;
p @array;

my @total_favorite_foods;
for my $h (@array) {
    push @total_favorite_foods, @{$h->{favorite_foods}};
}
p @total_favorite_foods;

my %total;
for my $food (@total_favorite_foods) {
    $total{$food}++;
}
p %total;

my $rank = 1;
my $last_count;
for my $key (sort { $total{$b} <=> $total{$a} } keys %total) {
    $last_count ||= $total{$key};
    $rank++ if $last_count != $total{$key};
    print "$rank 位: $key\n";
    $last_count = $total{$key};
}
