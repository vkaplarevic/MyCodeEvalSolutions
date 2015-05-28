#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub distance
{
	my ($x1, $y1, $x2, $y2) = @_;
	return sqrt(($x1 - $x2)**2 + ($y1 - $y2)**2);
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    #$line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		# ... do someting with the line...	
		$line =~ s/\s+//g;
		my @numbers;

		foreach my $t (split /[(),]/, $line)
		{
			push @numbers, $t if (!$t eq "");
		}

		say distance($numbers[0], $numbers[1], $numbers[2], $numbers[3]);
	}
	close(INFILE);
}

main();

