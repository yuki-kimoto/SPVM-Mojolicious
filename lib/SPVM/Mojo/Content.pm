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

=head2 auto_decompress

C<has auto_decompress : rw byte;>

Decompress content automatically if L</"is_compressed"> is true.

=head2 auto_relax

C<has auto_relax : rw byte;>

Try to detect when relaxed parsing is necessary.

=head2 headers

C<has headers : rw Mojo::Headers;>

Content headers, defaults to a L<Mojo::Headers|SPVM::Mojo::Headers> object.

=head2 max_buffer_size

C<has max_buffer_size : rw int;>

Maximum size in bytes of buffer for content parser, defaults to the value of the C<SPVM_MOJO_MAX_BUFFER_SIZE> environment
variable or C<262144> (256KiB).

=head2 max_leftover_size

C<has max_leftover_size : rw int;>

Maximum size in bytes of buffer for pipelined HTTP requests, defaults to the value of the C<SPVM_MOJO_MAX_LEFTOVER_SIZE>
environment variable or C<262144> (256KiB).

=head2 relaxed

C<has relaxed : rw byte;>

Activate relaxed parsing for responses that are terminated with a connection close.

=head2 skip_body

C<has skip_body : rw byte;>

Skip body parsing and finish after headers.

=head1 Class Methods



=head1 Instance Methods



=head1 See Also

=over 2

=item * L<Mojo::Headers|SPVM::Mojo::Headers>

=item * L<SPVM::Mojolicious>

=back

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License
