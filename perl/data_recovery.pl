#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

sub recover
{
	my @sentence = split / /, shift;
	my @indexes = split / /, shift;

	my @result;	
	my $sentence_len = $#sentence + 1;
	my $sum = 0;
	$sum += $_ foreach @indexes;

	push @indexes, (($sentence_len + 1)*$sentence_len / 2 - $sum);

	$result[$indexes[$_] - 1] = $sentence[$_] for (0 .. $#sentence);

	return join " ", @result;
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		my @tmp = split ";", $line;

		say recover $tmp[0], $tmp[1];
	}
	close(INFILE);
}

main();

