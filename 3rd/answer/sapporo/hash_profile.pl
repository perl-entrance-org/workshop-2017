#!/usr/bin/env perl
use strict;
use warnings;

my %hash = (
    name => 'my name',
    age  => 51,
    food => 'Sushi',
);

print 'name ->' . $hash{name} . "\n";
print 'age  ->' . $hash{age} . "\n";
print 'food ->' . $hash{food} . "\n";
