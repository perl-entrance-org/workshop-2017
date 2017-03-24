#!/usr/bin/perl

use strict;
use warnings;

while (chomp(my $input = <STDIN>)) {
    #print "input => $input\n";
    if ( $input eq "0" ) {
        last;
    }
    if ( $input =~ /[Pp]erl/ ){
        print "Find Perl!\n";
    }
    if ( $input =~ /python/i ) {
        print "Find Python!\n";
    }
    if ( $input =~ /perl|ruby|python/ ) {
        print "Love Programming!\n";
    }

    if ( $input =~ /papix/ ) {
        print "Find papix!\n";
    }
    if ( $input =~ /Hello (.+)/ ) {
        print "Hello! $1!\n";
    }
}
