package Dancer::CommandLine::Config;
use strict;
use warnings;
use Carp qw/carp croak/;
use YAML::Syck qw/LoadFile/;
#use Dancer::CommandLine qw/Debug/;

=head1 NAME

Dancer::CommandLine::Conf - Simulates Dancer's config for command-line scripts
working with Dancer code

=head1 SYNOPSIS

Load and test config information from Dancer's config file.

	use Dancer::CommandLine::Config;
	my $c=new Dancer::CommandLine::Config ('path/to/app/conf.yml');

	$c->test_conf_var(var1, var2);

	my $config=$c->get_config;
	print $config->{logger};

=head1 METHODS

=head2 my $c=new Dancer::CommandLine::Conf ('path/to/app/conf.yml');

Loads Dancer's config, does NOT return a dancer config hashref, but a
Dancer::CommandLine::Config object. Use get_config to get the actual hashref.

=cut

sub new {
	my $class=shift;
	my $config_fn=shift;
	if (! $config_fn) {
		carp "Need a conf file!";
	}

	if (! -f $config_fn) {
		carp "Specified conf file does not exist!";
	}

	my $config = LoadFile($config_fn) or carp "Cannot load dancing config";

	my $self={};
	$self->{config}=$config;
	return 	bless ($self, $class);
}

=head2 $c->test_config_var (var1, var2, var3);

If variable is not specified in config file, this function reports error and
exists. So you can do something like

	test_conf_var qw/var1 var2 var3/;

=cut

sub test_conf_var {
	my $self=shift;

	foreach my $var (@_) {

		if ( !$self->{config}->{$var} ) {
			#this message is intended for script end user, right?
			print "$var info missing in dancer config";
			exit 1;
		}
	}
}

=head2 $config=$c->get_config;

Return config hashref as in Dancer;

=cut
sub get_config {
	my $self=shift;
	return $self->{config};
}

1; #Dancer::CommandLine::Conf;