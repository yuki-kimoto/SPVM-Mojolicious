package SPVM::Mojo::Message::Response;



1;

=head1 Name

SPVM::Mojo::Message::Response - HTTP response

=head1 Description

Mojo::Message::Response class in L<SPVM> is a container for HTTP responses, based on L<RFC 7230|https://tools.ietf.org/html/rfc7230>
and L<RFC 7231|https://tools.ietf.org/html/rfc7231>.

=head1 Usage
  
  use Mojo::Message::Response;
  
  # Parse
  my $res = Mojo::Message::Response->new;
  $res->parse("HTTP/1.0 200 OK\x0d\x0a");
  $res->parse("Content-Length: 12\x0d\x0a");
  $res->parse("Content-Type: text/plain\x0d\x0a\x0d\x0a");
  $res->parse('Hello World!');
  say $res->code;
  say $res->headers->content_type;
  say $res->body;
  
  # Build
  my $res = Mojo::Message::Response->new;
  $res->set_code(200);
  $res->headers->set_content_type("text/plain");
  $res->set_body("Hello World!");
  say $res->to_string;

=head1 Inheritance

L<Mojo::Message|SPVM::Mojo::Message>

=head1 Fields

=head2 code

C<has code: rw int;>

HTTP response status code.

=head2 max_message_size

C<has max_message_size : rw int>

Maximum message size in bytes, defaults to the value of the C<MOJO_MAX_MESSAGE_SIZE> environment variable or
C<2147483648> (2GiB). Setting the value to C<0> will allow messages of indefinite size.

=head2 message

C<has message : rw string;>

HTTP response status message.

=head1 Instance Methods

=head2 content

C<method content : string ();>

Returns the content body of the response.

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

