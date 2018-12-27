# Perl

=begin comment
This is Hello World
written in Perl.
=end comment
=cut

sub hello {
  my $n = @_[0];
  for($i = 0; $i < $n; $i++) {
    print "Hello, World!\n" # Greetings.
  }
}

hello 10