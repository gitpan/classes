# $Id: Makefile.PL 46 2006-06-30 02:24:24Z rmuhle $

use strict;
require 5.006001;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'classes',
    AUTHOR              => 'Robert S Muhlestein <rmuhle at cpan.org>',
    VERSION_FROM        => 'lib/classes.pm',
    ABSTRACT_FROM       => 'lib/classes.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'Data::Dumper' => 0,
        'Scalar::Util' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'classes-*' },
    test                => { TESTS => join ' ', map {glob} qw(t/*.t t/*/*.t )},
);
