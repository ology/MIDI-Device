package MIDI::Device;

# ABSTRACT: MIDI device access

our $VERSION = '0.0100';

use v5.35;

use Moo;
use strictures 2;
use Carp qw(croak);
# use Data::Dumper::Compact qw(ddc);
use File::ShareDir qw(dist_dir);
use YAML::XS qw(LoadFile);
use namespace::clean;

=encoding utf8

=head1 SYNOPSIS

  use MIDI::Device ();
  my $device = MIDI::Device->new('MIDI Device Name');
  print "Device: ", join(", ", $device->name, $device->manufacturer), "\n";
  my $ccs = $device->cc; # [ { number => 1, name => 'Modulation' }, ... ]

=head1 DESCRIPTION

Point of reference for C<MIDI::Device> modules. Contains device
metadata and control change messages.

=head1 ATTRIBUTES

=head2 name

  $name = $device->name;

Name of the device

Known device names:

  ez-ag
  hpd-15
  kaoss-pad-v
  microkorg
  se-02
  volca-drum

=cut

has name => (
    is => 'ro',
);

=head2 shared

  $shared = $device->shared;

Name of the device shared directory

=cut

has shared => (
    is => 'lazy',
);
sub _build_shared {
    my ($self) = @_;
    my $shared = eval { dist_dir('MIDI-Device') };
    $shared = './share/' unless $shared; # try author local
    croak "File $shared doesn't exist: $!" unless -e $shared;
    return $shared;
}

has _device => (
    is      => 'rw',
    default => sub { {} },
);

=head1 METHODS

=head2 cc

  $ccs = $device->cc;

List of control change numbers and names

List entries are typically of the form:

  { number => 1, name => 'Modulation' }

But these can also contain control value attributes:

  { number => 42, name => 'Switch', off => 0, on => 127 }

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

=head2 new

  $device = MIDI::Device->new($port_name)

Return a new C<MIDI::Device> object given a port name of an available
MIDI device on the system.

=for Pod::Coverage BUILD

=cut

sub BUILD {
    my ($self, $args) = @_;
    if ($args->{name}) {
        my $shared = $self->shared . $args->{name} . '.yml';
        croak "File $shared doesn't exist: $!" unless -e $shared;
        my $device = LoadFile($shared);
        $self->_device($device);
    }
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