#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

use Encode;

binmode STDOUT, ':utf8';

my %count;

$_ = <>; undef $_; # 最初の行は見出し行なので捨てる

while(<>) {
    chomp;
    my @fields = split /,/, decode('shiftjis', $_);
    next if $fields[4] eq '参加キャンセル';
    my $dainanbu = $fields[6] || '未回答';
    $count{$dainanbu}++;
}

for my $dainanbu (sort keys %count) {
    print "$dainanbu\t$count{$dainanbu}\n";
}
