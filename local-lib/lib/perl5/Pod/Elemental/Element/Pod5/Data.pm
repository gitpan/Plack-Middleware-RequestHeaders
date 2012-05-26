package Pod::Elemental::Element::Pod5::Data;
{
  $Pod::Elemental::Element::Pod5::Data::VERSION = '0.102362';
}
use Moose;
extends 'Pod::Elemental::Element::Generic::Text';
# ABSTRACT: a Pod data paragraph


use namespace::autoclean;

1;

__END__
=pod

=head1 NAME

Pod::Elemental::Element::Pod5::Data - a Pod data paragraph

=head1 VERSION

version 0.102362

=head1 OVERVIEW

Pod5::Data paragraphs represent the content of
L<Pod5::Region|Pod::Elemental::Element::Pod5::Region> paragraphs when the
region is not a Pod-like region.  These regions should generally have a single
data element contained in them.

=head1 AUTHOR

Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

