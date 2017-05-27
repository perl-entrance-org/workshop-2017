#!/usr/bin/env perl
use strict;
use warnings;

my $answer = 225;

my $input = <STDIN>;
chomp $input;
if ( $answer == $input) {
    print "OK!\n";
} elsif ( $input > $answer){
    print "BIG!\n";

} elsif ( ${answer}-5 <= $input && $input <=${answer}+5 ){
    print "near\n";

} elsif ( $input > $answer){
    print "too big!\n";
} else{
    print "too small\n";
}


