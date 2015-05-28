#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub rotate
{
	my @matrix_array = split / /, $_[0];
	my $dim = sqrt($#matrix_array + 1);

	# Transpose with "secondary" diagonal
	for my $index (0 .. $#matrix_array / 2)
	{
		my $i = int($index / $dim);
		my $j = $index % $dim;
		my $new_index = ($dim - $j - 1) * $dim + ($dim - $i - 1) % $dim;

		my $tmp = $matrix_array[$index];
		$matrix_array[$index] = $matrix_array[$new_index];
		$matrix_array[$new_index] = $tmp;		
	}

	#for my $j (0 .. $dim - 1)
	#{
	#	for my $i (0 .. $dim / 2 - 1)
	#	{
	#		my $index = $i * $dim + $j % $dim;
	#		my $new_index = ($dim - $i - 1) * $dim + $j % $dim;
	#		my $tmp = $matrix_array[$index];
	#		$matrix_array[$index] = $matrix_array[$new_index];
	#		$matrix_array[$new_index] = $tmp;
	#	}
	#}


	return join " ", @matrix_array;
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces

		say rotate($line);
	}
	close(INFILE);
}

main();

