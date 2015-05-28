#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

my %DIGITS;


sub find_digits
{
	my $args_ref = shift;
	my @chars = split //, $args_ref->{"str"};
	my $digits = join("",  map { defined($DIGITS{$_}) ? $DIGITS{$_} : ""} @chars);

	return $digits eq ""  ? "NONE" : $digits;
}

sub main
{
	$DIGITS{chr(ord("a") + $_)} = $_ for (0 .. 9);
	$DIGITS{"$_"} = $_ for (0 .. 9);

	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces

		say find_digits({"str" => $line});

	}
	close(INFILE);
}

main();

