#!/usr/bin/env perl
use strict;
use warnings;
my $answer = 'yuki'; # 答えを予め決めておく

# 標準入力してもらう
print 'what is my name?> '; # 問題を表示
my $input_answer = <STDIN>;
chomp $input_answer;

# 入力してもらったものが、予め決めておいた答えと一致するか比較し
# 一致したらOK表示,一致しなければNG表示
if ( $input_answer eq $answer ) {
   print "OK\n";
}
else {
   print "NG\n";
}

