#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


my @SLANGS = (", yeah!", 
	", this is crazy, I tell ya.", 
	", can U believe this?", 
	", eh?", 
	", aw yea.", 
	", yo.", 
	"? No way!", 
	". Awesome!" );

my $SLANG_SIZE = $#SLANGS + 1;
my $SLANG_INDEX = 0;
my $PUNCT_INDEX = 0;


sub slangize
{
	my $line = shift;
	my $result;
		
	foreach my $c (split //, $line)
	{
		if (($c eq "." || $c eq "?" || $c eq "!"))
		{
			if ($PUNCT_INDEX % 2 == 1)
			{
				$result .= $SLANGS[$SLANG_INDEX];
				$SLANG_INDEX = ($SLANG_INDEX + 1) % $SLANG_SIZE;
			}
			else
			{
				$result .= $c;
			}

			$PUNCT_INDEX++;
		}
		else
		{
			$result .= $c;
		}
	}

	return $result;
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces

		say slangize($line);
	}
	close(INFILE);
}

main();

