#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

sub repetition
{
	my $args_ref = shift;
	my $str = $args_ref->{"line"};
	my $str_len = length $str;

	my $p = 0;
	for $p (1 .. $str_len)
	{
		next if ($str_len % $p != 0);
		return $p if ($str eq substr($str, 0, $p) x ($str_len / $p));
	}
	return $p;	
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces

		say repetition({"line" => $line});
	}
	close(INFILE);
}

main();

