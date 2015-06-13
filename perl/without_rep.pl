#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;



sub without_repetition
{   
    my @chars = split //, shift;
    my @result;
    my $index = 1;
    my $prev = $chars[0];

    push @result, $chars[0]; 
    while ($index <= $#chars)
    {
        push @result, $chars[$index] if ($prev ne $chars[$index]);
        $prev = $chars[$index++];
     }

    return join '', @result;
}

sub main
{
    open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
    while(my $line = <INFILE>) 
    {
        next if($line =~ m/^\s$/);  # skip blank lines
        $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces

        say without_repetition $line;

    }
    close(INFILE);
}

main();

