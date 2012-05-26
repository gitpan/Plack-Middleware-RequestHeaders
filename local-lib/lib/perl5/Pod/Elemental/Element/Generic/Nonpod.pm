package Pod::Elemental::Element::Generic::Nonpod;
{
  $Pod::Elemental::Element::Generic::Nonpod::VERSION = '0.102362';
}
use Moose;
with 'Pod::Elemental::Flat';
# ABSTRACT: a non-pod element in a Pod document

use namespace::autoclean;


1;

__END__
=pod

=head1 NAME

Pod::Elemental::Element::Generic::Nonpod - a non-pod element in a Pod document

=head1 VERSION

version 0.102362

=head1 OVERVIEW

Generic::Nonpod elements are just like Generic::Text elements, but represent
non-pod content found in the Pod stream.

=head1 AUTHOR

Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

