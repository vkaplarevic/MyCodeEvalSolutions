#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


my @MATRIX;

sub create_matrix
{
	foreach my $i (0..255)
	{
		$MATRIX[$i][$_] = 0 foreach (0..255);
	}
}


my %METHODS = (
	"SetCol" => sub {
		my $index = shift;
		my $val = shift;

		$MATRIX[$index][$_] = $val foreach (0 .. 255);
	},
	"SetRow" => sub {
		my $index = shift;
		my $val = shift;

		$MATRIX[$_][$index] = $val foreach (0 .. 255);
	},
	"QueryCol" => sub {
		my $index = shift;
		my $sum = 0;
		$sum += $MATRIX[$index][$_] foreach (0 .. 255);
		say $sum;
	},
	"QueryRow" => sub {
		my $index = shift;
		my $sum = 0;

		$sum += $MATRIX[$_][$index] foreach (0 .. 255);
		say $sum;
	}
);



sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");

	create_matrix();

	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		
		my @tmp = split / /, $line;
		$METHODS{$tmp[0]}->($tmp[1], $tmp[2]);

	}
	close(INFILE);
}

main();

