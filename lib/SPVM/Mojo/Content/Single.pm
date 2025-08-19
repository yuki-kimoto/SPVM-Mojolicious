package SPVM::Mojo::Content::Single;



1;

=head1 Name

SPVM::Mojo::Content::Single - HTTP content

=head1 Description

Mojo::Content::Single class in L<SPVM> is a container for HTTP content, based on L<RFC 7230|https://tools.ietf.org/html/rfc7230> and
L<RFC 7231|https://tools.ietf.org/html/rfc7231>.

=head1 Usage

  use Mojo::Content::Single;

  my $single = Mojo::Content::Single->new;
  $single->parse("Content-Length: 12\x0d\x0a\x0d\x0aHello World!");
  say $single->headers->content_length;

=head1 Super Class

L<Mojo::Content|SPVM::Mojo::Content>

=head1 Fields



=head1 Class Methods



=head1 Instance Methods



=head1 See Also




=head1 Repository



=head1 Author

Yuki Kimoto C<kimoto.yuki@gmail.com>

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License

