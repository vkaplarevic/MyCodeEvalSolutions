#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub rollercoaster
{
	my @text = split //, shift;
	my $uc = 1;

	foreach my $c (@text)
	{
		if ($c =~ /[a-zA-Z]/)
		{
			if ($uc)
			{
				$c = uc $c;
				$uc = 0;
			}
			else
			{
				$c = lc $c;
				$uc = 1;
			}
		}
	}

	return join "", @text;
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces

		say rollercoaster($line);

	}
	close(INFILE);
}

main();

