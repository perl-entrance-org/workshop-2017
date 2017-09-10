#!/usr/bin/env perl
use strict;
use warnings;

# 入力値を受け取ります。
my $input = <STDIN>;

# 末尾の改行コードを除去します。
chomp($input);

# 偶数は"even"、奇数は"odd"を出力します。
if ( ( $input % 2 ) == 1 ) {

	# 奇数
	print "odd\n";
}
else {
	# 偶数
	print "even\n";
}
