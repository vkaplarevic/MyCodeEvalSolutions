#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

sub min3
{
	my $tmp = $_[0] < $_[1] ? $_[0] : $_[1];
	return $tmp < $_[2] ? $tmp : $_[2];
}

my @test_cases;
my %network;
my @d;
my %lengths;


sub levenshtein
{	
	my ($s1, $len1, $s2, $len2) = @_;	

	return 0 if ($s1 eq $s2);
	return 2000 if (abs($len1 - $len2) > 1);

	### Optimise with the different count of words...
	my $diff_count = 0;
	my $min_len = $len1 < $len2 ? $len1 : $len2;
	$diff_count += (substr($s1, $_, 1)) ne substr($s2, $_, 1) for (0 .. $min_len);
	return 2000 if ($diff_count > $min_len - 1);


	for my $i (0 .. $len1)
	{
		$d[$i][$_] = 0 for (0 .. $len2);
	}
	
	$d[$_][0] = $_ for (1 .. $len1);
	$d[0][$_] = $_ for (1 .. $len2);

	for my $j (1 .. $len2)
	{
		for my $i (1 .. $len1)
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

	return $d[$len1][$len2];
}


sub add2network
{
	my $iword = shift;
	my $real_input = $iword;
	my $ilenghth = length $iword;

	foreach my $test_word (@test_cases)
	{	
		my $result = levenshtein($test_word, $lengths{$test_word}, $iword, $ilenghth);
		$network{$test_word} += 1 if ($result <= 1);
	}
}

sub main
{
	my $read_test_cases = 1;

	for my $i (0 .. 18)
	{
		$d[$i][$_] = 0 for (0 .. 18)
	}


	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
		chomp $line;	  
 
		if ($line eq "END OF INPUT")
		{
			$read_test_cases = 0;
		} 
		else
		{
			if ($read_test_cases == 1)
			{
				#say "Adding: $line";
				push @test_cases, $line;
				$network{$line} = 0;
				$lengths{$line} = length $line;
			}
			else
			{
				add2network $line;
			}
		}
	}
	close(INFILE);

	foreach my $word (@test_cases)
	{
		say $network{$word};
	}

}

main();

