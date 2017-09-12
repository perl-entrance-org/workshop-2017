#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

# 問題文のデータ構造を
# 表す%animalを作ってください。
my %dog = (
	name  => "Taro",
	color => "brown"
);
my %animal = (
	dog => \%dog,
	cat => {
		name  => "Tama",
		color => "white"
	}
);

# 中からwhite を取り出してください。
print "$animal{cat}->{color}\n";

# 余裕があれば、他の要素も取り出してみましょう。
print Dumper( \%animal ) . "\n";
