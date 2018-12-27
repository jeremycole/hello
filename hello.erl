% Erlang

% This is Hello World
% written in Erlang.

-module(hello).
-export([start/0]).

hello(0) -> [];
hello(I) when I > 0 ->
  io:fwrite("Hello, World!\n"), % Greetings.
  hello(I-1).

start() -> hello(10).