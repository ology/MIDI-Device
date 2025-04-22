package MIDI::Device;

# ABSTRACT: MIDI hardware device access

our $VERSION = '0.0100';

use strictures 2;
use Moo;
use namespace::clean;

=head1 SYNOPSIS

  use MIDI::Device ();

  my $device = MIDI::Device->new;

=head1 DESCRIPTION

A C<MIDI::Device> represents and talks to MIDI hardware devices.

=head1 ATTRIBUTES

=head1 METHODS

=head2 new

  $device = MIDI::Device->new;

Create a new C<MIDI::Device> object.

=cut

1;

__END__

=head1 SEE ALSO

L<MIDI::RtController> - Related module

L<MIDI::RtController::Filter::CC> - Related module

L<MIDI::RtController::Filter::Tonal> - Related module

L<MIDI::RtController::Filter::Math> - Related module

L<MIDI::RtController::Filter::Drums> - Related module

L<Moo>

=cut
