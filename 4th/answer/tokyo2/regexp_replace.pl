#!/usr/bin/perl

use strict;
use warnings;

#my $str = "I love ruby";

my $str = "She love 109";

#$str =~ s/ruby/perl/;

$str =~ s/ (loves?) .+/ $1 Perl/;

print "$str\n";
