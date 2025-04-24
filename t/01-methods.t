#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;

use_ok 'MIDI::Device';

is_deeply MIDI::Device::transmits(), {}, 'transmits';

my $got = MIDI::Device::receives();

is $got->{0}{name}, 'Bank Select', 'receives';

done_testing();
