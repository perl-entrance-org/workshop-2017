#!/usr/bin/env perl
use strict;
use warnings;

print "Please input a number =>";
my $left = <STDIN>;
print "\n";
print "Please input a number =>";
my $right = <STDIN>;

#改行(\n)を外す関数
chomp $left;
chomp $right;

# 足し算
print $left."+".$right."=";
print $left + $right,"\n";


# 引算
print $left."-".$right."=";
print $left - $right,"\n";

# 掛け算
print $left."*".$right."=";
print $left * $right,"\n";

# 割り算
print $left."/".$right."=";
print $left / $right,"\n";
