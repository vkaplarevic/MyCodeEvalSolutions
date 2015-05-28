#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

my %CODE =(
    '.-'    =>'A',  '-...'  =>'B',  '-.-.'  =>'C',  '-..'   =>'D',
    '.' =>'E',  '..-.'  =>'F',  '--.'   =>'G',  '....'  =>'H',
    '..'    =>'I',  '.---'  =>'J',  '-.-'   =>'K',  '.-..'  =>'L',
    '--'    =>'M',  '-.'    =>'N',  '---'   =>'O',  '.--.'  =>'P',
    '--.-'  =>'Q',  '.-.'   =>'R',  '...'   =>'S',  '-' =>'T',
    '..-'   =>'U',  '...-'  =>'V',  '.--'   =>'W',  '-..-'  =>'X',
    '-.--'  =>'Y',  '--..'  =>'Z',  '.----' =>'1',  '..---' =>'2',
    '...--' =>'3',  '....-' =>'4',  '.....' =>'5',  '-....' =>'6',
    '--...' =>'7',  '---..' =>'8',  '----.' =>'9',  '-----' =>'0',
    '.-.-.-'=>'.',  '--..--'=>',',  '---...'=>':',  '..--..'=>'?',
    '.----.'=>'\'', '-...-' =>'-',  '-..-.' =>'/',  '.-..-.'=>'\"'
); 


sub decode
{
	my @text = split /  /, shift;
	my @sentence;

	foreach my $word (@text)
	{
		my @english_word;
		foreach my $c (split / /, $word)
		{
			push @english_word, $CODE{$c};
		}
		push @sentence, join("", @english_word);
	}
	return join " ", @sentence;
}

sub main
{
	open(INFILE, "<", $ARGV[0]) or die("Cannot open file $ARGV[0] for reading: $!");
	while(my $line = <INFILE>) {
    	next if($line =~ m/^\s$/);  # skip blank lines
	    $line =~ s/(^\s|\s*$)//g;   # remove leading and trailing spaces

		say decode $line;

	}
	close(INFILE);
}

main();

