package SPVM::Mojo::File;



1;

=head1 Name

SPVM::Mojo::File - File system paths

=head1 Description

Mojo::File class in L<SPVM> is a scalar-based container for file system paths that provides a friendly API for dealing with different
operating systems.

=head1 Usage

  use Mojo::File;

  # Portably deal with file system paths
  my $path = Mojo::File->new("/home/sri/.vimrc");
  say $path->slurp;
  say $path->dirname->to_string;
  say $path->basename;
  say $path->extname;
  say $path->sibling(".bashrc")->to_string;

  # Use the alternative constructor
  my $path = Mojo::File->path("/tmp/foo/bar")
  $path->make_path;
  $path->child("test.txt")
  $path->spew("Hello Mojo!");

=head1 Details



=head1 Super Class



=head1 Interfaces



=head1 Enumerations



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

