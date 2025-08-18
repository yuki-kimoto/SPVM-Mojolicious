package SPVM::Mojo::Content;



1;

=encoding utf8

=head1 Name

SPVM::Mojo::Content - HTTP content base class

=head1 Description

Mojo::Content class in L<SPVM> is an abstract base class for HTTP content containers, based on L<RFC
7230|https://tools.ietf.org/html/rfc7230> and L<RFC 7231|https://tools.ietf.org/html/rfc7231>, like
L<Mojo::Content::MultiPart|SPVM::Mojo::Content::MultiPart> and L<Mojo::Content::Single|SPVM::Mojo::Content::Single>.

=head1 Usage

  use Mojo::Content;

  class Mojo::Content::MyContent extends Mojo::Content {
    
  }

=head1 Super Class

L<Mojo::EventEmitter|SPVM::Mojo::EventEmitter>

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

