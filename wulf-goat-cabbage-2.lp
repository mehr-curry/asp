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
%vec(pos,pos,pos,pos).
start(0,0,0,0).
goal(1,1,1,1).

% Menge aller Positionen der 4 Entitäten
{ on(Wulf, Goat, Cabbage, Human) } :- pos(Wulf), pos(Goat), pos(Cabbage), pos(Human).

%Befinden sich zwei feindliche Entitäten auf derselben Seite? 
%foes(W, G, C) :- on(W, G, C, H), 1 #count {W == G != H, G == C != H} 3.

on(W, G, C, H) :- start(W, G, C, H).
%kandidaten für positionen: 0 1 0 1 -> mensch bringt ziege an ziel
%on(W, G, C, 1) :- on(W, G, C, H), H == 0.
%on(W, G, C, 0) :- on(W, G, C, H), H == 1.
moveH(1) :- on(W, G, C, H), H == 0.

%move(Wulf, Goat, Cabbage, 1) :- move(Wulf, Goat, Cabbage, 0).
%move(Wulf, Goat, Cabbage, 0) :- move(Wulf, Goat, Cabbage, 1).

% entferne Wolf und Ziege ohne Mensch, Kohl ist egal
%:- on(1,1,_,0). :- on(0,0,_,1).
% entferne Ziege und Kohl ohne Mensch, Wolf ist egal
%:- on(_,1,1,0). :- on(_,0,0,1).


%#show on/4.