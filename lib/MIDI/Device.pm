package MIDI::Device;

# ABSTRACT: MIDI device access

our $VERSION = '0.0100';

use strictures 2;
use Moo;
use namespace::clean;

=head1 SYNOPSIS

  use MIDI::Device ();

  my $device = MIDI::Device->new;

=head1 DESCRIPTION

A C<MIDI::Device> represents and talks to MIDI devices.

=head1 ATTRIBUTES

=head1 METHODS

=head2 new

  $device = MIDI::Device->new;

Create a new C<MIDI::Device> object.

=cut

1;
