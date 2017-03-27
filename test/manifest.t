use Mojo::Base -strict;
use Test::More;

plan skip_all => 'set RELEASE=1 to enable this test (developer only!)'
  unless $ENV{RELEASE};
plan skip_all => "Test::CheckManifest 0.9 required for testing manifest"
  unless eval 'use Test::CheckManifest 0.9; 1';
ok_manifest();
