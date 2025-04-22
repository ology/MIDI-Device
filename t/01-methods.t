#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;

use_ok 'MIDI::Device';

new_ok 'MIDI::Device';

done_testing();
