#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub swap_numbers
{
	my $word = shift;
	my @letters = split(/[\d]+/, $word);
	my @numbers = split(/[\D]+/, $word);

	return $numbers[1] . $letters[1] . $numbers[0];
}

sub swap_sentence
{
	my @sentence = split / /, shift;
	my @result;
	
	push @result, swap_numbers($_) foreach (@sentence);	
	return join " ", @result;
}



sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		# ... do someting with the line...	
		say swap_sentence $line;
	}
	close(INFILE);
}

main();

