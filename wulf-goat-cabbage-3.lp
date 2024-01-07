%(ohne Züge)
%Fakten
%Zwei Positionen links und rechts
%4 dimensionaler Vektor mit Positionen von Wolf, Ziege, Kohl und Mensch
%
%Generator
%Alle Kombinationen der Positionen der Entitäten 
%
%Regeln
%Start: Alle 4 Positionen auf links
%Menschposition abwechselnd links oder rechts
%Nie Wolf und Ziege oder Ziege und Kohl auf derselben Position (evtl. constraint?)
%Immer nur Bewegung von einer Entität, die nicht der Mensch ist
%
%Ziel
%alle 4 positionen auf rechts

pos(0;1).
start(0,0,0,0).
%goal(1,1,1,1).
moves(5).

% Menge aller Positionen der 4 Entitäten + Zeitindex
% Die Position des Menschen wird mit jedem Schritt gewechselt, da er mit dem Boot immer die Seite wechseln muss.
%{ move(Wulf, Goat, Cabbage, HumanPos, T) } :- pos(Wulf), pos(Goat), pos(Cabbage), moves(M), T = 1..M, HumanPos = T \ 2.
{ move(Wulf, Goat, Cabbage, HumanPos, T) : pos(Wulf), pos(Goat), pos(Cabbage), HumanPos = T \ 2 } = 1 :- moves(M), T = 1..M.

%on(0,0,0,0,1) :- start(0,0,0,0).
%on(W, G, C, H, T) :- move(W, G, C, H, T), moves(T).
move(W, G, C, T \ 2, T) :- move(W, G, C, T \ 2, T+1), moves(T).
%blocked(W, G, C, H, T) :- on(W, G, C, H, T), W == G != H, moves(T).
%blocked(W, G, C, H, T) :- on(W, G, C, H, T), G == C != H, moves(T).

% entferne Wolf und Ziege ohne Mensch, Kohl und Seite sind egal
:- move(1,1,_,0,_). :- move(0,0,_,1,_).
%:- blocked(W, G, C, H, T).
% entferne Ziege und Kohl ohne Mensch, Wolf und Seite sind egal
:- move(_,1,1,0,_). :- move(_,0,0,1,_).

#show move/5.
