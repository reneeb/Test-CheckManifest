#!/usr/bin/perl

use strict;
use warnings;
use File::Spec;
use File::Basename;
use Test::More;
use Test::CheckManifest;

# create a directory and a file 
my $sub = Test::CheckManifest->can('_find_home');

my $dir = File::Spec->curdir();
$dir = File::Spec->rel2abs($dir);

my $file = File::Spec->catfile( $dir, 'MANIFEST' );

my @dirs_one = File::Spec->splitdir( $dir );
my @dirs_two = File::Spec->splitdir( $sub->( {} ) );
is_deeply  	\@dirs_one, \@dirs_two, 'tmp_path => $0';


my ($vol,$dirs,$file_one) = File::Spec->splitpath($file);

my @dirs_three = File::Spec->splitdir( $sub->( {file => $file} ) );
my @dirs_four = File::Spec->splitdir( 
    File::Spec->catdir($vol,$dirs)
);
is_deeply  	\@dirs_three, \@dirs_four, 'file';

my @dirs_five = File::Spec->splitdir( $sub->( { dir  => $dir } )  );
my @dirs_six = File::Spec->splitdir( $dir );
is_deeply  	\@dirs_three, \@dirs_four, 'dir';

done_testing();
