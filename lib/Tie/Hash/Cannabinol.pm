#
# DESCRIPTION
#  Tie::Hash::Cannibinol is a Perl module that allows you to define hashes
#  that forget things..
#
# AUTHOR
#   Dave Cross   <dave@mag-sol.com>
#
# COPYRIGHT
#   Copyright (C) 2001, Magnum Solutions Ltd.  All Rights Reserved.
#
#   This script is free software; you can redistribute it and/or
#   modify it under the same terms as Perl itself.
#
# $Id$
#
# $Log$
# Revision 1.2  2001/09/03 19:58:08  dave
# Minor fixes
#
# Revision 1.1  2001/09/02 17:06:18  dave
# Initial revision
#

package Tie::Hash::Cannabinol;

use strict;
use vars qw($VERSION @ISA);
use Tie::Hash;

$VERSION = sprintf "%d.%02d", '$Revision$ ' =~ /(\d+)\.(\d+)/;
@ISA = qw(Tie::StdHash);

# Preloaded methods go here.

sub STORE {
  my ($self, $key, $val) = @_;

  return if rand > .75;

  $self->{$key} = $val;
}

sub FETCH {
  my ($self, $key) = @_;

  return if rand > .75;

  return $self->{rand keys %$self};
}

sub EXISTS {
  return rand > .5;
}

1;
__END__


=head1 NAME

Tie::Hash::Cannabinol - Perl extension for creating hashes that forget things

=head1 SYNOPSIS

  use Tie::Hash::Cannabinol;

  my %hash;
  tie %hash, 'Tie::Hash::Cannabinol';

  # % hash can now be treated exactly like a normal hash - but don't trust
  # anything it tells you.

=head1 DESCRIPTION

Tie::Hash::Cannabinol is a completely useless demostration of how to use
Tie::StdHash to pervert the behaviour of Perl hashes. Once a hash has been
C<tie>d to Tie::Hash::Cannabinol, there is a 25% chance that it will forget
anything that you tell it immediately and a further 25% chance that it 
won't be able to retrieve any information you ask it for. Any information
that it does return will be pulled at random from it's keys.

Oh, and the return value from C<exists> isn't to be tursted either :)

=head1 AUTHOR

Dave Cross <dave@dave.org.uk>

=head1 SEE ALSO

perl(1), perltie(1), Tie::StdHash(1)

=cut