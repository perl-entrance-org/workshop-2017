#!/usr/bin/env perl

use strict;
use warnings;

my $alice = {
    name        => 'Alice',
    country     => 'England',
    perl        => 60,
    python      => 80,
    ruby        => 80,
    php         => 50,
    binary      => 30,
};
my $bob = {
    name        => 'bob',
    country     => 'America',
    perl        => 40,
    python      => 10,
    ruby        => 20,
    php         => 30,
    binary      => 50,
};
my $carol = {
    name        => 'Carol',
    country     => 'England',
    perl        => 100,
    python      => 70,
    ruby        => 80,
    php         => 50,
    binary      => 50,
};
my $dave = {
    name        => 'Dave',
    country     => 'Canada',
    perl        => 10,
    python      => 11,
    ruby        => 1,
    php         => 100,
    binary      => 100,
};
my $ellen = {
    name        => 'Ellen',
    country     => 'America',
    perl        => 1,
    python      => 15,
    ruby        => 0.5,
    php         => 60,
    binary      => 0.01,
};

my @persons = ($alice, $bob, $carol, $dave, $ellen);

# 2.1
for my $person ($alice, $bob, $carol, $dave, $ellen) {
    $person->{sum} = 0; # これはあってもなくてもいい
    for my $language (qw/perl python ruby php binary/) {
        $person->{sum} += $person->{$language};
    }
}

print "alice sum is " . $alice->{sum} . "\n";
print "bob sum is " . $bob->{sum} . "\n";

for my $person ($alice, $bob, $carol, $dave, $ellen) {
    print "$person->{name} sum is $person->{sum}\n";
}

# 2.2
my $average = {};
for my $language (qw/perl python ruby php binary/) {
    my $sum = 0;
    for my $person (@persons) {
        $sum += $person->{$language};
    }
    $average->{$language} = $sum / 5;
    # 5 を人の数だとしたい場合には $sum / @persons とするとよい
    # 配列は加減乗除（具体的にはスカラーコンテキスト）に置かれた場合には要素数を返す
}

use Data::Dumper;
print Dumper($average);
