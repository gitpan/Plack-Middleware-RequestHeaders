package Pod::Elemental::Element::Generic::Blank;
{
  $Pod::Elemental::Element::Generic::Blank::VERSION = '0.102362';
}
use Moose;
with 'Pod::Elemental::Flat';
# ABSTRACT: a series of blank lines


use namespace::autoclean;

sub as_debug_string { '|' }

1;

__END__
=pod

=head1 NAME

Pod::Elemental::Element::Generic::Blank - a series of blank lines

=head1 VERSION

version 0.102362

=head1 OVERVIEW

Generic::Blank elements represent vertical whitespace in a Pod document.  For
the most part, these are meant to be placeholders until made unnecessary by the
Pod5 transformer.  Most end-users will never need to worry about these
elements.

=head1 AUTHOR

Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

