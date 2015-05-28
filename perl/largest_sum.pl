#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

sub largest_sum
{
	my @array = split /,/, shift;
	my $sum = 0;
	my $maxsum = -100000;

	foreach my $number (@array)
	{
		$sum += $number;
		if ($maxsum < $sum)
		{
			$maxsum = $sum;
		}

		if ($sum < 0)
		{
			$sum = 0;
		}
	}
	
	return $maxsum;
}


sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		say largest_sum($line);
	}
	close(INFILE);
}

main();

