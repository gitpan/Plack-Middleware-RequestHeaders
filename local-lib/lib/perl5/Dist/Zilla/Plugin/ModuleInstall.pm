use strict;
use warnings;

package Dist::Zilla::Plugin::ModuleInstall;
BEGIN {
  $Dist::Zilla::Plugin::ModuleInstall::AUTHORITY = 'cpan:KENTNL';
}
{
  $Dist::Zilla::Plugin::ModuleInstall::VERSION = '0.01054021';
}

# ABSTRACT: Build Module::Install based Distributions with Dist::Zilla

use Moose;
use Moose::Autobox;

with 'Dist::Zilla::Role::InstallTool';
with 'Dist::Zilla::Role::TextTemplate';
with 'Dist::Zilla::Role::Tempdir';
with 'Dist::Zilla::Role::PrereqSource';
with 'Dist::Zilla::Role::TestRunner';

use Dist::Zilla::File::InMemory;



use namespace::autoclean;

require inc::Module::Install;

sub _doc_template {
  my ( $self, $args ) = @_;
  my $t = join qq{\n},
    (
    q{use strict;},
    q{use warnings;},
    q{# Warning: This code was generated by }
      . __PACKAGE__
      . q{ Version }
      . ( __PACKAGE__->VERSION() || 'undefined ( self-build? )' ),
    q{# As part of Dist::Zilla's build generation.},
    q{# Do not modify this file, instead, modify the dist.ini that configures its generation.},
    q|use inc::Module::Install {{ $miver }};|,
    q|{{ $headings }}|,
    q|{{ $requires }}|,
    q|{{ $feet }}|,
    q{WriteAll();},
    );
  return $self->fill_in_string( $t, $args );
}

sub _label_value_template {
  my ( $self, $args ) = @_;
  return $self->fill_in_string( q|{{$label}} '{{ $value }}';|, $args );
}

sub _label_string_template {
  my ( $self, $args ) = @_;
  return $self->fill_in_string( q|{{$label}} "{{ quotemeta( $string ) }}";|, $args );
}

sub _label_string_string_template {
  my ( $self, $args ) = @_;
  return $self->fill_in_string( q|{{$label}}  "{{ quotemeta($stringa) }}" => "{{ quotemeta($stringb) }}";|, $args );
}

sub _generate_makefile_pl {
  my ($self) = @_;
  my ( @headings, @requires, @feet );

  push @headings, _label_value_template( $self, { label => 'name', value => $self->zilla->name } ),
    _label_string_template( $self, { label => 'abstract', string => $self->zilla->abstract } ),
    _label_string_template( $self, { label => 'author',   string => $self->zilla->authors->[0] } ),
    _label_string_template( $self, { label => 'version',  string => $self->zilla->version } ),
    _label_string_template( $self, { label => 'license',  string => $self->zilla->license->meta_yml_name } );

  my $prereqs = $self->zilla->prereqs;

  my $doreq = sub {
    my ( $key, $target ) = @_;
    push @requires, qq{\n# @$key => $target};
    my $hash = $prereqs->requirements_for(@$key)->as_string_hash;
    for ( sort keys %{$hash} ) {
      if ( $_ eq 'perl' ) {
        push @requires, _label_string_template( $self, { label => 'perl_version', string => $hash->{$_} } );
        next;
      }
      push @requires,
        $self->_label_string_string_template(
        {
          label   => $target,
          stringa => $_,
          stringb => $hash->{$_},
        }
        );
    }
  };

  $doreq->( [qw(configure requires)],   'configure_requires' );
  $doreq->( [qw(build     requires)],   'requires' );
  $doreq->( [qw(runtime   requires)],   'requires' );
  $doreq->( [qw(runtime   recommends)], 'recommends' );
  $doreq->( [qw(test      requires)],   'test_requires' );

  push @feet, qq{\n# :ExecFiles};
  for my $execfile ( $self->zilla->find_files(':ExecFiles')->map( sub { $_->name } )->flatten ) {
    push @feet, _label_string_template( $self, $execfile );
  }
  my $content = _doc_template(
    $self,
    {
      miver    => "$Module::Install::VERSION",
      headings => join( qq{\n}, @headings ),
      requires => join( qq{\n}, @requires ),
      feet     => join( qq{\n}, @feet ),
    }
  );
  return $content;
}


sub register_prereqs {
  my ($self) = @_;
  $self->zilla->register_prereqs( { phase => 'configure' }, 'ExtUtils::MakeMaker' => 6.42 );
  $self->zilla->register_prereqs( { phase => 'build' },     'ExtUtils::MakeMaker' => 6.42 );
}


sub setup_installer {
  my ( $self, $arg ) = @_;

  my $file = Dist::Zilla::File::FromCode->new( { name => 'Makefile.PL', code => sub { _generate_makefile_pl($self) }, } );

  $self->add_file($file);
  my (@generated) = $self->capture_tempdir(
    sub {
      system( $^X, 'Makefile.PL' ) and do {
        warn "Error running Makefile.PL, freezing in tempdir so you can diagnose it\n";
        warn "Will die() when you 'exit' ( and thus, erase the tempdir )";
        system("bash") and die "Can't call bash :(";
        die "Finished with tempdir diagnosis, killing dzil";
      };
    }
  );
  for (@generated) {
    if ( $_->is_new ) {
      $self->log( 'ModuleInstall created: ' . $_->name );
      if ( $_->name =~ /^inc\/Module\/Install/ ) {
        $self->log( 'ModuleInstall added  : ' . $_->name );
        $self->add_file( $_->file );
      }
    }
    if ( $_->is_modified ) {
      $self->log( 'ModuleInstall modified: ' . $_->name );
    }
  }
  return;
}


sub build {
  my ($self) = shift;
  system( $^X => 'Makefile.PL' ) and die "error running Makefile.PL\n";
  system('make') and die "error running make\n";
  return;
}


sub test {
  my ( $self, $target ) = @_;

  $self->build;
  system('make test') and die "error running make test\n";
  return;

}

1;


__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::ModuleInstall - Build Module::Install based Distributions with Dist::Zilla

=head1 VERSION

version 0.01054021

=head1 SYNOPSIS

dist.ini

    [ModuleInstall]

=head1 DESCRIPTION

This module will create a F<Makefile.PL> for installing the dist using L<Module::Install>.

It is at present a very minimal feature set, but it works.

=head1 METHODS

=head2 register_prereqs

Tells Dist::Zilla about our needs to have EU::MM larger than 6.42

=head2 setup_installer

Generates the Makefile.PL, and runs it in a tmpdir, and then harvests the output and stores
it in the dist selectively.

=head2 build

Called by Dist::Zilla to build a built dist. ( ie: perl ./Makefile.PL )

=head2 test

Called by Dist::Zilla to run a dists tests. ( ie: make test )

=head1 AUTHOR

Kent Fredric <kentnl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
