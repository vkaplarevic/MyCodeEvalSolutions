#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

sub guess_the_number
{
	my $args_ref = shift;
	my $steps_ref = $args_ref->{"steps"};
	my $right = $args_ref->{"limit"};
	my $left = 0;
	my $comm;
	my $guess;
 
	while (1)
	{
		$comm = shift @{$steps_ref};
		$guess = $left + int(($right - $left + 1) / 2);

		last if ($comm eq "Yay!");

		if ($comm eq "Higher")
		{
			$left = $guess + 1;
		}
		else
		{
			$right = $guess - 1;
		}
	}

	return $guess;
}


sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) 
	{
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		
		my @tmp = split / /, $line;
		my $number = shift @tmp;
		say guess_the_number({"limit" => $number, "steps" => \@tmp});
	}
	close(INFILE);
}

main();

