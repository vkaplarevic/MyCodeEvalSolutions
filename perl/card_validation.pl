#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub validate
{
    my @digits = split //, shift;
    my $double_it = 0;
    my $sum = 0; 

    for(my $i = $#digits; $i >= 0; $i-=1)
    {
        my $val += $double_it ? 2 * $digits[$i] : $digits[$i];
        if ($val >= 10)
        {
            my @tmp = split //, $val;
            $val = $tmp[0] + $tmp[1];
        }
        $sum += $val;
        $double_it = !$double_it;
    }

    return $sum % 10 == 0 ? "1" : "0";
}

sub main
{
    open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
    while(my $line = <INFILE>) 
    {
        next if($line =~ m/^\s$/);  # skip blank lines
        $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
        
        $line = join("", split / /, $line);
        say validate $line;

    }
    close(INFILE);
}

main();

