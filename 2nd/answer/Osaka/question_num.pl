#!/usr/bin/env perl
use strict;
use warnings;
my $answer = 10; #　答えを予め決めておく

# 標準入力してもらう
print "number?> ";
my $input_num = <STDIN>;
chomp $input_num;

# 入力と答えの差が+-5以内かつ0じゃない場合にnearを表示
my $sa = $input_num - $answer;
if ( -5 <= $sa && $sa <= 5 && $sa != 0) {
    print "near\n";
}

# 標準入力してもらった値と$answerを比較する
if ( $input_num == $answer ) {
    # 一致している場合
    print "OK\n";
} elsif ( $input_num > $answer ) {
    # 一致していない場合で、入力の方が大きい場合
    print "too big\n";
} else {
    # 一致していない場合で、入力が大きい場合ではない場合
    print "too small\n";
}

