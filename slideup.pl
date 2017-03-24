#!/usr/bin/env perl

use v5.10;
use strict;
use warnings;

use File::Basename qw(basename dirname);
use Getopt::Long qw(:config posix_default no_ignore_case bundling auto_help);
use Pod::Usage qw(pod2usage);
require App::revealup;

use constant DEBUG => $ENV{DEBUG};

GetOptions(
    \my %opt,
    "port|p=i",
    "silent|s",
    "theme|t=s",
    "print-pdf|p",
);

my $markdown_path = shift;
if ( !$markdown_path || !-f $markdown_path ) {
    binmode STDOUT => ":encoding(cp932)" if $^O =~ m/^MSWin/;
    pod2usage(1);
}
my $markdown_filename = basename($markdown_path);

my $theme = $opt{theme};
if ( !$theme || $opt{"print-pdf"} ) {
    $theme = "original";
}

my $port = $opt{port} || 5000;

my $uri_abs = $opt{"print-pdf"} ? "/?print-pdf#/" : "/";

chdir dirname($markdown_path);

my @revealup_arg = ("serve", "--port=$port");
push @revealup_arg, "--theme=$theme" if $theme;
for my $key (qw(transition widhth height)) {
    # これらのオプションは revealup にあるので、存在すればそのまま採用
    push @revealup_arg, "--$key=$opt{$key}" if $opt{$key};
}
push @revealup_arg, $markdown_filename;


my $pid = fork // die "fork error" or do {
    # in child
    print "fork child (pid=$$)\n";
    print "\$ revealup @revealup_arg\n";
    system "revealup", @revealup_arg;
    exit;
};

# child が revealup とそれによって起こされる plackup をし終わるまでの待ちの塩梅
sleep 1;

if ( !$opt{silent} ) {
    my $url = "http://localhost:$port$uri_abs";
    print "open URL $url by default browser\n";
    if ( $^O =~ m/^MSWin/ ) {
        system "start", $url;
        # Win の start コマンドは非同期ですぐ抜けるのでこの system では止まらない
    } elsif ( $^O =~ m/linux/ ) {
        my $cmd = "";
        my @commands = qw(x-www-browser xdg-open sensible-browser gnome-open);
        if ( $ENV{BROWSER} ) {
            unshift( @commands, basename($ENV{BROWSER}) );
            # 環境変数BROWSERが存在した場合は先頭に追加する
        }
        for my $command (@commands) {
            open( my $op, "-|" ) or exec "which", $command;
            flock($op, 1);
            my ($line) = readline $op;
            close($op);
            if ( defined $line && $line !~ m/^$/ ) {
                chomp($line);
                $cmd = basename($line);
                last;
            }
        }
        if ( scalar grep { m/^${cmd}$/ } @commands ) {
            system $cmd, $url;
            # Linuxの場合はブラウザが起動していないとここで止まる
        } else {
            print "Can not open default browser.\n";
            print "Please open the browser and access to ${url}\n";
        }
    } else {
        system "open", $url;
        # Mac の open コマンドは非同期ですぐ抜けるのでこの system では止まらない
    }
}

# child の system "revealup" が終了して child が exit するまで待つ
print "child (pid=$pid) is exist. wait.\n" if kill 0 => $pid;
wait;

# 親を ^C (SIGINT) などで終了させれば child も刈り取られる

exit;

__END__

=pod

=encoding utf-8

=head1 NAME

slideup.pl - Perl入学式のスライドサーバを起動する

=head1 SYNOPSIS

  $ perl slideup.pl [--port=5000] [--theme=original] [--silent] [--print-pdf] path/to/slide.md

  普通に起動したい場合（デフォルトでブラウザも開きます）
  $ perl slideup.pl path/to/slide.md

  PDF作成モードで開きたい場合
  $ perl slideup.pl --print-pdf path/to/slide.md

=head1 DESCRIPTIONS

C<revealup> の起動コマンドを忘れがちなこともあり、それのメモ的な位置付けのスクリプトです。

=head1 OPTIONS

=head2 --port=5000 | -p 5000

ポート番号指定です。デフォルトは revealup のもの。たぶん 5000 番です。

=head2 --silent | -s

このスクリプトのデフォルトでは revealup の起動に従って open コマンドでブラウザで開きますが、
--silent オプションを付けると、ブラウザを開かないようにします。

このオプションが無い場合は revealup をバックグラウンドで開き、さらに open で指定通りにブラウザを開き、
このスクリプトはそれの終了を待ちます。

=head2 --theme | -t

テーマCSSを選択します。拡張子 css は除きます。--theme=someone と指定した場合、
引数で指定された Markdown ファイルと同じ場所に someone.css が存在すると仮定します。

=head2 --print-pdf | -p

PDF で印刷できるデザインにします。指定した Markdown ファイルと同じディレクトリに original.css が存在する必要があります。
original.css 以外の CSS を指定する場合には、上記 --theme オプションで上書きできます。

なおChromeでPDF化する場合、オプションで「背景のグラフィック」チェックボックスをオンにしましょう。

=head1 TODO

=over

=item *

Ubuntu16以外のLinuxで動作確認する

=back

=head1 AUTHOR

OGATA Tetsuji E<lt>tetsuji.ogata@gmail.comE<gt>

=cut

