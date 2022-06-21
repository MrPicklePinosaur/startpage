#!/usr/bin/perl

use strict;
use warnings;

my $xresources_path = $ENV{'HOME'} . '/.config/xorg/Xresources';
print $xresources_path, "\n";

my %colors = ();

open(FH, '<', $xresources_path) or die $!;
while(<FH>) {
    if ($_ =~ /\.color(\d{1,2}): (.+)/ and $1 >= 0 and $1 <= 15) {
        $colors{'color' . $1} = $2;
    }
}
close(FH);

# TODO does not resolve xresources macros
print "
--black-normal:   $colors{'color0'};
--black-bright:   $colors{'color8'};
--red-normal:     $colors{'color1'};
--red-bright:     $colors{'color9'};
--green-normal:   $colors{'color2'};
--green-bright:   $colors{'color10'};
--yellow-normal:  $colors{'color3'};
--yellow-bright:  $colors{'color11'};
--blue-normal:    $colors{'color4'};
--blue-bright:    $colors{'color12'};
--magenta-normal: $colors{'color5'};
--magenta-bright: $colors{'color13'};
--cyan-normal:    $colors{'color6'};
--cyan-bright:    $colors{'color14'};
--white-normal:   $colors{'color7'};
--white-bright:   $colors{'color15'};
";

