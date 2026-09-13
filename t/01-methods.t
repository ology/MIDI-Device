#!/usr/bin/env perl
use strict;
use warnings;

# use Data::Dumper::Compact qw(ddc);
use Test::More;
use Test::Exception;

my $module = 'MIDI::Device';

use_ok $module;

subtest device => sub {
    throws_ok { $module->new(name => 'foo') }
        qr/doesn't exist/, 'bogus device';
    my $obj = new_ok $module => [ name => 'hpd-15' ];
    is $obj->name, 'hpd-15', 'name';
    is $obj->manufacturer, 'Roland', 'manufacturer';
    is $obj->port_in, 'generic', 'port_in';
    is $obj->port_out, 'generic', 'port_out';
    is_deeply $obj->cc->[0], { name => 'Bank Select', number => 0 }, 'cc';
};

done_testing();
