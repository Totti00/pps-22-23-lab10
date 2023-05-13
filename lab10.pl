%1.1
% search(Elem, List)
search(X, cons(X, _)).
search(X, cons(_, Xs)) :- search(X, Xs).

%1.2
% search2(Elem,List) 
% looks for two consecutive occurrences of Elem
search2(X, cons(X, cons(X, _))).
search2(X, cons(_, Xs)) :- search2(X, Xs).

%1.3
% search_two(Elem, List)
search_two(X, cons(X, cons(E, cons(X, _)))).
search_two(X, cons(_, T)) :- search_two(X, T).
% search_two(a, cons(c, cons(a, cons(a, cons(b, nil))))) -> no
% search_two(a, cons(c, cons(a, cons(d, cons(a, cons(b, nil)))))) -> yes

%1.4
%search_anytwo(Elem, List)
search_anytwo(X, cons(_, T)) :- search_anytwo(X, T).
search_anytwo(X, cons(X, T)) :- search(X, T).
% search_anytwo(a, cons(c, cons(a, cons(a, cons(b, nil)))))
% search_anytwo(a, cons(c, cons(a, cons(d, cons(a, cons(b, nil))))))

%2.1
%size(List, Size)
size(nil, zero).
size(cons(_, T), s(N)) :- size(T, N).
% size(nil, X)
% size(cons(a, cons(b, cons(c, nil))), X)

%2.2
% sum_list(List, Sum)
sum_list(nil, zero).
sum_list(cons(_, T), s(N)) :- sum_list(T, N).
% sum_list(cons(zero, cons(s(s(zero)), cons(s(zero), nil))), X)

%2.3
% count(List, Element, NOccurences)
%it use count(List, Element, NOccurencesSoFar, NOccurences)
count(List, E, N) :- count(List, E, zero, N).
count(nil, E, N, N).
count(cons(E, L), E, N, M) :- count(L, E, s(N), M).
count(cons(E, L), E2, N, M) :- E \= E2, count(L, E2, N, M).
% count(cons(a, cons(b, cons(c, cons(a, cons(b, nil))))), a, N)
% count(cons(a, cons(b, cons(c, cons(a, cons(b, nil))))), a, zero, N)
% count(cons(b, cons(c, cons(a, cons(b, nil)))), a, s(zero), N)
% count(cons(c, cons(a, cons(b, nil))), a, s(zero), N)

%2.4
% max(List, Max)
greater(N, zero).
greater(s(N), s(M)) :- greater(N, M).

max(cons(H, T), Max) :- max(T, H, Max).
max(nil, Max, Max).
max(cons(H, T), Temp, Max) :- greater(H, Temp), max(T, H, Max).
max(cons(H, T), Temp, Max) :- greater(Temp, H), max(T, Temp, Max).
% max(cons(zero, cons(s(zero), cons(zero, cons(s(s(zero)), nil)))), X)

%2.5
% min-max(List, Min, Max)
minMax(cons(H, T), Min, Max) :- minMax(T, H, H, Min, Max).
minMax(nil, TempMin, TempMax, TempMin, TempMax).
minMax(cons(H, T), TempMin, TempMax, Min, Max) :- greater(H, TempMax), minMax(T, TempMin, H, Min, Max).
minMax(cons(H, T), TempMin, TempMax, Min, Max) :- greater(TempMin, H), minMax(T, H, TempMax, Min, Max).
% minMax(cons(zero, cons(s(s(zero)), cons(s(s(s(s(zero)))), cons(zero, nil)))), Min, Max).

%3.1
% same(List1, List2)




