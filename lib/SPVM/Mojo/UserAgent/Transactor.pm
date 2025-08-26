package SPVM::Mojo::UserAgent::Transactor;



1;

=head1 Name

SPVM::Mojo::UserAgent::Transactor - User agent transactor

=head1 Description

Mojo::UserAgent::Transactor class in L<SPVM> is the transaction building and manipulation framework used by L<Mojo::UserAgent|SPVM::Mojo::UserAgent>.

=head1 Usage

  use Mojo::UserAgent::Transactor;

  # GET request with Accept header
  my $t = Mojo::UserAgent::Transactor->new;
  say $t->tx(GET => "http://example.com" => {Accept => "*/*"})->req->to_string;

  # POST request with form-data
  say $t->tx(POST => "example.com" => [(object)form => {a => "b"}])->req->to_string;

  # PUT request with JSON data
  say $t->tx(PUT => "example.com" => [(object)json => {a => "b"}])->req->to_string;

=head1 Generators

These content generators are available by default.

=head2 form

  $t->tx(POST => "http://example.com" => [(object)form => {a => "b"}]);

Generate query string, C<application/x-www-form-urlencoded> or C<multipart/form-data> content. See L</"tx"> for more.

=head2 json

  $t->tx(PATCH => "http://example.com" => [(object)json => {a => "b"}]);

Generate JSON content with L<Mojo::JSON>. See L</"tx"> for more.

=head2 multipart

  $t->tx(PUT => "http://example.com" => [(object)multipart => ["Hello", "World!"]]);

Generate multipart content. See L</"tx"> for more.

=head1 Fields

=head2 compressed

C<has compressed : rw byte;>

Try to negotiate compression for the response content and decompress it automatically, defaults to the value of the
C<SPVM_MOJO_GZIP> environment variable or true.

=head2 generators

C<has generators : rw Hash of L<Mojo::UserAgent::Transactor::Callback::Generator|SPVM::Mojo::UserAgent::Transactor::Callback::Generator>;>

Registered content generators, by default only C<form>, C<json> and C<multipart> are already defined.

=head2 name

C<has name : rw string;>

Value for C<User-Agent> request header of generated transactions, defaults to C<Mojolicious (SPVM)>.

=head1 Class Methods

C<static method new : L<Mojo::UserAgent::Transactor|SPVM::Mojo::UserAgent::Transactor> ();>

Create a new L<Mojo::UserAgent::Transactor|SPVM::Mojo::UserAgent::Transactor> object, and return it.

=head1 Instance Methods

=head2 add_generator

C<method add_generator : void ($name : string, $cb : Mojo::UserAgent::Transactor::Callback::Generator);>

Register a content generator.

Examples:

  $t->add_generator(foo => method : void ($t : Mojo::UserAgent::Transactor, $tx : Mojo::Transaction, $arg : object) {});

=head2 download

Not yet implemented.

=head2 proxy_connect

C<method proxy_connect : Mojo::Transaction::HTTP ($old : Mojo::Transaction::HTTP);>

=head2 endpoint

C<method endpoint : object[] ($tx : Mojo::Transaction);>

Actual endpoint for transaction.

=head2 upgrade

C<method upgrade : Mojo::Transaction::WebSocket ($tx : Mojo::Transaction::HTTP);>

=head2 peer

C<method peer : object[] ($tx : Mojo::Transaction::HTTP);>

=head2 redirect

C<method redirect : Mojo::Transaction::HTTP ($old : Mojo::Transaction::HTTP);>

=head2 tx

C<method tx : Mojo::Transaction::HTTP ($method : string, $url : object of string|Mojo::URL, $args1 : object = undef, $args2 : object = undef);>

=head1 See Also

=over 2

=item * L<Mojo::UserAgent|SPVM::Mojo::UserAgent>

=item * L<SPVM::Mojolicious>

=back

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License

