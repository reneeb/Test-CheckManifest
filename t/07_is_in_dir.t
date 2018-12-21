#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Test::CheckManifest;

my $sub = Test::CheckManifest->can('_is_in_dir');
ok $sub;

my @tests = (
    [ '/t/test.txt', '/t', 1 ],
    [ '/t/sub/test.txt', '/t', 1 ],
    [ '/t/test.txt', '/t2', undef ],
    [ '', '/t2', undef ],
    [ '/t/test.txt', '', undef ],
    [ undef, '', undef ],
    [ undef, '/t', undef ],
    [ undef, undef, undef ],
    [ '/t/test.txt', undef, undef ],
    [ '', undef, undef ],
    [ '/t/sub/', '/t', 1 ],
    [ '/t/sub/test', '/t/sub/', 1 ],
    [ '/t/test', '/t/sub/', undef ],
);

for my $test ( @tests ) {
    my ($file, $excludes, $expected) = @{$test};
    my $result = $sub->( $file, [$excludes] );

    is $result, $expected, sprintf "%s -> %s",
        ( defined $file ? $file : '<undef>' ),
        ( defined $excludes ? $excludes : '<undef>' );
}

done_testing();
