#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

sub compress
{
	my @numbers = split / /, shift;
	my $previous = $numbers[0];
	my $count = 1;
	my @result;

	foreach my $i (1 .. $#numbers)
	{
		my $number = $numbers[$i];
		if ($number != $previous)
		{
			push @result, $count;
			push @result, $previous;

			$previous = $number;
			$count = 0;
		} 
		$count++;
	}
	push @result, $count;
	push @result, $previous;

	return join " ", @result;
}


sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		# ... do someting with the line...	

		say compress($line);
	}
	close(INFILE);
}

main();

