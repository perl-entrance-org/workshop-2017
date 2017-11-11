#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1, caller_info => 1};

my $str = 'I love ruby';

$str =~ s/ruby/perl/;
print qq{$str\n};
