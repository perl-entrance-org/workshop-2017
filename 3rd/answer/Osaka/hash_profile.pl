#!/usr/bin/env perl
use strict;
use warnings;

# 自分の名前 (name)、年齢 (age)、
# 好きな食べ物 (food) を key にした
# ハッシュ %my_profile を作ってください
my %my_profile = (
	name => "NyName",
	age  => 20,
	food => "soba"
);

# key である name, age, food を使って、
# それぞれの value を出力してください。
print "Name\t: " . $my_profile{name} . "\n";
print "Age\t: " . $my_profile{age} . "\n";
print "Food\t: " . $my_profile{food} . "\n";

