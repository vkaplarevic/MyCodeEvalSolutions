#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

my @LINE0 = split (//, "-**----*--***--***---*---****--**--****--**---**--");
my @LINE1 = split (//, "*--*--**-----*----*-*--*-*----*-------*-*--*-*--*-");	
my @LINE2 = split (//, "*--*---*---**---**--****-***--***----*---**---***-");
my @LINE3 = split (//, "*--*---*--*-------*----*----*-*--*--*---*--*----*-");
my @LINE4 = split (//, "-**---***-****-***-----*-***---**---*----**---**--");
my @LINE5 = split (//, "--------------------------------------------------");

my @LINES = (\@LINE0, \@LINE1, \@LINE2, \@LINE3, \@LINE4, \@LINE5);



sub draw_digits
{
	my @digits = split //, shift;
	for my $line (0..5)
	{
		foreach my $d (@digits)
		{
			next if ($d =~ /\D/);
			print $LINES[$line][$_] foreach ($d*5 .. $d*5 + 4);
		}
		print "\n";
	}
}


sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces
		# ... do someting with the line...	
		draw_digits $line;
	}
	close(INFILE);
}

main();

