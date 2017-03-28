use 5.010_001;
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojar::UserAgent',
  VERSION_FROM => 'lib/Mojar/UserAgent.pm',
  ABSTRACT     => 'Modest extension of Mojo::UserAgent',
  AUTHOR       => 'Nic Sandfield <niczero@cpan.org>',
  LICENSE      => 'artistic_2',
  META_MERGE   => {
    requires  => {perl => 5.016_001},
    resources => {
      homepage   => 'http://niczero.github.com/mojar',
      license    => 'http://www.opensource.org/licenses/artistic-license-2.0',
      repository => 'http://github.com/niczero/mojar-useragent',
      bugtracker => 'http://github.com/niczero/mojar-useragent/issues'
    },
    no_index => {directory => [qw(data test)]}
  },
  BUILD_REQUIRES => {'Test::More' => 0},
  CONFIGURE_REQUIRES => {'ExtUtils::MakeMaker' => 6.3},
  PREREQ_PM => {
    Mojolicious  => 9.15,
    'Mojo-UserAgent-CookieJar-Role-Persistent' => 0
  },
  EXE_FILES => [],
  test => {TESTS => 'test/*.t'}
);
