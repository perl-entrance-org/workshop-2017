#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

use Getopt::Long qw(:config posix_default no_ignore_case bundling auto_help);
use Encode;

binmode STDOUT, ':utf8';

GetOptions(
    \my %opt,
    "delta-1st=i", "delta-2nd=i", "delta-3rd=i",
);

my %count;

$_ = <>; undef $_; # 最初の行は見出し行なので捨てる

while(<>) {
    chomp;
    my @fields = split /,/, decode('shiftjis', $_);
    next if $fields[4] eq '参加キャンセル';
    my $dainanbu = $fields[6] || '未回答';
    $count{$dainanbu}++;
}

for my $nth_kv (["delta-1st", 1], ["delta-2nd", 2], ["delta-3rd", 3]) {
    my ($option, $n) = @$nth_kv;
    my $delta = $opt{$option} or next;
    $count{"第${n}部"} += $delta;
}

for my $dainanbu (sort keys %count) {
    print "$dainanbu\t$count{$dainanbu}\n";
}

=pod

=encoding utf8

=head1 NAME

entrance-dainanbu.pl - Perl入学式第1回の Connpass アンケートから部ごとの参加集計

=head1 SYNOPSIS

  ./entrance-dainanbu.pl event_1234567_paticipants.csv
  curl ... | ./entrance-dainanbu.pl
  curl ... | ./entrance-dainanbu.pl --delta-1st=-2 --delta-2nd=1 --delta-3rd=1

=head1 OPTIONS

=head2 --delta-1st=NUM --delta-2nd=NUM --delta-3rd=NUM

各部の増減を整数で指定。集計時に増減される。

=head1 AUTHOR

OGATA Tetsuji E<lt>tetsuji.ogata@gmail.comE<gt>

=cut
