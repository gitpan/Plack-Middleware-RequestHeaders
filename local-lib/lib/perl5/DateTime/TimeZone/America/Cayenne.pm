# This file is auto-generated by the Perl DateTime Suite time zone
# code generator (0.07) This code generator comes with the
# DateTime::TimeZone module distribution in the tools/ directory

#
# Generated from /tmp/ympzZnp0Uq/southamerica.  Olson data version 2012c
#
# Do not edit this file directly.
#
package DateTime::TimeZone::America::Cayenne;
{
  $DateTime::TimeZone::America::Cayenne::VERSION = '1.46';
}

use strict;

use Class::Singleton 1.03;
use DateTime::TimeZone;
use DateTime::TimeZone::OlsonDB;

@DateTime::TimeZone::America::Cayenne::ISA = ( 'Class::Singleton', 'DateTime::TimeZone' );

my $spans =
[
    [
DateTime::TimeZone::NEG_INFINITY,
60289414160,
DateTime::TimeZone::NEG_INFINITY,
60289401600,
-12560,
0,
'LMT'
    ],
    [
60289414160,
62064590400,
60289399760,
62064576000,
-14400,
0,
'GFT'
    ],
    [
62064590400,
DateTime::TimeZone::INFINITY,
62064579600,
DateTime::TimeZone::INFINITY,
-10800,
0,
'GFT'
    ],
];

sub olson_version { '2012c' }

sub has_dst_changes { 0 }

sub _max_year { 2022 }

sub _new_instance
{
    return shift->_init( @_, spans => $spans );
}



1;

