#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;




sub position_indexes
{
	my $px = shift;
	my $py = shift;	
	my @result;

	my $left =  $px - 2;
	if ($left >= 1)
	{		
		my $up = $py + 1;
		push @result, "$left$up" if ($up <= 8);

		my $down = $py - 1;
		push @result, "$left$down" if ($down >= 1);
	}

	my $right = $px + 2;
	if ($right <= 8)	
	{
		my $up = $py + 1;
		push @result, "$right$up" if ($up <= 8);

		my $down = $py - 1;
		push @result, "$right$down" if ($down >= 1);
	}

	my $left =  $px - 1;
	if ($left >= 1)
	{		
		my $up = $py + 2;
		push @result, "$left$up" if ($up <= 8);

		my $down = $py - 2;
		push @result, "$left$down" if ($down >= 1);
	}

	my $right = $px + 1;
	if ($right <= 8)	
	{
		my $up = $py + 2;
		push @result, "$right$up" if ($up <= 8);

		my $down = $py - 2;
		push @result, "$right$down" if ($down >= 1);
	}

	return @result;
}

sub moves
{
	my $px = shift;
	my $py = shift;	
	my @result;
	my @numPositions = position_indexes(ord($px) - ord("a") + 1, $py);

	foreach my $num (@numPositions)
	{
		my @tmp = split //, $num;
		my $letter = chr(ord('a') + ($tmp[0] - 1));
		push @result, "$letter$tmp[1]";
	}
	
	return join " ", sort {lc($a) cmp lc($b)} @result;
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		my @tmp = split //, $line;
		say moves($tmp[0], $tmp[1]);

	}
	close(INFILE);
}

main();

