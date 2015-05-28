#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub do_the_split
{
	my @numbers = split //, shift;
	my $whole_pattern = shift;
	my @pattern = split /[\+\-]/, $whole_pattern;

	

	my $left;
	my $right;
	my $left_len = length ($pattern[0]);

	$left .=  $numbers[$_] for(0 .. $left_len - 1);
	$right .= $numbers[$_] for($left_len .. $#numbers);	

	if (index ($whole_pattern, "+") != -1)
	{
		return $left + $right;
	}
	else
	{
		return $left - $right;
	}
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		# ... do someting with the line...	
		my @tmp = split / /, $line;
		say do_the_split($tmp[0], $tmp[1]);
	}
	close(INFILE);
}

main();

