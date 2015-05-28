#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

sub repeated_substring
{
	my $string = shift;
	my $length = length $string;
	my $max = "";
	my $max_len = -1;

	for my $len (1 .. $length - 1)
	{
		for my $i (0 .. $length - $len)
		{
			my $sstr = substr($string, $i, $len);

			next if($sstr =~ /^\s*$/);

#			next if ($sstr =~ /\s/);

			my $sstr_len = length $sstr;
			my $count = 1;	
			my $lj = -1;

		
			LAST_LOOP: for (my $j = $i + $len; $j < $length; $j += 1)
			{
				if (substr($string, $j, $len) eq $sstr)
				{
					next LAST_LOOP if ($j < $lj + $len && $lj != -1);
				
					$count++;
					$lj = $j;
				}
			}

			if ($count >= 2 && $max_len < $sstr_len)
			{
				$max = $sstr;
				$max_len = $sstr_len;
			}
		}
	}
	
	return $max_len > 0 ? $max : "NONE";
}

sub main
{	
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces

		say repeated_substring $line;
	}
	close(INFILE);
}

main();

