#!/usr/bin/perl

#my $start=time();

use strict;
use warnings 'all';
print "-------------------------------------\n";
print "ENTER THE RECORD YOU WANT TO SEARCH\n ";
print "-------------------------------------\n";

my $input = <STDIN>;
chomp($input);

print "--------------------\n";
print "ENTER THE FILE NAME \n ";
print "--------------------\n";

my $file= <STDIN>;
chomp($file);

print "-------------------\n";

my ($name,$Id,$code,$city);
my  $tn = '';
my $count=0;
my $count2=0;
open(FHR,"<",$file) or die $!;


=begin comment
while (<FHR>){
next if /^#/;
next if /^\n/;
$count++;
}
 print "$count\n";
=cut 
while (<FHR>)
{
	next if /^#/;
	next if /^\n/;
	$count++;
	$tn = $_;
	$tn =~ s/$/,/;	
	($name , $Id , $code , $city) = split /,/,$tn;
	if ($input =~  /^\Q$name\E/i)
	
		{
	        	print "NAME:$name\n", "CITY:$city\n","CODE:$code\n";
			last ;
			}
	else  
			{
	  $count2++;	   			
	  next;		
	  	
	  }	
  }


if ($count == $count2)
{

print "Record Not Present\n";
}

close(FHR) or die "$!";




