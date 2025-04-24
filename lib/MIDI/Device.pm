package MIDI::Device;

# ABSTRACT: MIDI device access

our $VERSION = '0.0100';

=head1 DESCRIPTION

Base class for C<MIDI::Device> modules.

=head1 ATTRIBUTES

=head1 METHODS

Create a new C<MIDI::Device> object.

=head2 transmits

Nothing by default

=cut

sub transmits {
    return {};
}

=head2 receives

These are the MIDI control change messages recognized generically:

    0 => 'Bank Select',
    1 => 'Modulation',
    2 => 'Breath Controller',
    4 => 'Foot Controller',
    5 => 'Portamento Time',
    6 => 'Data Entry (MSB)',
    7 => 'Volume',
    8 => 'Balance', # 0 = hard left, 64 = center, 127 = hard right
   10 => 'Pan',     # 0 = hard left, 64 = center, 127 = hard right
   11 => 'Expression',
   12 => 'Effect Controller 1',
   13 => 'Effect Controller 2',
   64 => 'Damper / Sustain Pedal',   # ≤63 off, ≥64 on
   65 => 'Portamento On/Off',        # ≤63 off, ≥64 on
   66 => 'Sostenuto On/Off',         # ≤63 off, ≥64 on
   67 => 'Soft Pedal On/Off',        # ≤63 off, ≥64 on
   68 => 'Legato FootSwitc	On/Off', # ≤63 Normal, ≥64 Legato
   69 => 'Hold 2',
   70 => 'Sound Variation',
   71 => 'Resonance',
   72 => 'Release Time',
   73 => 'Attack',
   74 => 'Cutoff frequency',
   84 => 'Portamento CC Control',
   91 => 'Reverb send amount',
   92 => 'Tremolo amount',
   93 => 'Chorus amount',
   94 => 'Detune amount',
   95 => 'Phaser amount',
   96 => 'Data Increment',
   97 => 'Data Decrement',
  120 => 'All Sound Off',
  121 => 'Reset All Controllers',
  122 => 'Local On/Off',
  123 => 'All Notes Off',
  124 => 'Omni Mode Off',
  125 => 'Omni Mode On',
  126 => 'Mono Mode',
  127 => 'Poly Mode',

=cut

sub receives {
    return {
          0 => { name => 'Bank Select' },
          1 => { name => 'Modulation' },
          2 => { name => 'Breath Controller' },
          4 => { name => 'Foot Controller' },
          5 => { name => 'Portamento Time' },
          6 => { name => 'Data Entry (MSB)' },
          7 => { name => 'Volume' },
          8 => { name => 'Balance' },
         10 => { name => 'Pan' },
         11 => { name => 'Expression' },
         12 => { name => 'Effect Controller 1' },
         13 => { name => 'Effect Controller 2' },
         64 => { name => 'Damper / Sustain Pedal', off => [0 .. 63], on => [64 .. 127] },
         65 => { name => 'Portamento On/Off', off => [0 .. 63], on => [64 .. 127] },
         66 => { name => 'Sostenuto On/Off', off => [0 .. 63], on => [64 .. 127] },
         67 => { name => 'Soft Pedal On/Off', off => [0 .. 63], on => [64 .. 127] },
         68 => { name => 'Legato FootSwitc	On/Off', off => [0 .. 63], on => [64 .. 127] },
         69 => { name => 'Hold 2' },
         70 => { name => 'Sound Variation' },
         71 => { name => 'Resonance' },
         72 => { name => 'Release Time' },
         73 => { name => 'Attack' },
         74 => { name => 'Cutoff frequency' },
         84 => { name => 'Portamento CC Control' },
         91 => { name => 'Reverb send amount' },
         92 => { name => 'Tremolo amount' },
         93 => { name => 'Chorus amount' },
         94 => { name => 'Detune amount' },
         95 => { name => 'Phaser amount' },
         96 => { name => 'Data Increment' },
         97 => { name => 'Data Decrement' },
        120 => { name => 'All Sound Off' },
        121 => { name => 'Reset All Controllers' },
        122 => { name => 'Local On/Off' },
        123 => { name => 'All Notes Off' },
        124 => { name => 'Omni Mode Off' },
        125 => { name => 'Omni Mode On' },
        126 => { name => 'Mono Mode' },
        127 => { name => 'Poly Mode' },
    };
}

1;

=cut

1;
