# $Id: throwable.t 113 2006-08-13 05:42:19Z rmuhle $

use strict;

use Test::More;

eval 'use Test::Exception';
if ($@) {
    plan skip_all => "Test::Exception needed";
} else {
    plan tests => 4;
}

use_ok 'classes';
use classes::Test ':all';

lives_ok( sub {
    package MyThrowable;
    use classes mixes => 'classes::Throwable';
}, 'MyThrowable mixed in classes::Throwable');

is_throwable MyThrowable;

lives_ok( sub {require classes::Throwable},
    'use classes::Throwable is invalid syntax, but uses classes'); 
