#! /usr/bin/env perl

use warnings;

if ($#ARGV != 0) 
{
	print "usage <name> <path-to-file>\n";
	exit();
}

open(my $fh, '<:encoding(UTF-8)', $ARGV[0])
  or die "Could not open file '$ARGV[0]' $!";



sub unique
{
	my (@array) = @_;
	my @result;
	my %checked;

	foreach my $e (@array)
	{
		if (!exists($checked{$e})) 
		{
			push @result, $e;
			$checked{$e} = 1;
		}
	}

	return join ",", @result;
}



while (my $row = <$fh>)
{
	chomp $row;
	@array = split /,/, $row;
	print unique(@array), "\n";
}


close($ARGV[0]);



