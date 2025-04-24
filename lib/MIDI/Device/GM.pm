package MIDI::Device::GM;

use MIDI::Device ();

=head1 SYNOPSIS

  use MIDI::Device::GM ();

  my $gm = MIDI::Device::GM::receives();

=head1 DESCRIPTION

C<MIDI::Device::GM> represents General MIDI Level 1 messages.

=head1 ATTRIBUTES

=head1 METHODS

=head2 new

  $device = MIDI::Device::GM->new;

Create a new C<MIDI::Device::GM> object.

=head2 transmits

Nothing

=cut

sub transmits {
    return {};
}

=head2 receives

These are the MIDI control change messages recognized by General MIDI Level 1:

   1 Modulation # vibrato effect (pitch, loudness, brighness)
   7 Volume
  11 Expression # percentage of volume
  64 Sustain pedal # 0 to 63 = Off, 64 to 127 = On
  85 Portamento
  91 Reverb

=cut

sub receives {
    my $receives = {
         1 => { name => 'Modulation' },
         7 => { name => 'Volume' },
        11 => { name => 'Expression' },
        64 => { name => 'Sustain pedal', off => [0 .. 63], on => [64 .. 127] },
        85 => { name => 'Portamento' },
        91 => { name => 'Reverb' },
    };
    my $defaults = MIDI::Device::receives();
    for my $default (keys %$defaults) {
        unless (exists $receives->{$default}) {
            $receives->{$default} = undef;
        }
    }
    return $receives;
}

1;
