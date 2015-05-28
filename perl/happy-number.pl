#! /usr/bin/env perl

use strict;
use warnings;

if ($#ARGV != 0) 
{
	print "usage <name> <path-to-file>\n";
	exit();
}

open(my $fh, '<:encoding(UTF-8)', $ARGV[0])
  or die "Could not open file '$ARGV[0]' $!";


sub square_digits
{
	my ($n) = @_;
	my $sum = 0;
	foreach my $d (split //, "$n")
	{
		$sum += int($d)**2;
	}

	return $sum;
}


sub is_happy
{
	my ($n) = @_;
	chomp $n;
	my %checked = ($n => 1);

	while ($n != 1)
	{
		$n = square_digits($n);
		if (exists($checked{$n}))
		{
			return 0;
		}
		$checked{$n} = 1;
	}

	return 1;
}


while (my $row = <$fh>)
{
	print is_happy("$row"), "\n";
}


close($fh);

