#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub details
{
    my @elements = split /,/, shift;
    my $min = 50000000;

    foreach my $element (@elements)
    {
        if ($element =~ /X+(\.*)Y+/)
        {
            my $tmp = length($1);
            $min = $tmp if ($tmp < $min);
        }
    }
    
    return $min;
}

sub main
{
    open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
    while(my $line = <INFILE>) 
    {
        next if($line =~ m/^\s$/);  # skip blank lines
        $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
   
        say details $line;
    }
    close(INFILE);
}

main();

