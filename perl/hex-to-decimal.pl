#! /usr/bin/env perl

%DIGITS = (
	"0" => 0,
	"1" => 1,
	"2" => 2,
	"3" => 3,
	"4" => 4,
	"5" => 5,
	"6" => 6,
	"7" => 7,
	"8" => 8,
	"9" => 9,
	"a" => 10,
	"b" => 11,
	"c" => 12,
	"d" => 13,
	"e" => 14,
	"f" => 15
);


if ($#ARGV != 0) 
{
	print "usage <name> <path-to-file>\n";
	exit();
}


open(my $fh, "<:encoding(UTF-8)", $ARGV[0])
  or die "Could not open file $ARGV[0]!";


sub hex2decimal
{
	my ($number) = @_;
	my $base = 1;
	my $sum = 0;

	foreach my $d (reverse split(//, $number))
	{
		$sum += $DIGITS{"$d"}*$base;
		$base *= 16;
	}

	return $sum;
}


while (my $row = <$fh>)
{
	chomp $row;
	print hex2decimal($row), "\n";
}


close(fh);



