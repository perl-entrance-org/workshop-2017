#!/usr/bin/env perl
use strict;
use warnings;


# 1-1-1
my $favs = {
    name => 'note103',
    favorite_foods => [ 'curry', 'rice', 'fish' ],
};

# 1-1-2
my $favs_bob = {
    name => 'Bob',
    favorite_foods => ['fruits', 'fish', 'rice', 'curry'],
};

my $favs_alice = {
    name => 'Alice',
    favorite_foods => [ 'meat', 'ramen', 'fish' ],
};

# 1-2
my @favorites = ($favs, $favs_bob, $favs_alice);

# 1-3
## まず各人の`favorite_foods`の値（配列リファレンス）だけを別の配列へ移動
my @ref_foods;
for my $favs (@favorites) {
    push @ref_foods, $favs->{favorite_foods};
}

## 上で取り出した各配列リファレンスを別の配列に統合
my @all_foods;
for my $foods (@ref_foods) {
    push @all_foods, @$foods;
}

## 統合した配列をfor文で回しつつ何回登場したか、ハッシュを使って得票数をカウント
my %foods_calcs = ();
for my $food (@all_foods) {
    $foods_calcs{$food} += 1;
}

## 得票数だけを配列に降順（だんだん小さくなっていく順）でコピー
my @votes;
for my $vote (reverse sort {$a <=> $b} values %foods_calcs) {
    push @votes, $vote;
}

## 得票数の降順に沿って、ハッシュから得票数が一致するフード名を出力
## 一度出力したフード名は再度出てこないようにdelete関数で削除
for my $vote (@votes) {
    for my $food (keys %foods_calcs) {
        if ($vote == $foods_calcs{$food}) {
            print "$vote: $food\n";
            delete $foods_calcs{$food};
        }
    }
}


__END__
# 出力結果
# ただし、得票数が同じ場合は実行する時によって順序が変わる

3: fish
2: curry
2: rice
1: ramen
1: meat
1: fruits

# 設問
# https://github.com/perl-entrance-org/workshop-2017/blob/master/3rd/practice.md#1-votepl
