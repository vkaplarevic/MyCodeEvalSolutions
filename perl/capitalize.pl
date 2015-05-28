#! /usr/bin/env perl


if ($#ARGV != 0) 
{
	print "usage <name> <path-to-file>\n";
	exit();
}

open(my $fh, '<:encoding(UTF-8)', $ARGV[0])
  or die "Could not open file '$ARGV[0]' $!";


sub capitalize
{
	my ($sentence) = @_;

	my @words = split / /, $sentence;	
	foreach $word (@words)
	{
		@splitted = split //, $word;
		$splitted[0] = uc $splitted[0];
		$word = join '', @splitted;
	}

	return join ' ', @words;
}

while (my $row = <$fh>)
{
	chomp $row;
	print capitalize($row), "\n";
}


close($fh);



