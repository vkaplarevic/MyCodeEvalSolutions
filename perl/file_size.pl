#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;


sub main
{
	open(INFILE, "<:raw", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	my $offset = 0;
	my $buffer;

	while (read(INFILE, $buffer, 1, $offset++) )
	{}

	say $offset - 1;

	close(INFILE);
}

main();

