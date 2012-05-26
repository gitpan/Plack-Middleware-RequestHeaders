package Pod::Elemental::Element::Generic::Text;
{
  $Pod::Elemental::Element::Generic::Text::VERSION = '0.102362';
}
use Moose;
with 'Pod::Elemental::Flat';
# ABSTRACT: a Pod text or verbatim element

use namespace::autoclean;


1;

__END__
=pod

=head1 NAME

Pod::Elemental::Element::Generic::Text - a Pod text or verbatim element

=head1 VERSION

version 0.102362

=head1 OVERVIEW

Generic::Text elements represent text paragraphs found in raw Pod.  They are
likely to be fed to a Pod5 translator and converted to ordinary, verbatim, or
data paragraphs in that dialect.  Otherwise, Generic::Text paragraphs are
simple flat paragraphs.

=head1 AUTHOR

Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

