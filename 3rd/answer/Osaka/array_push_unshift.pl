#!/usr/bin/env perl
use strict;
use warnings;

# ('Alice', 'Bob', 'Chris') という配列を作ってください。
my @peoples = ( 'Alice', 'Bob', 'Chris' );

# 1の配列の末尾に Diana を追加し、
# ('Alice', 'Bob', 'Chris', 'Diana') という配列を作ってください。
push @peoples, 'Diana';

# 2の処理に続けて、配列の最初に Eve を追加し、
# ('Eve', 'Alice', 'Bob', 'Chris', 'Diana') という配列を作ってください。
unshift @peoples, 'Eve';

# 3の配列をfor文で出力してみましょう。
for my $name (@peoples) {
	print "$name\n";
}

