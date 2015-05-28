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


sub modulo
{
	my ($n, $m) = @_;
	return $n % $m;
#	my $result = 0;
#	while ($result < $n)
#	{
#		$result += $m;
#	}
#	return $n - ($result - $m);
}


while (my $row = <$fh>)
{
	my @tmp = split /,/, $row;
	chomp $tmp[1];
	print modulo int($tmp[0]), int($tmp[1]);
	print "\n";
}


close($fh);



