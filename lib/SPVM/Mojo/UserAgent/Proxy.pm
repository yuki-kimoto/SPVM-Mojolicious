package SPVM::Mojo::UserAgent::Proxy;



1;

=head1 Name

SPVM::Mojo::UserAgent::Proxy - User agent proxy manager

=head1 Description

Mojo::UserAgent::Proxy class in L<SPVM> manages proxy servers for L<Mojo::UserAgent|SPVM::Mojo::UserAgent>.

=head1 Usage

  use Mojo::UserAgent::Proxy;

  my $proxy = Mojo::UserAgent::Proxy->new;
  $proxy->detect;
  say $proxy->http;

=head1 Fields

=head2 http

C<has http : rw string;>

Proxy server to use for HTTP and WebSocket requests.

=head2 https

C<has https : rw string;>

Proxy server to use for HTTPS and WebSocket requests.

=head2 not

C<has not : rw string[];>

Domains that don't require a proxy server to be used.

=head1 Class Methods



=head1 Instance Methods



=head1 See Also




=head1 Repository



=head1 Author

Yuki Kimoto C<kimoto.yuki@gmail.com>

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License

