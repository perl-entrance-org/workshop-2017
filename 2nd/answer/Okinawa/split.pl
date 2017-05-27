#!/usr/bin/env perl
use strict;
use warnings;

my $message = "There's more than one way to do it.";

my @array1;

@array1 = split / /,$message;

my $message2 = 'Perl入学式,お疲れ様でした';

my @arra2 = split /,/,$message2;

for  (@arra2){
    print "$_\n";
}
