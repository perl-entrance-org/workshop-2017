#!/usr/bin/env perl
use strict;
use warnings;

# 配列の定義(1～100)
my @numbers = ( 1 .. 100 );

# for文で変数に足していきます。
my $sum = 0;
for my $number (@numbers) {
	$sum = $sum + $number;
}

print "sum: $sum\n";

