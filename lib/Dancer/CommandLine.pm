package Dancer::CommandLine;

use warnings;
use strict;
package Dancer::CommandLine;
use strict;
use warnings;

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

=cut

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(Debug Warning);  # symbols to export on request

#I use capitalization because i don't know where to turn off redefined warning;

=head1 EXPORT

=head2 Debug "Message";

Use Dancer's debug function if available or write to STDOUT if no Dancer
loaded.

=cut

sub Debug {
	if ( defined(&Dancer::Logger::debug) ) {
		Dancer::Logger::debug (@_);
	} else {
		print @_;
	}
}

=head2 Warning "Message";

Use Dancer's warning function if available or pass message to perl's warn.

=cut

sub Warning {

	if ( defined(&Dancer::Logger::warning) ) {
		Dancer::Logger::warning (@_);
	} else {
		warn @_;
	}
}

1;    #CommandLine;



=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub function1 {
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Maurice Mengel, C<< <mauricemengel at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-dancer-commandline at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Dancer-CommandLine>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Dancer::CommandLine


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Dancer-CommandLine>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Dancer-CommandLine>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Dancer-CommandLine>

=item * Search CPAN

L<http://search.cpan.org/dist/Dancer-CommandLine/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2011 Maurice Mengel.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Dancer::CommandLine