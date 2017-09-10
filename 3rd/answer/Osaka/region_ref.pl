#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

# 問題文のデータ構造を
# 表す%japanを作ってください。
my %japan = (
	tokyo    => [ 'gotanda', 'shibuya' ],
	osaka    => ['shinsaibashi'],
	okinawa  => [ 'naha',    'yomitan' ],
	hokkaido => [ 'sapporo', 'obihiro' ],
	fukuoka  => ['hakata']
);

# gotanda と sapporo を出力してください。
print "$japan{tokyo}->[0]\n";
print "$japan{hokkaido}->[0]\n";

# osaka の中に umeda を追加してください。
print "### $japan{osaka} \n";
#push $japan{osaka}, 'umeda';
push @{ $japan{osaka} }, 'umeda';

# Data::Dumper を使って
# %japan 全体の中身を出力してください。
print Dumper( \%japan );

