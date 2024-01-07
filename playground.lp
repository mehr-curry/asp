moves(3).

{ move(T)} = 1 :- moves(M), T = 1..M.

%move(0) :-.
move(T) :- move(T+1),moves(T).
%move(T) :- move(T), moves(T).
