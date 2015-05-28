#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


my %MAPP;
my $CODEL   = "rbcvjnmkfkdyxyqcinarbczjkfoscddewrbcujllmcptcrbksorbyrejpmysljylckdkxveddknmcrejsicpdrysidekrkdeoyakwaejicfkicirezjkr";
my $ENGLISH = "thepublicisamazedbythequicknessofthejugglerwethinkthatourlanguageisimpossibletounderstandsoitisokayifyoudecidedtoquit";




sub main
{
	$MAPP{"g"} = "v";
	$MAPP{"h"} = "x";

	$MAPP{substr($CODEL, $_, 1)} = substr($ENGLISH, $_, 1) for(0 .. length($CODEL));

#	for my $i (0 .. length($CODEL)) 
#	{
#		$MAPP{substr($CODEL, $i, 1)} = substr($ENGLISH, $i, 1);		
#	}

#	my %left;
#	$left{$_} = 1 foreach ("a" .. "z");

#	foreach my $c ("a" .. "z")
#	{
#		if (!defined $MAPP{$c})
#		{
#			say "NOT DEFINED: $c";
#			next;
#		}

#		say "$c => $MAPP{$c}" ;
#		delete $left{$MAPP{$c}};
#	}

	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		
		my @result = map {defined($MAPP{$_}) ? $MAPP{$_} : $_} (split //, $line);
		say @result;
	}
	close(INFILE);
}

main();

