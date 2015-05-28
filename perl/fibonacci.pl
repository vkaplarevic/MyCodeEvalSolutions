#! /usr/bin/env perl


if ($#ARGV != 0) 
{
	print "usage <name> <path-to-file>\n";
	exit();
}

open(my $fh, '<:encoding(UTF-8)', $ARGV[0])
  or die "Could not open file '$ARGV[0]' $!";


sub fib
{
	my ($n) = @_;

	if ($n == 0)
	{
		return 0;
	}

	if ($n == 1)
	{
		return 1;
	}

	return fib($n - 1) + fib($n - 2);
}


while (my $row = <$fh>)
{
	print fib(int $row), "\n";
}


close(fh);



