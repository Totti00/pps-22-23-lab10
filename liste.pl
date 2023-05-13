% find: L x E -> Boolean
find(cons(E, _), E).
find(cons(_, T), E) :- find(T ,E).

% Esempio -> find(cons(a, cons(b, cons(c, nil))), X) -> restituisce 
% tutti gli elementi

% position: L x N x E -> Boolean
position(cons(E, _), zero, E).
position(cons(_, T), s(N), E) :- position(T, N, E).

% concat: L x L -> L
concat(nil, L, L).
concat(cons(H, T), L, cons(H, O)) :- concat(T, L, O).
% Esempio -> concat(cons(zero, cons(zero, nil)), zero)

%count
count(nil, _, zero).
count(cons(E, L), E, s(N)) :- count(L, E, N).
count(cons(E, L), E2, N) :- E \= E2, count(L, E2, N).

