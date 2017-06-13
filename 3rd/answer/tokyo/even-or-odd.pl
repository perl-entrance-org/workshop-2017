#!/usr/bin/env perl
use strict;
use warnings;

print "input number? ";
my $input = <STDIN>;
chomp $input;

if ( $input % 2 == 0 ) {
    print "even\n";
} else {
    print "odd\n";
}
