#!/usr/bin/env perl
use strict;
use warnings;

my %dog = (
    name => "Taro",
    color => "brown",
);

my %animal = (
    dog => \%dog,
    cat => {
        name => "Tama",
        color => "white",
    },
);

# %{ $animal{cat} }
# print ${ $animal{cat} }{color}, "\n";

print "cat color is $animal{cat}->{color}\n";

print "dog name is $animal{dog}->{name}\n";
