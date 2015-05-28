#! /usr/bin/env perl

if ($#ARGV != 0) 
{
	print "usage <name> <path-to-file>\n";
	exit();
}


open(my $fh, "<:encoding(UTF-8)", $ARGV[0])
  or die "Could not open file $ARGV[0]!";


sub is_armstrong
{
	my ($number) = @_;
	my $len = length $number;

	my $sum = 0;
	for $d (split //, $number)
	{
		$sum += $d**$len;
	}

	return $sum == $number ? "True" : "False";
}


while (my $row = <$fh>)
{
	chomp $row;
	print is_armstrong($row), "\n";
}


close(fh);

