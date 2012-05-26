package Pod::Elemental::Element::Generic::Command;
{
  $Pod::Elemental::Element::Generic::Command::VERSION = '0.102362';
}
use Moose;
# ABSTRACT: a Pod =command element

use namespace::autoclean;

use Moose::Autobox;


has command => (
  is  => 'rw',
  isa => 'Str',
  required => 1,
);

with 'Pod::Elemental::Command';

1;

__END__
=pod

=head1 NAME

Pod::Elemental::Element::Generic::Command - a Pod =command element

=head1 VERSION

version 0.102362

=head1 OVERVIEW

Generic::Command elements are paragraph elements implementing the
Pod::Elemental::Command role.  They provide the command method by implementing
a read/write command attribute.

=head1 ATTRIBUTES

=head2 command

This attribute contains the name of the command, like C<head1> or C<encoding>.

=head1 AUTHOR

Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

