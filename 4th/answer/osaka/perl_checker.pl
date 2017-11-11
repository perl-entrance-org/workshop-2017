#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1, caller_info => 1};

sub perl_checker {
    my $str = shift;
    if ($str =~ /[pP]erl/) {
        print "Perl Monger!";
    }
    print "\n";
}

perl_checker('PERL');
perl_checker('Perl');
perl_checker('perl');
perl_checker('ruby');
