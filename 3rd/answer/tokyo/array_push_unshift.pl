#!/usr/bin/env perl
use strict;
use warnings;

my @people = ('Alice', 'Bob', 'Chris');

push @people, 'Diana';

unshift @people, 'Eve';

for my $person (@people) {
    print "person is $person\n";
}
