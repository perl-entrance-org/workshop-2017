# Perl入学式 \#4 復習問題

## calc.pl
2つの数値を引数に取り, 以下の機能を持つ関数 `calc` を作成してください.  

1. `add`, `sub`, `mul`, `div`, `mod` という key と、それぞれの演算結果（+, -, *, /, %）を value に持つハッシュリファレンスを返す.
2. 引数が数字であるかどうか正規表現を使って判定する.
3. 数値以外が引数であった場合は `undef` を返す.

## food.pl
    my $data = q{
    papix : sushi
    moznion : soba
    boolfool : sushi
    macopy : sushi
    };

[food.pl](https://github.com/perl-entrance-org/workshop-2013-04/blob/master/food.pl) では, 上記のように, `$data` に人物名と好きな食べ物を `(スペース):(スペース)` 区切りで与えています.  
この変数から食べ物が何回出現したかカウントして表示させてください.

- はじめに `$data` を改行ごとに `split` するとよいでしょう
- 分割後, 正規表現により必要な文字列を抽出してください

