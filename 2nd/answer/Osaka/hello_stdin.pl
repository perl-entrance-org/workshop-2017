#!/usr/bin/env perl
use strict;
use warnings;

# Your Name? を表示
print 'Your Name?> ';
# 標準入力させる
my $name = <STDIN>;

# 入力されたものを表示する
chomp $name;
print "Hello $name!\n"; 

#-------------------------
print 'Your OS?> ';
# 標準入力させる
my $OS = <STDIN>;
# 入力されたものを表示する
chomp $OS; #入力されたものには改行が入っているので改行消す
print "$OS is useful OS!\n"; 





