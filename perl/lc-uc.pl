#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub calculate_lc_uc
{
	my @letters = split //, shift;
	my $total = 0;
	my $lc_count = 0;
	
	foreach my $letter (@letters)
	{
		$total += 1;
		$lc_count += 1 if ($letter =~ /[[:lower:]]/);
	}

	my $lc = $lc_count / $total * 100.00;
	my $uc = ($total - $lc_count) / $total * 100.00;

	return sprintf("lowercase: %.2f uppercase: %.2f", $lc, $uc);
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		say calculate_lc_uc($line);
	}
	close(INFILE);
}

main();

