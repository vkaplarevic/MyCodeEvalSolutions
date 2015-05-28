#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub age
{
	my $y = shift;
	#return "This program is for humans" if ($y < 0 || $y > 100);
	return "Still in Mama\'s arms" if ($y >= 0 && $y <= 2);
	return "Preschool Maniac" if ($y >= 3 && $y <= 4);
	return "Elementary school" if ($y >= 5 && $y <= 11);
	return "Middle school" if ($y >= 12 && $y <= 14);
	return "High school" if ($y >= 15 && $y <= 18);
	return "College" if ($y >= 19 && $y <= 22);
	return "Working for the man" if ($y >= 23 && $y <= 65);
	return "The Golden Years" if ($y >= 66 && $y <= 100);

	return "This program is for humans";
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		say age $line;
	}
	close(INFILE);
}

main();

