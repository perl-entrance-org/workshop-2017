#!/usr/bin/env perl
use strict;
use warnings;
my $answer = 42; # 好きな値を入力しておく

print "数字合わせゲームの単語はなんでしょう> ";
my $input = <STDIN>;
chomp $input;

if ( $input == $answer ) {
    print "OK\n";
} elsif ( -5 <= $input - $answer && $input - $answer <= 5 ) {
    print "near\n";
} elsif ( $input < $answer ) {
    print "too small\n";
} elsif ( $input > $answer ) {
    print "too big\n";
} else {
    print "NG\n";
}
