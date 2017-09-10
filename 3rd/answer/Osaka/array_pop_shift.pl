#!/usr/bin/env perl
use strict;
use warnings;

# ('Alice', 'Bob', 'Chris') という配列を作ってください。
my @peoples = ( 'Alice', 'Bob', 'Chris' );

print @peoples, "\n";

# 1の配列から 'Chris' を取り出し、出力してください。
print pop(@peoples) . "\n";

print @peoples, "\n";

# 2の配列から 'Alice' を取り出し、出力してください。
print shift(@peoples) . "\n";

print @peoples, "\n";

