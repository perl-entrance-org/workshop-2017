#!/usr/bin/perl
use strict;
use warnings;

# やり方その1
for my $num ( 1..100 ) {
    print "$num: ";
    if ( $num % 3 == 0 && $num % 5 == 0 ) {
        print "FizzBuzz\n";
    }
    elsif ( $num % 3 == 0 ) {
        print "Fizz\n";
    }
    elsif ( $num % 5 == 0 ) {
        print "Buzz\n";
    }
    else {
        print "\n";
    }
}

# やり方その2
for my $num ( 1..100 ) {
    print "$num: ";

    if ( $num % 3 == 0 ) {
        print 'Fizz';
    }
    if ( $num % 5 == 0 ) {
        print 'Buzz';
    }
    print "\n";
}
