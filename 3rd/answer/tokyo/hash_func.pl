#!/usr/bin/env perl
use strict;
use warnings;

my %my_profile = (
    name => "myname",
    age => 18,
    food => "sushi",
);

print "keys: " . join(",", keys %my_profile) . "\n";

# for my $key (keys %my_profile) {
#     print "key: $key\n";
# }

delete $my_profile{age};

if ( exists $my_profile{age} ) {
    print "Age is exist.\n";
} else {
    print "Age is not exist.\n";
}
