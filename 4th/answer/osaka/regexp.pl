#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1, caller_info => 1};

my $ans = 'I love do/t';
if ($ans =~ m{do/t}) {
    print "OK.\n";
}
else {
    print "NG.\n";
}
