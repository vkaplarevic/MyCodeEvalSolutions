#! /usr/bin/env perl

if ($#ARGV != 0) 
{
	print "usage <name> <path-to-file>\n";
	exit();
}


open(my $fh, "<:encoding(UTF-8)", $ARGV[0])
  or die "Could not open file $ARGV[0]!";


sub my_sort
{
	my (@numbers) = @_;
	my @sorted = sort {$a <=> $b} @numbers;
	return join ' ', @sorted;
}


while (my $row = <$fh>)
{
	chomp $row;
	@numbers = split / /, $row;
	print my_sort(@numbers), "\n";
}


close(fh);



