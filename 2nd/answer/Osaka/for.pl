#!/usr/bin/env perl
use strict;
use warnings;

# 配列に何か代入する
my @array = ('hoge', 'foo', 'piyo');
# for文を使って配列の中身を出力する
for my $item ( @array ) {
    print "$item\n";
}

# 標準入力
# 入力されたものを配列に代入する
my @array2;
print "input> ";
my $input = <STDIN>;
chomp $input;
$array2[0] = $input;

print "input> ";
$input = <STDIN>;
chomp $input;
$array2[1] = $input;

for my $item ( @array2 ) {
    print "$item\n";
}
