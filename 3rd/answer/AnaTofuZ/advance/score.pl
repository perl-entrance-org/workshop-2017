#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;

my $alice = {
    name        => 'Alice',
    country     => 'England',
    perl        => 60,
    python      => 80,
    ruby        => 80,
    php         => 50,
    binary      => 30,
};
my $bob = {
    name        => 'bob',
    country     => 'America',
    perl        => 40,
    python      => 10,
    ruby        => 20,
    php         => 30,
    binary      => 50,
};
my $carol = {
    name        => 'Carol',
    country     => 'England',
    perl        => 100,
    python      => 70,
    ruby        => 80,
    php         => 50,
    binary      => 50,
};
my $dave = {
    name        => 'Dave',
    country     => 'Canada',
    perl        => 10,
    python      => 11,
    ruby        => 1,
    php         => 100,
    binary      => 100,
};
my $ellen = {
    name        => 'Ellen',
    country     => 'America',
    perl        => 1,
    python      => 15,
    ruby        => 0.5,
    php         => 60,
    binary      => 0.01,
};


my @languages = qw[ perl python ruby php binary ];
my @people = ($alice,$bob,$carol,$dave,$ellen);

#
# 2-1 点数の合計
#


for my $human (@people){
    my $sum;

    for my $choise_language (@languages){
        $sum+=$human->{$choise_language};
    }

    $human->{sum}=$sum;
}


#
# 2-2 perl ruby pythonの平均値
#

my @ave_select_langs = qw[ perl ruby python];
my $average ={};

for my $human  (@people){
   
    for my $language (@ave_select_langs){
       $average->{$human->{name}}+=$human->{"$language"};
    }
    $average->{$human->{name}}/=@ave_select_langs;
}

print Dumper $average;

#
# 2-3 5段階評価
#
#

for my $human (@people){

    print "$human->{name}\n";

    for my $language (@languages){

       my $score = $human->{$language};
       my $avalution;

        print "\t$language\t:";

       # 割り算でとくとスタイリッシュですが,素朴にifでいきます

       if ($score == 100) {
           $avalution+=5;
       } elsif ($score >= 80) {
           $avalution+=4;
       } elsif ($score >= 60) {
           $avalution+=3;
       } elsif ($score >= 40) {
           $avalution+=2;
       } elsif ($score >= 20) {
           $avalution+=1;
       }else{
           $avalution=0;
       }

        while ($avalution > 0) {
            print '*';
            $avalution--;
        }
        
        print "\n";
    }
}

# 
# 2-4 国ごとのPerlハイスコアリスト
#

my $highscore ={};

for my $human  (@people){
    if ($human->{perl} >= 60){
        push @{$highscore->{$human->{country}}},$human->{name};
    }
}


print Dumper  $highscore;

#
# 2-5 JSON風Dumper
#

my $json_key = [keys %$alice];


print "[\n";    

for my $human (@people){
    print " {\n";    

    for my $now_key (@{$json_key}){
       
        my $information;

        if ($human->{$now_key} eq "America") {
           $information = "affiliation"; 
        } else {
            $information = $now_key;
        }

        if ($now_key eq "name" || $now_key eq "country"){

           print "   \"$information\":\"$human->{$now_key}\"\n";

       }else{

           print "   \"$information\":$human->{$now_key}\n";

       }
    }
    print " },\n";
}
print "]\n";
