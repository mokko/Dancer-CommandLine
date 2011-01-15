#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Dancer::CommandLine' ) || print "Bail out!
";
}

diag( "Testing Dancer::CommandLine $Dancer::CommandLine::VERSION, Perl $], $^X" );
