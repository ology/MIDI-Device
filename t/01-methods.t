#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;

subtest Device => sub {
    use_ok 'MIDI::Device';
    is_deeply MIDI::Device::transmits(), {}, 'transmits';
    my $got = MIDI::Device::receives();
    is $got->{0}{name}, 'Bank Select', 'receives';
};

subtest GM => sub {
    use_ok 'MIDI::Device::GM';
    is_deeply MIDI::Device::GM::transmits(), {}, 'transmits';
    my $got = MIDI::Device::GM::receives();
    ok not(exists $got->{0}), 'receives';
    is $got->{64}{name}, 'Sustain pedal', 'receives';
    is_deeply $got->{64}{off}, [0 .. 63], 'receives';
};

done_testing();
