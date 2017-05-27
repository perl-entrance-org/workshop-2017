#!/usr/bin/env perl
use strict;
use warnings;

my $answer = 'perl';

print "input string =>";

my $input = <STDIN>;
chomp $input;

print "$answer\n";
print "$input\n";

if ( $answer eq $input) {
    print "OK!\n";
} else {
    print "NG!\n";
}
