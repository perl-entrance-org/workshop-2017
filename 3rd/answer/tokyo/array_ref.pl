#!/usr/bin/env perl
use strict;
use warnings;

my @dog = ('shiba', 'bulldog');
my @animal = (
    \@dog, # 枝葉の配列を明示する方法
    ['mike', 'abyssinian'], # 直接無名配列でリファレンス生成する方法
    # ↑ どちらでも OK
    ['eagle', 'crow'],
);

# @{ $animal[2] }
# ${ $animal[2] }[0]

print "=== $animal[2]->[0]\n";


print "today neko is $animal[1]->[1]\n";
