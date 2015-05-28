#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

sub penultimate
{
	my @words = split / /, $_[0];
	return $words[$#words - 1];
}


sub main
{
	# Read lines from the file...
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");

	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    #$line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		chomp $line;
		say penultimate($line);
	
	}

	close(INFILE);
}

main();
