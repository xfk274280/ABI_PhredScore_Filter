#!/usr/local/bin/perl

#Modules
use warnings;
use strict;
use Bio::Trace::ABIF;

#Reads in all the files with an .ab1 extension
my @files = <*.ab1>;

#Creates and instance of the Bio Trace object
my $abi_file = Bio::Trace::ABIF->new();

#Loops through loaded files from current directory
foreach my $filename (@files)
{

#Opens the ABI file
$abi_file->open_abif($filename);

print $filename."   ".$abi_file->sample_score()."\n";


if($abi_file->sample_score() <= 35 && $filename !~ /LowQ_/)
{

#Closing the .ab1 file
$abi_file->close_abif();

#Saving the filename
my $old_file = $filename;

#Renames the extension of the ab1 file to .bad
$filename = "LowQ_".$filename;

#Changing the name in the system
rename $old_file, $filename;

}


else{}


}#End of FOR Loop













