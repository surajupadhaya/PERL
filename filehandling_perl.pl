#!/usr/bin/perl

open(FHR,"<","test1.txt") or die "Nope";

#my $test=<FHR>;
 $tn = '';
 
for (<FHR>){
	next if /^#/;
	next if /^\n/;
	$tn .= $_;
	$tn =~ s/$/,/;	
	my ($name , $Id , $code , $city) = split /,/,$_;
	print "Name:$name\n","ID:$Id\n","Code:$code\n","City:$city\n";
}
close(FHR) or die "nope";





