#! /usr/bin/env perl

use strict;
use warnings;
use v5.10;

if ($#ARGV != 0) 
{
	print "usage <name> <path-to-file>\n";
	exit();
}

open(my $fh, '<:encoding(UTF-8)', $ARGV[0])
	or die "Could not open file '$ARGV[0]' $!";


sub is_self_describing
{
	my ($number) = @_;
	my @digits = split //, $number;
	my $len = length $number;
	my %occurs;

	# Preprocess the string and put in the map...
	foreach my $d (@digits)
	{
		if (!exists $occurs{$d})
		{
			$occurs{$d} = 0;
		}
		$occurs{$d} += 1;
	}

	# ... once the stuff is in a map (hash) do the magic!
	for my $i (0..$len - 1)
	{
		# Here's the magic:
		if ($digits[$i] != (exists $occurs{$i} ?  $occurs{$i} : 0))
		{
			return 0;
		}	
	}
	return 1;
}


while (my $row = <$fh>)
{
	chomp $row;
	say is_self_describing($row);
}


close($fh);



