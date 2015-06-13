#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub case_by_mask
{
   my $args = shift;
   my @string = split //, $args->{"string"};
   my @mask = split //, $args->{"mask"};

   my $index = 0;
   return join '',  map { $mask[$index] ? uc $string[$index++] : $string[$index++]} @string;
}

sub main
{
    open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
    while(my $line = <INFILE>) 
    {
        next if($line =~ m/^\s$/);  # skip blank lines
        $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
        say case_by_mask({"string" => $1, "mask" => $2}) if ($line =~ /(\w+) (\d+)/);
    }
    close(INFILE);
}

main();

