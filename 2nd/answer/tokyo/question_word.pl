#!/usr/bin/env perl
use strict;
use warnings;
my $answer = 'perl'; # 好きな文字を入力しておく

print "言葉合わせゲームの単語はなんでしょう> ";
my $input = <STDIN>;
chomp $input;

if ( $input eq $answer ) {
    print "OK\n";
} else {
    print "NG\n";
}
