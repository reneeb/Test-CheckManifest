require 5.006001;

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Test::CheckManifest',
    VERSION_FROM      => 'lib/Test/CheckManifest.pm', # finds $VERSION
    PREREQ_PM         => {
                           Test::Builder  => 0,
			   File::Spec     => 0,
			   File::Basename => 0,
			   File::Find     => 0,
			   Cwd            => 0,
			   Carp           => 0,
                         }, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Test/CheckManifest.pm', # retrieve abstract from module
       AUTHOR         => 'Renee Baecker <module@renee-baecker.de>') : ()),
    ($ExtUtils::MakeMaker::VERSION >= 6.31 ?
      (LICENSE        => 'artistic_2') : ()),
);
