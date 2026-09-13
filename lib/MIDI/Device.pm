package MIDI::Device;

# ABSTRACT: MIDI device access

our $VERSION = '0.0100';

use v5.35;

use Moo;
use strictures 2;
use Data::Dumper::Compact qw(ddc);
use namespace::clean;

=encoding utf8

=head1 SYNOPSIS

  use MIDI::Device ();
  my $device = MIDI::Device->new('MIDI Device Name');
  print "Device: ", join(", ", $device->name, $device->manufacturer), "\n";
  my $ccs = $device->cc; # { 1 => 'Modulation', ... }

=head1 DESCRIPTION

Point of reference for C<MIDI::Device> modules. Contains device
metadata and the control change message numbers.

=head1 METHODS

=head2 cc

  $ccs = $device->cc;

Control change numbers and decriptions

=cut

sub cc {
    my ($self) = @_;
    return $self->_device->{control_change};
}

=head2 manufacturer

  $manufacturer = $device->manufacturer;

Manufacturer of the device

=cut

sub manufacturer {
    my ($self) = @_;
    return $self->_device->{manufacturer};
}

=head2 name

  $name = $device->name;

Name of the device

=cut

sub name {
    my ($self) = @_;
    return $self->_device->{name};
}

=head2 new

  $device = MIDI::Device->new($port_name)

Return a new C<MIDI::Device> object given a port name of an available
MIDI device on the system.

=for Pod::Coverage BUILD

=cut

sub BUILD {
    my ($self, $args) = @_;
    say ddc $args;
}

=head2 port_in

  $port_in = $device->port_in;

Input port name of the device

=cut

sub port_in {
    my ($self) = @_;
    return $self->_device->{port}{in};
}

=head2 port_out

  $port_out = $device->port_out;

Output port name of the device

=cut

sub port_out {
    my ($self) = @_;
    return $self->_device->{port}{out};
}

1;

=head1 SEE ALSO

L<https://nickfever.com/music/midi-cc-list>

=cut

1;
