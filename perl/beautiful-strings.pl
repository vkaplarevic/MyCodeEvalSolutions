#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub max_beauty
{
	my @text = split //, shift;
	my $sum = 0;
	my $beauty = 26;
	my %hist;

	foreach my $c (@text)
	{
		if ($c =~ /[a-z]/)
		{	
			if (!exists $hist{$c})
			{
				$hist{$c} = 0;
			}
			$hist{$c} += 1;
		}
	}

	# Sort all the key accouring to their occurance count...	
	my @keys = sort {$hist{$b} <=> $hist{$a}} keys %hist;
	foreach my $key (@keys)
	{
		$sum += $hist{$key} * $beauty;
		$beauty -= 1;
	}
	return $sum;
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		$line = lc $line;

		say max_beauty $line;
	}
	close(INFILE);
}

main();

