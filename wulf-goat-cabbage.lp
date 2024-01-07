% ziel des rätsels wolf-ziege-kohl ist es alle 3 entitäten von einer seite 
% eines flusses auf die andere zu bekommen. allerdings sind wolf und ziege sowie
% ziege und kohl fressfeinde, so dass die jeweiligen paare nie ohne aufsicht
% auf einer seite verbleiben dürfen. für die überfahrt gibt es ein boot, dass
% maximal platz für zwei entitäten hat. auf dem boot dürfen die fressfeindpaare
% gemeinsam transportiert werden, da sie hier unter der aufsicht eines menschen
% sind.
%
% s(w, g, c) => b(g) => d(g) => b() => s(w, c) => b(c) => d(c) => b(g) => s(g) => b(w) => d(w, c) => b() => s() => b(g) => d(w, c, g)

% entität ans ufer, wenn boot beladen
% entität auf boot, wenn boot leer und fressfeind der entität vorhanden
% boot zum anderen ufer, wenn boot an einem ufer

entity(wulf;goat;cabbage).
shore(source;destination).
%boat(location,entity).
%source(wulf,goat,cabbage).

% alle kombinationen von entitäten am ziel für jede entität M, abzügliche der tuple
% mit doppelten entitäten
% { destination(E1, E2, E3) : entity(E1), entity(E2), entity(E3), E1 != E2, E2 != E3, E1 != E3 } :- entity(M).
{ source(E1) } :- entity(E1).
{ source(E1, E2) : E1 != E2 } :- entity(E1), entity(E2).
{ source(E1, E2, E3) : E1 != E2, E2 != E3, E1 != E3 } :- entity(E1), entity(E2), entity(E3).

source(E1) :- source(), boat(L, E1).
boat(E3) :- source(_, E2, E3), not entity(E2).
boat(E2) :- source(E1, E2, E3), not entity(E1), not entity(E3).
boat(destination, Entity) :- boat(source,Entity).
boat(source,Entity) :- boat(destination,Entity).



% instance
%motive(harry).
%motive(sally).
%guilty(harry).

% encoding
%innocent(Suspect) :- motive(Suspect), not guilty(Suspect).