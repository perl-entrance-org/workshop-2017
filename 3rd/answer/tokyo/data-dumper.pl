#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper; # 最初にモジュールの使用を宣言
my $dog = {
    name => 'Taro',
    color => 'brown',
    clild => {
        name => "Magotaro",
        color => "semibrown",
    },
};
$dog->{age} = 3;
print Dumper($dog); # Data::Dumperを使ってprint
