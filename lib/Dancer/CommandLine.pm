package Dancer::CommandLine;
use strict;
use warnings;
use Carp qw/carp croak/;

require Exporter;
our @ISA = qw(Exporter);
#I use capitalization since i don't know where to turn off redefined warning
our @EXPORT_OK = qw(Debug Warning);


=head1 NAME

Dancer::CommandLine - Warning and Debug for Dancer and non-dancing scripts

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

	use Dancer::CommandLine qw/Debug Warning/;

	#in your script
	Warning "Write this message using perl's warn";
	Debug "Write this message to STDOUT";

	#in your dancer app
	Warning "Write this message using dancer's warning";
	Debug "Write this message using dancer's debug";

=head1 BACKGROUND

If you want to reuse Dancer code in a script (outside of your webapp, e.g.
command-line tool), Dancer can give you a hard time. This little tool provides
a Debug and Warning function which you can use in both a script and the webapp.

=head1 EXPORT

=head2 Debug "Message";

Use Dancer's debug function if available or write to STDOUT if no Dancer
loaded.

=cut

sub Debug {
	if ( defined(&Dancer::Logger::debug) ) {
		goto &Dancer::Logger::debug;
	} else {
		foreach (@_) {
			print "$_\n";
		};
	}
}

=head2 Warning "Message";

Use Dancer's warning function if available or pass message to perl's warn.

=cut

sub Warning {

	if ( defined(&Dancer::Logger::warning) ) {
		goto &Dancer::Logger::warning;
	} else {
		warn @_;
	}
}


=head1 AUTHOR

Maurice Mengel, C<< <mauricemengel at gmail.com> >>

=head1 BUGS

use issues at github

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Dancer::CommandLine

=head1 LICENSE AND COPYRIGHT

Copyright 2011 Maurice Mengel.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

1; # End of Dancer::CommandLine
