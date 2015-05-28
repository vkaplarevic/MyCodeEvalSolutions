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



sub longest_word
{
	my ($words) = @_;
	my $len = -1;
	my $res = "";

	foreach my $word (split / /, $words)
	{
		my $clen = length $word;
		($len, $res) = ($clen, $word) if ($len < $clen);
	}

	return $res;
}


while (my $row = <$fh>)
{
	chomp $row;
	say longest_word($row);
}

close($fh);



