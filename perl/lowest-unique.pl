#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub lowest_unique
{
	my @array = split(/ /, $_[0]);
	my %counts;
	my $result = -1;
	
	foreach my $element (@array)
	{
		$counts{$element} = 0 if (!exists $counts{$element});
		$counts{$element} += 1;
	}

	foreach my $index (0 .. $#array)
	{
		if ($counts{$array[$index]} == 1)
		{
			$result = $index if ($result == -1 || $array[$result] > $array[$index]);
		}
	}

	return $result + 1;
}


sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		say lowest_unique($line);

	}
	close(INFILE);
}

main();

