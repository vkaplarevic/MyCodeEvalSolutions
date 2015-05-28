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


# Just a example of how I would write the chomp
# function in perl. 
sub my_chomp
{
	# This changes the argument!

	# When accessing the elements of @_ directly 
	# than we can change the value of the 
	# arguments! Nice property, but this is not very
	# intuitive...
	my @str = split //, $_[0];
	my $res;

	foreach my $i (0 .. $#str)
	{
		$res .= $str[$i] if ($str[$i] ne "\n");
	}

	$_[0] = $res;
}


my %WORD_DIGITS = (
	"zero" => 0,
	"one" => 1,
	"two" => 2,
	"three" => 3,
	"four" => 4,
	"five" => 5,
	"six" => 6,
	"seven" => 7,
	"eight" => 8,
	"nine" => 9
);


sub words2digits
{
	my ($words) = @_;
	my $result = "";

	foreach my $word (split(/;/, $words))
	{
		$result .= $WORD_DIGITS{$word}
	}

	return $result;
}

while (my $row = <$fh>)
{
	my_chomp $row;
	say words2digits($row);
}


close($fh);



