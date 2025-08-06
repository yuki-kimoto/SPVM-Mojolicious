package SPVM::Mojo::URL;



1;

=encoding utf8

=head1 Name

SPVM::Mojo::URL - Uniform Resource Locator

=head1 Description

The Mojo::URL class of L<SPVM> implements a subset of L<RFC 3986|https://tools.ietf.org/html/rfc3986>, L<RFC
3987|https://tools.ietf.org/html/rfc3987> and the L<URL Living Standard|https://url.spec.whatwg.org> for Uniform
Resource Locators with support for IDNA and IRIs.

=head1 Usage

  use Mojo::URL;

  # Parse
  my $url = Mojo::URL->new("http://sri:foo@example.com:3000/foo?foo=bar#23");
  say $url->scheme;
  say $url->userinfo;
  say $url->host;
  say $url->port;
  say $url->path;
  say $url->query;
  say $url->fragment;
  
  # Build
  my $url = Mojo::URL->new;
  $url->set_scheme("http");
  $url->set_host("example.com");
  $url->set_port(3000);
  $url->set_path("/foo/bar");
  $url->set_query(foo => "bar");
  $url->set_fragment(23);
  say $url->to_string;

=head1 Fields


=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

