#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

# 問題文のデータ構造を
# 表す@animalを作ってください。
my @dog = ( 'shiba', 'bulldog' );
my @cat = ( 'mike',  'abyssinian' );
my $dog_ref = \@dog;
my @animal = ( $dog_ref, \@cat, [ 'eagle', 'crow' ] );

# eagleを取り出してください。
print "$animal[2]->[0]\n";

# 余裕があれば、
# 他の要素も取り出してみましょう。
print Dumper( \@animal );

# print Dumper(@animal);

