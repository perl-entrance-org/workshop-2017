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
    name        => 'Bob',
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
    perl        => 60,
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


# 2-1
my @people = ($alice, $bob, $carol, $dave, $ellen);
my @language = ('perl', 'python', 'ruby', 'php', 'binary');

my $sum_count = 0;
for my $member (@people) {
    for my $lang (@language) {
        $sum_count += $member->{$lang};
    }
    $member->{sum} = $sum_count;
    $sum_count = 0;
}
print Dumper \@people;


# 2-2
my $average = {};
my @lang_for_average = ('perl', 'python', 'ruby');

$sum_count = 0;
for my $member (@people) {
    for my $lang (@lang_for_average) {
        $sum_count += $member->{$lang};
    }
    $average->{$member->{name}} = $sum_count / (scalar(@lang_for_average));
    $sum_count = 0;
}
print Dumper $average;


# 2-3
my $result = {};

for my $member (@people) {
    for my $lang (@language) {
        if ($member->{$lang} == 100) {
            $result->{$member->{name}}{$lang} = '*****';
        }
        elsif ($member->{$lang} >= 80) {
            $result->{$member->{name}}{$lang} = '****';
        }
        elsif ($member->{$lang} >= 60) {
            $result->{$member->{name}}{$lang} = '***';
        }
        elsif ($member->{$lang} >= 40) {
            $result->{$member->{name}}{$lang} = '**';
        }
        elsif ($member->{$lang} >= 20) {
            $result->{$member->{name}}{$lang} = '*';
        }
        else {
            $result->{$member->{name}}{$lang} = '';
        }
    }
}
print Dumper $result;


# 2-4
my $highscore = {};
my @countries = ('England', 'America', 'Canada');
my $count = 0;

for my $country (@countries) {
    for my $member (@people) {
        if ($country eq $member->{country}) {
            if ($member->{perl} >= 60) {
                $highscore->{$member->{country}}[$count] = $member->{name};
                $count++;
            }
        }
    }
    $count = 0;
}
print Dumper $highscore;


# 2-5
my $people_count = scalar(@people);

print "[\n";
for my $member (@people) {
    print "  {\n";
    for my $key (keys %$member) {
        print "    \"$key\": $member->{$key}\n";
    }
    $people_count--;
    if ($people_count > 0) {
        print "  },\n";
    }
    else {
        print "  }\n";
    }
}
print "]";



__END__
# 設問
# https://github.com/perl-entrance-org/workshop-2017/blob/master/3rd/practice.md#2-scorepl

# 2-1の出力結果
$VAR1 = [
          {
            'perl' => 60,
            'python' => 80,
            'sum' => 300,
            'country' => 'England',
            'name' => 'Alice',
            'php' => 50,
            'binary' => 30,
            'ruby' => 80
          },
          {
            'perl' => 40,
            'python' => 10,
            'sum' => 150,
            'country' => 'America',
            'name' => 'bob',
            'php' => 30,
            'binary' => 50,
            'ruby' => 20
          },
          {
            'ruby' => 80,
            'python' => 70,
            'perl' => 100,
            'name' => 'Carol',
            'sum' => 350,
            'country' => 'England',
            'binary' => 50,
            'php' => 50
          },
          {
            'sum' => 222,
            'country' => 'Canada',
            'name' => 'Dave',
            'perl' => 10,
            'python' => 11,
            'php' => 100,
            'binary' => 100,
            'ruby' => 1
          },
          {
            'binary' => '0.01',
            'php' => 60,
            'python' => 15,
            'perl' => 1,
            'name' => 'Ellen',
            'sum' => '76.51',
            'country' => 'America',
            'ruby' => '0.5'
          }
        ];

## 2-2の出力結果
$VAR1 = {
          'Bob' => '23.3333333333333',
          'Alice' => '73.3333333333333',
          'Dave' => '7.33333333333333',
          'Ellen' => '5.5',
          'Carol' => '83.3333333333333'
        };

## 2-3の出力結果
$VAR1 = {
          'Dave' => {
                      'binary' => '*****',
                      'php' => '*****',
                      'perl' => '',
                      'ruby' => '',
                      'python' => ''
                    },
          'Carol' => {
                       'perl' => '*****',
                       'ruby' => '****',
                       'python' => '***',
                       'binary' => '**',
                       'php' => '**'
                     },
          'Ellen' => {
                       'binary' => '',
                       'php' => '***',
                       'python' => '',
                       'ruby' => '',
                       'perl' => ''
                     },
          'Bob' => {
                     'binary' => '**',
                     'php' => '*',
                     'python' => '',
                     'ruby' => '*',
                     'perl' => '**'
                   },
          'Alice' => {
                       'binary' => '*',
                       'php' => '**',
                       'python' => '****',
                       'perl' => '***',
                       'ruby' => '****'
                     }
        };

# 2-4の出力結果
$VAR1 = {
          'Canada' => [
                        'Dave'
                      ],
          'England' => [
                         'Alice',
                         'Carol'
                       ]
        };

# 2-5の出力結果
[
  {
    "name": Alice
    "sum": 300
    "python": 80
    "perl": 60
    "php": 50
    "country": England
    "ruby": 80
    "binary": 30
  },
  {
    "binary": 50
    "perl": 40
    "python": 10
    "sum": 150
    "name": Bob
    "ruby": 20
    "country": America
    "php": 30
  },
  {
    "binary": 50
    "country": England
    "php": 50
    "ruby": 80
    "name": Carol
    "sum": 350
    "perl": 100
    "python": 70
  },
  {
    "binary": 100
    "country": Canada
    "php": 100
    "ruby": 1
    "sum": 272
    "name": Dave
    "python": 11
    "perl": 60
  },
  {
    "php": 60
    "country": America
    "ruby": 0.5
    "name": Ellen
    "sum": 76.51
    "perl": 1
    "python": 15
    "binary": 0.01
  }
]
