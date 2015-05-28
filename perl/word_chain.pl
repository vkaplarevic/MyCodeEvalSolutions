#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

sub calculate_chain
{
	my ($word, $words_ref) = @_;
	my $c = substr $word, length($word) - 1, 1;
	return 1 if (!defined $words_ref->{$c});

	my $max = 1;	
	foreach my $curr (@{$words_ref->{$c}})
	{
		my $tmp = calculate_chain($curr, $words_ref);
		$max = $tmp + 1 if ($tmp + 1 > $max);	
	}	
		
	return $max;
}


sub longest_chain
{
	my @words = split /,/, shift;	
	my $longest_count = 0;

	foreach my $word (@words)
	{
		my %words_hash;		
		foreach my $cword (@words)
		{
			my $c = substr $cword, 0, 1;
			push @{$words_hash{$c}}, $cword if ($cword ne $word);
		}

		my $count = calculate_chain $word, \%words_hash;
		$longest_count = $count if ($count > $longest_count);	
	}

	return $longest_count == 1 ? "None" : $longest_count;
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		say longest_chain $line;
		#say $line;
		
	}
	close(INFILE);
}

main();

