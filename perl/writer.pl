#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub find_writer
{
	my @text = split //, shift;
	my @positions = split / /, shift;
	my $result = '';

	foreach my $position (@positions)
	{
		$result .= $text[$position - 1];
	}

	return $result;
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		my @tmp = split /\| /, $line;
		say find_writer($tmp[0], $tmp[1]);
	}
	close(INFILE);
}

main();

