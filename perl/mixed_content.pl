#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

sub separate
{
	my @text = split /,/, $_[0];
	my @numbers;
	my @words;

	foreach my $word (@text)
	{
		if ($word =~ /[0-9]+/)
		{
			push @numbers, $word;
		}
		else
		{
			push @words, $word;
		}
	}
	
	if ($#words == -1)
	{
		return join(",", @numbers);
	}

	if ($#numbers == -1)
	{
		return join(",", @words);
	}

	return join(",", @words) . "|" . join(",", @numbers);
}



sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		say separate($line);
	}
	close(INFILE);
}

main();

