#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub convert2double0
{
	my $number = shift;
	if ($number < 10)
	{
		return '0' . $number;
	}
	return $number;
}

sub delta
{
	my @time1 = split /:/, shift;
	my @time2 = split /:/, shift;

	my $seconds1 = 0;
	my $seconds2 = 0;
	my $seconds = 1;

	for my $i (0..$#time1)
	{
		$seconds1 += $time1[$#time1 - $i] * $seconds;
		$seconds2 += $time2[$#time2 - $i] * $seconds;		
		$seconds *= 60;
	}

	# Get the difference in seconds...
	my $diff = abs($seconds1 - $seconds2);
	my $hours = int($diff / 3600);
	$diff %= 3600;
	my $minutes = int($diff / 60);
	$diff %= 60;
	
	return 	convert2double0($hours) . ":" . convert2double0($minutes) . ":" . convert2double0($diff);
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces

		my @tmp = split / /, $line;
		say delta $tmp[0], $tmp[1];
	}
	close(INFILE);
}

main();

