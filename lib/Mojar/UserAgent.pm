package Mojar::UserAgent;
use Mojo::UserAgent -base;

our $VERSION = 0.012;

my $default_name = 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0';

sub new {
  my ($proto, %param) = @_;
  my $self = $proto->SUPER::new(%param);
  $self->name($param{name} // $default_name);
  $self->load_cookies;
  return $self;
}

has on_error => sub {
  sub {
    my ($ua, $loop, $msg) = @_;
    $ua->log->error($msg);
  }
};

has cookiejar_path => 'data/cookies.txt';

has 'referer';

sub name {
  my $self = shift;
  return $self->transactor->name unless @_;

  $self->transactor->name(shift);
  return $self;
}

sub load_cookies {
  my ($self, $filename) = @_;
  $filename //= $self->cookiejar_path;

  my $jar = $self->cookie_jar->with_roles('+Persistent')->file($filename);
  $jar->load if -f $filename;

  return $self;
}

DESTROY {
  $_[0]->cookie_jar->save;
}

1;
__END__

=head1 NAME

Mojar::UserAgent - A modest extension of the wonderful Mojo::UserAgent.

=head1 SYNOPSIS

  my $ua = Mojar::UserAgent->new(
    cookiejar_path => 'cookies.txt',
    referer => 'https://example.com/products'
  )->name('Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Firefox/89.0')

=head1 DESCRIPTION

