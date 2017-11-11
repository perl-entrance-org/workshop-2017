#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1, caller_info => 1};

while (chomp(my $input = <STDIN>)) {

    # 文字列が0の場合, ループを抜ける
    last if $input eq '0';

    # 文字列がperlないしPerlを含む場合, ｢Find Perl!｣と表示する.
    if ($input =~ m|[pP]erl|) {
        print "Find Perl!\n";
    }

    # 文字列に大文字小文字問わず, pythonの文字列が含まれる場合,
    # ｢Find Python!｣と表示する.
    if ($input =~ /python/i) {
        print "Find Python!\n";
    }

    # 文字列にperlないしrubyないしpythonが含まれる場合,
    # ｢Love Programming!｣と表示する.
    if ($input =~ /perl|ruby|python/) {
        print "Love Programming!\n";
    }

    # 文字列の先頭にpapixがある場合, ｢Find papix!｣と表示する.
    if ($input =~ /^papix/) {
        print "Find papix!\n";
    }

    # 文字列にHelloが含まれる場合,
    # その後に続く単語xxxxを使って｢Hello! xxxx!｣と表示する.
    if ($input =~ /Hello (.+)/) {
        print "Hello! $1!\n";
    }

    # 入力した文字列を正規表現として扱う
    if ('perl' =~ /$input/) {
        print 'Match!!!', "\n";
    }

    print "\n";
}
