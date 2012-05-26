package Pod::Elemental::Element::Pod5::Nonpod;
{
  $Pod::Elemental::Element::Pod5::Nonpod::VERSION = '0.102362';
}
use Moose;
with 'Pod::Elemental::Flat';
with 'Pod::Elemental::Autoblank';
# ABSTRACT: a non-pod element in a Pod document


use namespace::autoclean;

sub as_pod_string {
  my ($self) = @_;
  return sprintf "=cut\n%s=pod\n", $self->content;
}

1;

__END__
=pod

=head1 NAME

Pod::Elemental::Element::Pod5::Nonpod - a non-pod element in a Pod document

=head1 VERSION

version 0.102362

=head1 OVERVIEW

A Pod5::Nonpod element represents a hunk of non-Pod content found in a Pod
document tree.  It is equivalent to a
L<Generic::Nonpod|Pod::Elemental::Element::Generic::Nonpod> element, with the
following differences:

=over 4

=item * it includes L<Pod::Elemental::Autoblank>

=item * when producing a pod string, it wraps the non-pod content in =cut/=pod

=back

=head1 AUTHOR

Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

