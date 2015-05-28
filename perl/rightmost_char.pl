#! /usr/bin/env perl

sub find_rightmost
{
	my ($sentence, $chr) = @_;
	my $index = 0;
	my $result = -1;

	for my $c (split //, $sentence) 
	{
		if ($c eq $chr)
		{
			$result = $index;
		}
		$index = $index + 1;
    }

	return $result;
}


if ($#ARGV != 0) 
{
	print "usage <name> <path-to-file>\n";
	exit();
}

open(my $fh, '<:encoding(UTF-8)', $ARGV[0])
  or die "Could not open file '$ARGV[0]' $!";


while (my $row = <$fh>)
{
	my @tmp = split /,/, "$row";
	chomp($tmp[1]);
	#print $row;
	#print find_rightmost(lc $tmp[0], lc $tmp[1]), "\n";
	print find_rightmost($tmp[0], $tmp[1]), "\n";
}


close(fh);



