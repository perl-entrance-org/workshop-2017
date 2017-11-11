#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1, caller_info => 1};

sub output_array_and_hash {
    my ($array, $hash) = @_;
    p $array;
    p $hash;

    # 配列
    print '配列の中味', "\n";
    for my $str (@{$array}) {
        print qq{$str\n};
    }

    # ハッシュ
    print qq{ハッシュの中味\n};
    for my $key (keys %{$hash}) {
        print qq{$key => $hash->{$key}\n};
    }
}

output_array_and_hash(+[1, 2, 3], +{key1 => 'value1', key2 => 'value2'});
