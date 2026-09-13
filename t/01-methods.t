#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact qw(ddc);
use Test::More;
use Test::Exception;

my $module = 'MIDI::Device';

use_ok $module;

subtest device => sub {
    throws_ok { $module->new(name => 'foo') }
        qr/No such file or directory/, 'bogus device';
    my $expect = 'hpd-15';
    my $obj = new_ok $module => [ name => $expect ];
    is $obj->name, $expect, 'name';
    is $obj->manufacturer, 'Roland', 'manufacturer';
    is $obj->port_in, 'USB MIDI Interface', 'port_in';
    is $obj->port_out, 'USB MIDI Interface', 'port_out';
    is_deeply $obj->cc->[0], { name => 'Bank Select', number => 0 }, 'cc';
};

done_testing();
