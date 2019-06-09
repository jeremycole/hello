# Tcl

if 0 {
  This is Hello World
  written in Tcl.
}

proc hello {n} {
  for {set i 0} {$i < $n} {incr i} {
    puts "Hello, World!" ; # Greetings
  }
}

hello 10
