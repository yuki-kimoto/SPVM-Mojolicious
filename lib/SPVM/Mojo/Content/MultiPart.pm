package SPVM::Mojo::Content::MultiPart;



1;

=head1 Name

SPVM::Mojo::Content::MultiPart - HTTP multipart content

=head1 Description

Mojo::Content::MultiPart class in L<SPVM> is a container for HTTP multipart content, based on L<RFC
7230|https://tools.ietf.org/html/rfc7230>, L<RFC 7231|https://tools.ietf.org/html/rfc7231> and L<RFC
2388|https://tools.ietf.org/html/rfc2388>.


=head1 Usage

  use Mojo::Content::MultiPart;

  my $multi = Mojo::Content::MultiPart->new;
  $multi->parse("Content-Type: multipart/mixed; boundary=---foobar");
  my $single = $multi->parts->[4];

=head1 Super Class

L<Mojo::Content|SPVM::Mojo::Content>

=head1 Events

=head2 part

  $multi->on(part => method : void ($multi : Mojo::Content::MultiPart, $single : Mojo::Content::Single) {...});

Emitted when a new L<Mojo::Content::Single|SPVM::Mojo::Content::Single> part starts.

  $multi->on(part => method : void ($multi : Mojo::Content::MultiPart, $single : Mojo::Content::Single) {
    
  });

=head1 Fields

=head2 parts

C<has parts : Mojo::Content[];>

Content parts embedded in this multipart content, usually L<Mojo::Content::Single|SPVM::Mojo::Content::Single> objects.

=head1 Class Methods



=head1 Instance Methods

  method body_contains : int ($chunk : string) {
  
  method body_size : int () {
  
  method build_boundary : string () {
  
  static method _range : int[] ($start : int, $end : int) {
  
  method clone : Mojo::Content::MultiPart () {
  
  method get_body_chunk : string ($offset : int) {
  
  method is_multipart : int () {
  
  method _parse_multipart_body : int ($boundary : string) {
  
  method _parse_multipart_boundary : int ($boundary : string) {
  
  method _parse_multipart_preamble : int ($boundary : string) {
  
  method _read : void ($chunk : string) {

=head1 See Also

=over 2

=item * L<Mojo::Content::Single|SPVM::Mojo::Content::Single>

=item * L<Mojo::Content|SPVM::Mojo::Content>

=item * L<SPVM::Mojolicious>

=back

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License
