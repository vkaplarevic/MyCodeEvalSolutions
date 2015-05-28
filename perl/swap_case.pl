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


sub swap_case
{
	my ($str) = @_;
	my @chars = split //, $str;

	foreach my $c (@chars)
	{
		if ($c =~ /[A-Z]/)
		{
			$c = lc $c;
		} 
		elsif ($c =~ /[a-z]/)
		{
			$c = uc $c;
		}
	}

	return join "", @chars;
}



while (my $row = <$fh>)
{
	chomp $row;
	say swap_case($row);
}


close($fh);

