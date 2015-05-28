#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub swap_list
{
	my @elements = split / /, shift;
	my $indexes_ref = shift;

	foreach my $index_ref (@{$indexes_ref})
	{
		my $first = @{$index_ref}[0];
		my $second = @{$index_ref}[1];
	
		my $tmp = $elements[$first];
		$elements[$first] = $elements[$second];
		$elements[$second] = $tmp;
	}

	return join " ", @elements;
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    chomp $line;
 

		my @tmp = split / \: /, $line;
		my @tmp_indexes = split /\, /, $tmp[1];
	
		my @all_indexes;
		foreach my $index_str (@tmp_indexes)
		{
			my @indexes = split /\-/, $index_str;
			push @all_indexes, \@indexes;
		}
		
		say swap_list($tmp[0], \@all_indexes);

	}
	close(INFILE);
}

main();

