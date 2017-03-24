#!/usr/bin/perl
use strict;
use warnings;

print "input: ";
my $input = <STDIN>;
chomp $input;

for my $keyword ("foo", "bar", "I am PERL", "You are Perl", "language perl") {
    print "keyword=$keyword\n";
    perl_checker($keyword);
}

sub perl_checker {
    my $str = shift;
    if ( $str =~ /[Pp]erl/ ) {
        print "Perl Monger!\n";
    }
}
