#!/usr/bin/env perl
use strict;  #よいこのおやくそく
use warnings;
use DDP;


## Perl入学式#3 復習問題
# 1. vote.pl
# 自分の名前nameと、好きな食べ物favorite_foodsをkeyに持つハッシュリファレンスを作成してください。
# このとき、好きな食べ物のvalueは配列のリファレンスにしてください。

my $AnaTofuZ_profile = { #ハッシュリファレンスなので
    name => "AnaTofuZ", #無名ハッシュを宣言する為に{}を使う
    favorite_foods => [qw/omuraisu sushi anpan inarizushi/],
    # ハッシュは配列を持てない(スカラデータでない)ので,リファレンスをいれます
    # 配列のリファレンスは[]でいきなり作れますが qwでショートカットも出来ます
    # この場合なかでリストで展開されるので,ちゃんと入力したのと同じ意味になります
}; 

#
#同様のハッシュリファレンスを2, 3個作ってみましょう。
#（例が思い浮かばなければ、周りの人のリアルデータを使ってみましょう）
#

my $CodeHex_profile = {
    name => "CodeHex",
    favorite_foods => [qw/anpan sushi /],
};

my $Anpanman_profile = { # (c) やなせたかし
    name => "Anpanman",
    favorite_foods => [qw/anpan syokupan/],
};

my $YakumoRan_profile = {
    name => "YakumoRan",
    favorite_foods=> [qw/sushi inarizushi /],
};



#
# 1-2.リファレンスを配列に格納
#

my @profile_array = ($AnaTofuZ_profile,$CodeHex_profile,$Anpanman_profile,$YakumoRan_profile);


#
# 1-3 ランキングの表示
#
#
my $result_foods = {};

for my $people  (@profile_array){
        #ここで@profile_arrayにいれた1人1人をループの度に$peopleにいれてきます

    for  my $food (@{$people->{favorite_foods}}){
        # 3$peopleのfavorite_foodsをfoodにいれていきます
    $result_foods->{$food}++;
        #結果のハッシュを+1していきます
    }
}

my @sort_keys =(sort {$result_foods->{$b} <=> $result_foods->{$a}}(keys %{$result_foods}) );

    while ($limit >0) {
       my $now_key = shift @sort_keys;
       print;
    }

    # ソートして出力
#   print "$_ is $result_foods->{$_} points.\n";

