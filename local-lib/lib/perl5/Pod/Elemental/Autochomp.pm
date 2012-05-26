package Pod::Elemental::Autochomp;
{
  $Pod::Elemental::Autochomp::VERSION = '0.102362';
}
use namespace::autoclean;
use Moose::Role;
# ABSTRACT: a paragraph that chomps set content

use Pod::Elemental::Types qw(ChompedString);


# has '+content' => (
#   coerce => 1,
#   isa    => ChompedString,
# );

1;

__END__
=pod

=head1 NAME

Pod::Elemental::Autochomp - a paragraph that chomps set content

=head1 VERSION

version 0.102362

=head1 OVERVIEW

This role exists primarily to simplify elements produced by the Pod5
transformer.

=head1 AUTHOR

Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

