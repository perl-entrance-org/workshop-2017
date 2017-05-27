#!/usr/bin/env perl
use strict;
use warnings;

my @number = (1..100);

for my $now  (@number){

    if ( $now %3 == 0){
        print "Fizz";
    }
    if ($now %5 ==0 ){
        print "Buzz";
    }
    print "\n";
    
}
