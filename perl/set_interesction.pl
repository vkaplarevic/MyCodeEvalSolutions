#! /usr/bin/env perl

use warnings;
use v5.10;

if ($#ARGV != 0) 
{
	print "usage <name> <path-to-file>\n";
	exit();
}

open(my $fh, '<:encoding(UTF-8)', $ARGV[0])
  or die "Could not open file '$ARGV[0]' $!";


sub intersect
{
	my ($ref_array, $ref_set) = @_;
	my @result;

	foreach $e (@$ref_array)
	{
		if (exists(${$ref_set}{$e}))
		{
			push @result, $e;
		}
	}

	return join ',', @result;
}

while (my $row = <$fh>)
{
	chomp $row;
	@array = split /;/, $row;
	
	my @set1_array = split /,/, $array[0];
	my %set2 = ();
	foreach my $i (split /,/, $array[1])
	{
		$set2{$i} = 1;
	}


	print intersect(\@set1_array, \%set2), "\n";
}


close($ARGV[0]);
