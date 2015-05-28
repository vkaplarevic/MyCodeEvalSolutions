#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

sub min3
{
	my $tmp = $_[0] < $_[1] ? $_[0] : $_[1];
	return $tmp < $_[2] ? $tmp : $_[2];
}

my @d;

sub levenshtein
{	
	my $s1 = shift;
	my $s2 = shift;
	my $len = length $s1;

	return -1 if ($len != length $s2);
	return 0 if ($s1 eq $s2);
	
	for my $i (0 .. $len)
	{
		$d[$i][$_] = 0 for (0 .. $len);
	}

	for my $i (1 .. $len)
	{
		$d[$i][0] = $i;
		$d[0][$i] = $i;
	}

	for my $j (1 .. $len)
	{
		for my $i (1 .. $len)
		{
			if (substr($s1, $i - 1, 1) eq substr($s2, $j - 1, 1))
			{
				$d[$i][$j] = $d[$i - 1][$j - 1];
			}
			else
			{
				$d[$i][$j] = min3 (
					$d[$i - 1][$j] + 1, 
					$d[$i][$j - 1] + 1,
					$d[$i - 1][$j - 1] + 1
				);
			}
		}
	}

	return $d[$len][$len];
}



sub find_subsegments
{
	my ($segment, $missmatch_num, $dna_str) = @_;

	my @dna = split //, $dna_str;
	my $seg_len = length($segment) - 1;
	my %segments_miss;
	my @result;

	for my $i (0 .. $#dna - $seg_len)
	{
		my $test_segment;
		$test_segment .= $dna[$_] for ($i .. $i + $seg_len);

		my $miss = -1;
		if (exists $segments_miss{$test_segment})
		{
			$miss = $segments_miss{$test_segment};
		} 
		else
		{
			$miss = levenshtein($segment, $test_segment);
		}

		if ($miss <= $missmatch_num && $miss >= 0)
		{
			#say "Adding: $segment => $test_segment with distance: $miss";
			push @result, $test_segment;
			$segments_miss{$test_segment} = $miss;
		}
	}
	
	if ($#result == -1)
	{
		return "No match";
	}

	return join(" ", sort {$segments_miss{$a} <=> $segments_miss{$b} || $a cmp $b} @result);
}


sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
		chomp $line;
	    
		my @tmp = split / /, $line;
		say find_subsegments($tmp[0], $tmp[1], $tmp[2]);
	}
	close(INFILE);
}

main();

