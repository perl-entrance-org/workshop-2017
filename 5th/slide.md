# Perl入学式
### 第5回 Webアプリ編

___
## 諸注意
- 会場について
    - 飲食・喫煙・トイレetc
- 写真撮影について
    - 写真撮影NGな方はお手数ですが申し出てください

___
## 紹介
- 講師・サポーター紹介

___
## 本日の内容
### Mojolicious を使って Web アプリケーションを作ろう!
- Mojolicious の準備
- HTTP の基礎
- Mojolicious 入門
- 簡易 BBS の作成

___
## 皆さんで自己紹介

---
# Mojolicious の準備

___
## モジュールのインストールについて
  第1回目で Term::ANSIColor モジュールを使いましたが、それは全ての Perl に最初から入っているモジュールでした。
  これから使っていく Mojolicious は外部から追加しなくてはならないモジュールです。
  モジュールのインストール方法は様々な方法がありますが、この講義では local::lib と cpanm を使って入れることにします。

___
##  local::lib と cpanm (cpan minus)
  local::lib は、モジュールを自分のホームディレクトリで管理することができるモジュールです。
  local::lib を使うことで、システム全体への影響を抑えつつ自分の好きなモジュールを使うことができます。

  cpanm (cpan minus) とは CPAN からモジュールをダウンロードしてインストールするプログラムです。
  通常は perl が入っているディレクトリにモジュールをインストールしますが、`-l` オプションを指定することで任意のディレクトリにインストールすることが可能です。
  この講義では、自分のホームディレクトリ配下にモジュールをインストールします。

___
## Mojolicious のインストール

以下のコマンドを一つずつ打っていきます。

```
$ curl -L cpanmin.us -o cpanm
$ chmod +x cpanm
$ ./cpanm -l ~/extlib local::lib
$ perl -I ~/extlib/lib/perl5 -Mlocal::lib=~/extlib | tee -a ~/.bash_profile
$ exec $SHELL -l
$ ./cpanm -n Mojolicious
```
___
## インストールに成功したかのチェック

以下のコマンドで Mojolicious のバージョンが出力されればインストール成功です。

```
$ perl -MMojolicious -e 'print "$Mojolicious::VERSION\n"'
```

___
## Mojolicious とは？
- Perl の Web アプリケーションフレームワーク（WAF）です。
- MVCフレームワークの、Modelを除いた（ViewとControllerの）機能を持っています。
- Perl 5.10.1 以降で動作します。

___
## Mojoliciousの資料
- 本家
    - [mojolicious.us](http://mojolicio.us/)
- 日本語訳
    - [Mojoliciousドキュメント 日本語訳](https://github.com/yuki-kimoto/mojolicious-guides-japanese/wiki)

---
# HTTP の基礎

___
## HTTPとは？
- ``HyperText Transfer Protocol``のことです。
- Web ブラウザと Web サーバの間でコンテンツの送受信を行うための通信手順（プロトコル）です。

___
## HTTP のメソッド
よく使うのは以下の2つです。

### GET
- （主に）サーバからデータを取得する

### POST
- （主に）サーバにデータを送信する

---
# Mojolicious の ひな形

___
## 最初に
- この入門では、難しい表現を避けるために、厳密には正しくない事も書いてあります。
- この入門に書いていない沢山の引数やコマンドについては、本家サイトなどのリファレンスをご覧ください。

___
## ひな形を作る
```
$ mojo generate lite_app hello.pl
```

- Mojoliciousをインストールすると、``mojo``というコマンドが使えるようになります。
- ``mojo generate lite_app``と入力すると、``Mojolicious::Lite``を使ったひな形を作成してくれます。
- ``hello.pl``は作成するファイル名です。
- 現在のディレクトリに``hello.pl``というファイルが作成されているか確認して下さい。

___
## 起動してみる
```
$ morbo hello.pl
```

- Mojoliciousをインストールすると、``morbo``というコマンドも使えるようになります。
- ``morbo``は開発用のアプリケーションサーバーを起動してくれます。
- 画面上に``Server available at http://127.0.0.1:3000.``と表示されれば起動しています。
- Web ブラウザで ``http://127.0.0.1:3000`` にアクセスしてみましょう。

___
## コード解説
- 勉強会では、ひな形のソースコードの解説については省略します。

___
## コード解説（Line 1 - 2）
```
#!/usr/bin/env perl
use Mojolicious::Lite;
```

- ``Mojolicious::Lite`` は ``Mojolicious`` を簡単に使うためのモジュールです。
- `use Mojolicious::Lite;` とすることで、自動的に``strict``、``warnings``、``utf8``、``Perl 5.10 feature``が有効になります。

___
## コード解説（Line 1 - 2）
```
use strict;
use warnings;
use utf8;
use feature ':5.10';
```

- つまり、``use Mojolicious::Lite;``を書くだけで、ついでに上記のように書いているのと同じということです。

___
## コード解説（Line 4 - 5）
    # Documentation browser under "/perldoc"
    plugin 'PODRenderer';

- ``Mojolicious``では、機能を拡張するプラグインが利用できます。
- ここでは、``Mojolicious::Plugin::PODRenderer``を使用しています。
- ``http://127.0.0.1:3000/perldoc``にアクセスすると``Mojolicious``のPODを読むことができます。
- ［参考資料］
    - [Mojolicious::Plugin::PODRendererが便利 - Qiita](http://qiita.com/mozquito/items/1eabbb8ac7b1e516492f)

___
## コード解説（Line 7 - 10）
```
get '/' => sub {
  my $c = shift;
  $c->render(template => 'index');
};
```

- ウェブアプリケーションでは、URLごとに処理を変更できると便利です。
- このようなURLごとに処理を振り分ける機能のことを``router``や``dispatcher``と呼びます。
- ``Mojolicious::Lite``では、HTTPのGETリクエスト用の``router``として``get``という関数が用意されています。

___
## コード解説（Line 7 - 10）
```
get '/' => sub { ... };
```

- 見慣れない書き方ですが、これは、``get``という関数に、2つの引数を渡しているだけです。
- 一つ目の引数が``'/'``という文字列、二つ目の引数がコードリファレンスです。
- このように書くことで、HTTPのGETメソッドで``/``にアクセスした時の処理を``sub { ... }``に書くことができます。

___
## コード解説（Line 7 - 10）
```
my $c = shift;
$c->render(template => 'index');
```

- コードリファレンスの最初の行は、フレームワークのコントローラーを受け取っています。
- コントローラーには``render``というメソッドがあり、どのような出力をするのかを書くことができます。
- ここでは``index``のテンプレートを使用して出力するように書いています。

___
## コード解説（Line 12）
```
app->start;
```

- ``Mojolicious::Lite``を使う場合は、コードの最後にこの命令文を書かなければいけません。

- 当面は「お約束」として覚えておけばよいでしょう。

___
## コード解説（Line 13）
```
__DATA__
```

- ``__DATA__``以降は文字通りデータとして使えます。Mojolicious::Liteでは、ここにテンプレートなどを書いておくことができます。

___
## コード解説（Line 15）
```
@@ index.html.ep
```

- ``Mojolicious::Lite``では、``@@ index.html.ep``と書いておくと、次に``@@``が出てくるまでの範囲を``index.html.ep``というファイルとして扱うことができます。このようにすれば、多くのファイルを必要とせずにプログラムを書くことができます。
- ``ep``は、Mojoliciousの標準的なテンプレート機能を使用するための拡張子です。拡張子を``ep``にすることで、テンプレートであることを示します。

___
## コード解説（Line 16 - 18）
```
% layout 'default';
% title 'Welcome';
Welcome to the Mojolicious real-time web framework!
```

- ``%``は、その行をPerlのコードとして実行したい時に書きます。ここでは出てきませんがHTMLタグのように``<% Perlのコード... %>``と書くこともできます。
- Mojoliciousの標準的なテンプレートでは、このように書くとテンプレートの中でPerlのコードが実行できます。
- なお、``%``では、その行全体がPerlのコードとして扱われますが、``<% ... %>``の場合は、``...``の部分のみがPerlのコードとして扱われます。

___
## コード解説（Line 16 - 18）
- ``layout``はレイアウトを指定します。ここでは``default``を指定しています。（後ほど詳しく説明します）
- ``title``はタイトルを指定します。ここでは``Welcome``を指定しています。（後ほど詳しく説明します）
- それ以外の通常の文字列は、そのままHTMLとして表示されます。

___
## コード解説（Line 20）
```
@@ layouts/default.html.ep
```

- ``@@``が書いてあるので、これ以降は``layouts/default.html.ep``として扱われます。この文字列はパス扱いなので、``layouts``ディレクトリにある``default.html.ep``というファイルを示します。
- ``Mojolicious::Lite``では、``layouts``ディレクトリ内にレイアウト用のテンプレートを用意でき、``layout``コマンドで切り替えて使うことができます。
- 先のコードで``% layout 'default';``と指定しましたので、``layouts``ディレクトリにある``default.html.ep``をレイアウトとして使用することになります。

___
## コード解説（Line 21 - 25）
```
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
```

- ``<%= ... %>``（あるいは``%=``から始まる行）は、Perlのコードを実行するだけでなく、値を表示したい時に書きます。
- ``<%= title %>``は、先のコードで``% title 'Welcome';``と指定したので、``Welcome``と表示されます。
- ``title``は、テンプレート内で使える関数で、このようにHTMLファイルのタイトルを取得したり設定したりできる、便利な関数です。
- ``content``は、レイアウトテンプレート内で使える関数で、通常のテンプレートの中身を取得する関数です。

---
# Mojolicious 入門

___
## 変数を渡す
    get '/' => sub {
      my $c = shift;
      $c->stash(title => 'Hello');
      $c->render('index');
    };
    % title 'Welcome'; # => 削除する

- `$c->stash` で, テンプレート内の変数に変数を渡せる

___
## 練習問題
    @@ profile.html.ep
    <html>
    <head><title><%= $name %>のプロフィール</title></head>
    <body style='padding: 30px;'>
      私の名前は<%= $name %>です.<br>
      趣味は<%= $hobby %>で, 好きなプログラミング言語は<%= $language %>です.
    </body>
    </html>

- このようなテンプレートを用意し, stash で `name`, `hobby`, `language` 変数に値を代入し, 自己紹介ページを作成しよう
    - `render` で profile テンプレートを指定しましょう

___
## テンプレートの中の特殊記号

    % if ($num1 == 1 ) { 
    %= 'hoge';
        <% if ($num2 == 1 ) { %>
            <%= $hoge %>
        <% } %>
    % }

- `%`のように, テンプレートの中で特別な意味を持つ記号がある

___
## テンプレートの中の特殊記号

    % if ($num1 == 1 ) {
        ...
    % }

- `%`が先頭にある行は, その後ろをPerlのコードとして実行する

___
## テンプレートの中の特殊記号

    %= 'hoge';

- `%=`が先頭にある行は, その後ろをPerlのコードとして実行し, その結果をテンプレート内に直接埋め込む
    - 返り値を出力するので, `print 'hoge';`と書いてしまうと`1`になる!
    - `print`の実行結果は`1`なので...

___
## テンプレートの中の特殊記号
    <% if ($num2 == 1 ) { %>
        <%= $hoge %>
    <% } %>

- `<% ... %>`, `<%= ... %>`は, それぞれ`%`, `%=`をHTMLタグやテキストの中で使えるようにしたもの

___
## 練習問題
- `fizzbuzz`テンプレートを用意して, 1から100までのfizzbuzzを表示してみましょう
    - 但し, fizzbuzzの処理は全て`fizzbuzz`テンプレートの中に書くようにしましょう
- fizzbuzz
    - 3で割り切れる場合｢Fizz｣
    - 5で割り切れる場合｢Buzz｣
    - 3でも5でも割り切れる場合｢fizzbuzz｣
    - いずれも満たさない場合｢その数をそのまま｣

---
# 簡易 BBS の作成

___
## 雛形を作る
    $ mojo generate lite_app BBS

___
## PODRenderer
    # Documentation browser under "/perldoc" # 削除
    plugin 'PODRenderer'; # 削除

- PODRenderer は Mojolicious のプラグインで, perldoc を見れるようにするもの
- 削除する前に、[localhost:3000/perldoc](http://localhost:3000/perldoc) にアクセスしてみよう!

___
## FORM 作成
    Welcome to the Mojolicious real-time web framework! # 削除

- `index` テンプレートにある, もともとの文字列を削除する

___
## FORM 作成
    %= form_for '/' => begin
      %= text_field 'body'
      %= submit_button '投稿する'
    % end

- 削除したところに, フォームを出力するコードを書く
  - form\_for, text\_field, submit\_buttonなどは, Mojolicious のhelperという機能で定義されたPerlの関数(サブルーチン)

___
## FORM 作成
- ここまで出来たら, 保存してから, ブラウザをリロード (あるいは[http://localhost:3000](http://localhost:3000)にアクセス) してみましょう
- フォームから投稿しても画面上は何も変わりません
    - 次に, フォームから投稿された文字列を画面に表示するようにしてみよう

___
## GET
      %= submit_button '投稿する'
    % end
    <p><%= $entry %></p>

- まずは `index` テンプレートを上記のように変更する
- `<%= $entry %>` は, テンプレート内の変数

___
## GET
    get '/' => sub {
      my $c = shift;
      my $entry = $c->param('body'); # 追加
      $c->render('index');
    };

- form の情報を取得するために, 上記のように 1 行追加する
- `$c->param('body')` は フォームから投稿した `body` という名前の値を取得する

___
## GET
    get '/' => sub {
      my $c = shift;
      my $entry = $c->param('body');
      $c->stash(entry => $entry); # 追加
      $c->render('index');
    };

- 取得した情報をテンプレートに渡すため, `$c->stash(entry => $entry)` を挿入する
- `entry` に変数 `$entry` を渡したので, テンプレートで `$entry` が使用可能になる

___
## GET
- ここまで出来たら, 保存してからブラウザをリロード (あるいは[http://localhost:3000](http://localhost:3000)にアクセス) してみよう
- フォームに文字を入力して, ｢投稿する｣ボタンをクリックしてみよう!

___
## POST
- 先ほどのフォームは, HTTP でいうところのGETメソッドを利用してデータを送信していました
- GET でのリクエストは文字数の制限(おおよそ 2KB 程度)があるので、掲示板のような多くのデータを送信する必要がある場合は適当ではありません
  - このような場合, POST によるリクエストを行うとよいです

___
## POST
    @@ post.html.ep
    % # 新しいテンプレートを用意する
    % layout 'default';
    % # タイトルを変更
    % title '出力';
    % # 投稿先などを変更
    %= form_for '/post' => method => 'POST' => begin
      %= text_field 'body'
      %= submit_button '投稿する'
    % end
    <p><%= $entry %></p>

- `index.html.ep` の部分をコピーして, `post.html.ep` というテンプレートを作成する
- `form_for` に書いた `method => 'POST'` で, get ではなく post で送信するようになる

___
## POST
    @@ index.html.ep
    % layout 'default';
    % # タイトルを変更
    % title '入力フォーム';
    % # 投稿先などを変更
    %= form_for '/post' => method => 'POST' => begin
      %= text_field 'body'
      %= submit_button '投稿する'
    % end

- `@@ index.html.ep` では, `$entry` を表示させないようにする
- その他, メソッドやタイトルも変更しておこう

___
## POST
    get '/' => sub {
      my $c = shift;
      $c->render('index');
    };

    post '/post' => sub {
      my $c = shift;
      my $entry = $c->param('body');
      $c->stash(entry => $entry);
      $c->render('post');
    };

- perl コードも変更しよう
  - 細々とした違いに注意!

___
## POST
- ここまで出来たら, 保存してから, ブラウザをリロード (あるいは[http://localhost:3000](http://localhost:3000)にアクセス) してみよう
- フォームに長い文字を入力して, ｢投稿する｣ボタンをクリックしてみよう!

___
## 記事を蓄える
- 記事を蓄えるための方法としては, いくつかの方法がある
    - DB (データベース) を利用
    - 外部ファイルに書き込み保存
- 今回は時間の制約上, データを蓄える方法として, **配列**を用いる
    - 言うまでもなく, 配列は Web アプリケーションが停止した時点で全てのデータが消えるので, 現実的ではない!
    - `MySQL`や`SQLite`などのデータベースを使うのがオススメです

___
## 記事を蓄える
    @@ index.html.ep
    % layout 'default';
    % title '入力フォーム';
    %= form_for '/post' => method => 'POST' => begin
      %= text_field 'body'
      %= submit_button '投稿する'
    % end
    % for my $entry (@{$entries}) {
        <p><%= $entry %></p>
    % }

- テンプレートに, 投稿済みの記事( `$entries` に格納されている )を表示するよう変更を加える

___
## 記事を蓄える
    my @entries = (); # 空の配列を宣言
    get '/' => sub {
      my $c = shift;
      $c->stash(entries => \@entries); # 配列のリファレンスをテンプレートに渡す
      $c->render('index');
    };

    post '/post' => sub {
      my $c = shift;
      my $entry = $c->param('body');
      push @entries, $entry; # 配列に格納
      $c->stash(entry => $entry);
      $c->render('post');
    };

___
## 記事を蓄える
- ここまで出来たら, 保存してから, ブラウザをリロード (あるいは[http://localhost:3000](http://localhost:3000)にアクセス) してみよう
- 文字の投稿をいくつか繰り返した後に, [http://localhost:3000](http://localhost:3000)にアクセスしてみよう!

___
## リダイレクト
- 別のページへ遷移(移動)するための機能
    - 今回の場合, `/post`で記事を投稿した後に記事を表示するページである`/`に戻るようにする
- Mojolicious ビルトインの `redirect_to` を使用すればよい

___
## redirect\_to
    post '/post' => sub {
      my $c = shift;
      my $entry = $c->param('body');
      push @entries, $entry;
                               # '/'へ移る為、'post'へのstash は不要となるので削除
      $c->redirect_to('/'); # 追加
    };

- `redirect_to` を利用して, `/`へのページ遷移を追加する
  - `post`のテンプレートはもう必要ないので, 削除しても問題ない

___
## 最終問題

- これまで作成してきた簡易 BBS を, 改造してみましょう!
- 例えば...?
    - 名前/メールアドレスを入力/表示できるようにする...
    - メールアドレスが｢age｣であれば, 記事を`push`ではなく`unshift`する...
    - テンプレートを整理して, 見た目を綺麗にする...
        - Twitter Bootstrapを使ってみる...

___
## まとめ
- 非常に簡単ではありますが, BBS (のような) Web サービスを開発してみました
    - 時間の制約上, 紹介できなかった部分 (適切な記事の蓄え方など...) が多くありますが, Perl を使った Web サービスの開発の基本的な流れは, このようになっています
    - 今日ここまで紹介してきた内容は, 基礎中の基礎です. ｢ Web サービスを作ろう!｣となると, やはりまだまだ挑戦しなければならない｢壁｣はいくつもあります
- その時困ったら, Perl入学式の資料や, スタッフを是非頼って下さい!

---
# 質問タイム

---
# お疲れさまでした
