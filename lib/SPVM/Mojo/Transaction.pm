package SPVM::Mojo::Transaction;



1;

=head1 Name

SPVM::Mojo::Transaction - Transaction base class

=head1 Description

Mojo::Transaction class in L<SPVM> has methods to do someting.

=head1 Usage

  class Mojo::Transaction::MyTransaction extends Mojo::Transaction {
  
  }
  
=head1 Super Class

L<Mojo::EventEmitter|SPVM::Mojo::EventEmitter>

=head1 Events

=head2 connection

Emitted when a connection has been assigned to transaction.

Examples:

  $tx->on(connection => method : void ($tx : Mojo::Transaction, $connection : ) {...});

=head2 finish

Emitted when transaction is finished.

Examples:

  $tx->on(finish => method : void ($tx : Mojo::Transaction) {...});

=head1 Fields

=head2 kept_alive

  has kept_alive : rw byte;

=head2 local_address

  has local_address : rw string;

=head2 local_port

  has local_port : rw int;

=head2 original_remote_address

  has original_remote_address : rw string;

=head2 remote_port

  has remote_port : rw int;

=head2 req

  has req : rw Mojo::Message::Request

=head2 res

  has res : rw Mojo::Message::Response

=head2 completed

  has completed : byte;

=head2 connection

  has connection : rw string
  
=head1 Class Methods



=head1 Instance Methods



=head1 See Also




=head1 Repository



=head1 Author

Yuki Kimoto C<kimoto.yuki@gmail.com>

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License

