# $Id: SUPER.t 132 2006-09-12 00:55:57Z rmuhle $

use Test::More;
eval 'use Test::Exception';
if ($@) {
    plan skip_all => 'Test::Exception needed';
} else {
    plan tests => 4;
}

use_ok( 'classes' );

lives_and( sub {
    package IsSuper;
    use classes
        new            => 'classes::new_args',
        methods  => [qw( 
            foo
        )],
    ;

    sub foo {'foo'};

    package IsChild;
    use classes
        extends => 'IsSuper',
        class_methods => [qw(
            blah
        )],
    ;

    sub blah {
        my $class = shift;
        return $class->SUPER->foo;
    }

    package main;
    my $o = IsSuper->new;
    can_ok( IsSuper, 'foo');
    can_ok( IsChild, 'foo');
    is( IsChild->blah, 'foo');
}, 'SUPER');
