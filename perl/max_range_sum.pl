#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

sub max_gain
{
	my $period = shift;
	my @numbers = split / /, shift;
	my $max = 0;

	foreach my $i (0 .. $#numbers - $period + 1)
	{
		my $tmp = 0;
		$tmp += $numbers[$_] foreach ($i .. $i + $period - 1);
		$max = $tmp if ($max < $tmp);		
	}

	return $max;
}


sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
	
		my @tmp = split /;/, $line;
		say max_gain($tmp[0], $tmp[1]);
		
	}
	close(INFILE);
}

main();

