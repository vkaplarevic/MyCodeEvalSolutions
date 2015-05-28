#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


my %DIGITS = (
	"0" => 0,
	"00" => 1
);



sub convert
{
	my @zeroes = split / /, shift;
	my $binary;
	my $result = 0;
	my $power2 = 1;	

	while (1)
	{
		last if ($#zeroes == -1);

		my $command = shift @zeroes;
		my @sequence = split (//, shift (@zeroes));	
		$binary	.= $DIGITS{$command} for (0 .. $#sequence);
		
	}

	foreach my $d (split //, reverse($binary))
	{
		$result += $power2 * $d;
		$power2 *= 2;
	}

	
	return $result;
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		# ... do someting with the line...	
		say convert $line;
	}
	close(INFILE);
}

main();

