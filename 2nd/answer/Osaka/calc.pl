#!/usr/bin/env perl
use strict;
use warnings;

# 標準入力1個目
print 'number1?> ';
my $num1 = <STDIN>;
chomp $num1;

# 標準入力2個目
print 'number2?> ';
my $num2 = <STDIN>;
chomp $num2; 

# 計算結果を変数に入れておく 
my $wa   = $num1 + $num2;
my $sa   = $num1 - $num2;
my $seki = $num1 * $num2;
my $sho  = $num1 / $num2;

# 出力
print "$num1 + $num2 = $wa\n";
print "$num1 - $num2 = $sa\n";
print "$num1 * $num2 = $seki\n";
print "$num1 / $num2 = $sho\n";

# printするときに計算も一緒にする方法
print "$num1 + $num2 = ". ( $num1 + $num2 ) ."\n";




