#!/usr/bin/perl -w 

#my $start=time();

use strict;

my $filename =  $ARGV[0];
my $recordname =  $ARGV[1];

my $both_args = $#ARGV + 1;

if( $both_args == 1 )

{

	print "Enter Recordfile to search \n ";
	exit;

}

elsif ( $both_args <2 )
{
	print "Enter both File name record name\n";
	exit;
}

elsif ( $both_args >2 ) {

print "Provide only filename and recordname\n";
exit;
}

=begin comment

print "-----------------\n";

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

=cut 



print "-------------------\n";

my ($name,$Id,$code,$city);
my  $tn = '';
my $count=0;
my $count2=0;

open(FHR,"<",$filename) or die $!;


while (<FHR>)
{
	next if /^#/;
	next if /^\n/;
	$count++;
	$tn = $_;
	$tn =~ s/$/,/;	
	($name , $Id , $code , $city) = split /,/,$tn;
	if ($recordname =~  /^\Q$name\E/i)
	
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
print "You have entered  $recordname which is  NOT Present\n";
}
close(FHR) or die "$!";

