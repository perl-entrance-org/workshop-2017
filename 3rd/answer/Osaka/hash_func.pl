#!/usr/bin/env perl
use strict;
use warnings;

# keys関数を使って、hash_profile.pl で作った
# ハッシュのkeyをすべて出力してください。
my %my_profile = (
	name => "MyName",
	age  => 20,
	food => "soba"
);
print "### key list\n";
for my $key ( keys %my_profile ) {
	print "\t$key\n";
}

# delete関数を使って、1で使ったハッシュから
# 年齢(age)の要素を削除してください。
delete $my_profile{age};
print "### delete age\n";
for my $key ( keys(%my_profile) ) {
	print "\t$key => $my_profile{$key}\n";
}

# exists関数を使って、年齢の要素が
# 存在するか確認してください。
# 存在している場合は "Age is exist." 、
# 存在しない場合は "Age is not exist."
# と表示するようにしてみましょう。
print "### exists age\n";
if ( exists( $my_profile{age} ) ) {
	print "Age is exist.\n";
}
else {
	print "Age is not exist.\n";
}

