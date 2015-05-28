#!/usr/bin/env perl

use strict;
#use warnings;
use v5.10;


my %CLOSURE = (
	")" => "(",
	"}" => "{",
	"]" => "["
);

sub is_valid
{
	my @array = split //, shift;
	my @stack;

	foreach my $p (@array)
	{
		if ($p =~ /[\(\{\[]/)
		{
			push @stack, $p
		}
		else
		{
			my $c = pop @stack;
			return "False" if (!defined $c || $CLOSURE{$p} ne $c);
		}
	}

	return  $#stack == -1 ? "True" : "False";
}

sub main
{
	open(INFILE, "<", $ARGV[0]) 
		or die("Cannot open file $ARGV[0] for reading: $!");

	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		say is_valid($line);
	}

	close(INFILE);
}

main();

