package SPVM::Mojo::Transaction::WebSocket;



1;

=head1 Name

SPVM::Mojo::Transaction::WebSocket - WebSocket transaction

=head1 Description

Mojo::Transaction::WebSocket class in L<SPVM> is a container for WebSocket transactions, based on L<RFC
6455|https://tools.ietf.org/html/rfc6455> and L<RFC 7692|https://tools.ietf.org/html/rfc7692>.

=head1 Usage

  use Mojo::Transaction::WebSocket;
  
  # Send and receive WebSocket messages
  my $ws = Mojo::Transaction::WebSocket->new;
  $ws->send("Hello World!");
  $ws->on(message => method : void ($ws : Mojo::Transaction::WebSocket, $msg : string) { say "Message: $msg"; });
  $ws->on(finish => method : void ($ws : Mojo::Transaction::WebSocket, $code : Int, $reason : string) { say "WebSocket closed with status " . (int)$code . "."; });

=head1 Super Class

L<Mojo::Transaction|SPVM::Mojo::Transaction>

=head1 Events

=head2 binary

Emitted when a complete WebSocket binary message has been received.

Callback:

C<method : void ($ws : L<Mojo::Transaction::WebSocket|SPVM::Mojo::Transaction::WebSocket>, $bytes : string);>

Examples:

  $ws->on(binary => method : void ($ws : Mojo::Transaction::WebSocket, $bytes : string) { say "Binary: $bytes"; });

=head2 drain

Emitted once all data has been sent.

Callback:

C<method : void ($ws : L<Mojo::Transaction::WebSocket|SPVM::Mojo::Transaction::WebSocket>);>

Examples:

  $ws->on(drain => method : void ($ws : Mojo::Transaction::WebSocket) { $ws->send(time) });

=head2 finish

Emitted when the WebSocket connection has been closed.

Callback:

C<method : void ($ws : L<Mojo::Transaction::WebSocket|SPVM::Mojo::Transaction::WebSocket>, $code : int, $reason : string);>

Examples:

  $ws->on(finish => method : void ($ws : Mojo::Transaction::WebSocket, $code : int, $reason : string) {});

=head2 frame

Emitted when a WebSocket frame has been received.

Callback:

C<method : void ($ws : L<Mojo::Transaction::WebSocket|SPVM::Mojo::Transaction::WebSocket>, $frame : L<Mojo::WebSocket::Frame|SPVM::Mojo::WebSocket::Frame>);>

Examples:

  $ws->on(frame => method : void ($ws : Mojo::Transaction::WebSocket, $frame : Mojo::WebSocket::Frame) {
    
  });

=head2 json

Emitted when a complete WebSocket message has been received, all text and binary messages will be automatically JSON
decoded. Note that this event only gets emitted when it has at least one subscriber.

Callback:

C<method : void ($ws : L<Mojo::Transaction::WebSocket|SPVM::Mojo::Transaction::WebSocket>, $json : object);>

Examples:

  $ws->on(json => method : void ($ws : Mojo::Transaction::WebSocket, $hash : object) { say "Message: " . $hash->(Hash)->get_string("msg"); });

=head2 message

Emitted when a complete WebSocket message has been received, text messages will be automatically decoded. Note that
this event only gets emitted when it has at least one subscriber.

Callback:

C<method : void ($ws : L<Mojo::Transaction::WebSocket|SPVM::Mojo::Transaction::WebSocket>, $msg);>

Examples:

  $ws->on(message => method : void ($ws : Mojo::Transaction::WebSocket, $msg) { say "Message: $msg"; });

=head2 resume

Emitted when transaction is resumed.

Callback:

C<method : void ($ws : L<Mojo::Transaction::WebSocket|SPVM::Mojo::Transaction::WebSocket>);>

Examples:

  $tx->on(resume => method : void ($ws : Mojo::Transaction::WebSocket) {});

=head2 text

Emitted when a complete WebSocket text message has been received.

Callback:

C<method : void ($ws : L<Mojo::Transaction::WebSocket|SPVM::Mojo::Transaction::WebSocket>, $bytes : string);>

Examples:

  $ws->on(text => method : void ($ws : Mojo::Transaction::WebSocket, $bytes : string) { say "Text: $bytes"; });

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

