package Pod::Elemental::Paragraph;
{
  $Pod::Elemental::Paragraph::VERSION = '0.102362';
}
use namespace::autoclean;
use Moose::Role;
use Moose::Autobox;

use Encode qw(encode);
use String::Truncate qw(elide);
# ABSTRACT: a paragraph in a Pod document


has content    => (is => 'rw', isa => 'Str', required => 1);
has start_line => (is => 'ro', isa => 'Int', required => 0);


sub as_pod_string {
  my ($self) = @_;
  return $self->content;
}


sub _summarize_string {
  my ($self, $str, $length) = @_;
  $length ||= 30;

  use utf8;
  chomp $str;
  my $elided = elide($str, $length, { truncate => 'middle', marker => '…' });
  $elided =~ tr/\n\t/␤␉/;

  return encode('utf-8', $elided);
}

requires 'as_debug_string';

1;

__END__
=pod

=head1 NAME

Pod::Elemental::Paragraph - a paragraph in a Pod document

=head1 VERSION

version 0.102362

=head1 OVERVIEW

This is probably the most important role in the Pod-Elemental distribution.
Classes including this role represent paragraphs in a Pod document.  The
paragraph is the fundamental unit of dividing up Pod documents, so this is a
often-included role.

=head1 ATTRIBUTES

=head2 content

This is the textual content of the element, as in a Pod::Eventual event.  In
other words, this Pod:

  =head2 content

has a content of "content\n"

=head2 start_line

This attribute, which may or may not be set, indicates the line in the source
document where the element began.

=head1 METHODS

=head2 as_pod_string

This returns the element  as a string, suitable for turning elements back into
a document.  Some elements, like a C<=over> command, will stringify to include
extra content like a C<=back> command.  In the case of elements with children,
this method will include the stringified children as well.

=head2 as_debug_string

This method returns a string, like C<as_string>, but is meant for getting an
overview of the document structure, and is not suitable for reproducing a
document.  Its exact output is likely to change over time.

=head1 AUTHOR

Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

