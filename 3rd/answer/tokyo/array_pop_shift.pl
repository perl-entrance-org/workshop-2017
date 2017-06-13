#!/usr/bin/env perl
use strict;
use warnings;

# 次の処理をする array_pop_shift.pl を作りましょう。
# ('Alice', 'Bob', 'Chris') という配列を作ってください。
my @people = ('Alice', 'Bob', 'Chris');
# 1の配列から 'Chris' を取り出し、出力してください。
my $person = pop @people;
print "2. person is $person\n";
# 2の配列から 'Alice' を取り出し、出力してください。
my $person2 = shift @people;
print "3. person is $person2\n";
