#!/usr/bin/env perl
use strict;
use warnings;

my %hash = (
    name => 'Shinohara',
    age  => 51,
    food => 'Sushi',
);

# print keys
print "print keys: \n";
my @keys = keys %hash;
for my $s (@keys){
    print $s . "\n";
}

# delete age
print "delete age: \n";
delete $hash{age};
my @keys = keys %hash;
for my $s (@keys){
    print $s . '->' .$hash{$s} . "\n";
}

# exists age?
print "exists age: \n";
if(exists $hash{age}){
    print "Age is exist.\n";
}else{
    print "Age is not exist.\n";
}


