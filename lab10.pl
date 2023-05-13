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
greater(s(_), zero).
greater(s(N), s(M)) :- greater(N, M).
greaterEqual(_, zero).
greaterEqual(s(N), s(M)) :- greaterEqual(N, M).

max(cons(H, T), Max) :- max(T, H, Max).
max(nil, Max, Max).
max(cons(H, T), Temp, Max) :- greater(H, Temp), max(T, H, Max).
max(cons(H, T), Temp, Max) :- greaterEqual(Temp, H), max(T, Temp, Max).
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
same(L, L).
% same(cons(zero, nil), cons(zero, nil))

%3.2
% all_bigger(List1, List2)
allBigger(nil, nil).
allBigger(cons(H, T), cons(H1, T1)) :- greater(H, H1), allBigger(T, T1).
% allBigger(cons(s(s(zero)), cons(s(zero), nil)), cons(s(zero), cons(zero, nil)))

%3.3
% sublist(List1, List2)
sublist(nil, _).
sublist(cons(H, T), L) :- search(H, L), sublist(T, L).
% sublist(cons(a, cons(b, nil)), cons(c, cons(b, cons(a, nil))))

%4.1
% seq(N, E, List)
seq(zero, _, nil).
seq(s(N), E, cons(E, T)) :- seq(N, E, T).
%seq(s(s(s(zero))), a, cons(a,cons(a,cons(a,nil)))).

%4.2
% seqR(N, List)
seqR(zero, nil).
seqR(s(N), cons(H, T)) :- N = H, seqR(N, T).
% seqR(s(s(s(zero))), cons(s(s(zero)),cons(s(zero),cons(zero,nil))))

%4.3
% seqR2(N, List)
last(nil, N, cons(N, nil)).
last(cons(H, T), N, cons(H, T1)) :- last(T, N, T1).

seqR2(N, L) :- seqR2(N, nil, L).
seqR2(zero, L, L).
seqR2(s(N), L, R) :- seqR2(N, L, Last), last(Last, N, R).
%seqR2(s(s(s(zero))), cons(zero,cons(s(zero),cons(s(s(zero) ),nil))))

%5.1 last(List, N): N is the last elemente in list
last(cons(H, nil), H).
last(cons(_, T), R) :- last(T, R).
% last(cons(zero, cons(s(zero), nil)), X)

%5.1 map(+LI, -LO): return a list like the input list but each elements is added by 1
map(nil, nil).
map(cons(H, T), cons(s(H1), T1)) :- map(T, T1).
% map(cons(zero, cons(s(zero), cons(s(s(zero)), nil))), cons(s(zero), cons(s(s(zero)), cons(s(s(s(zero))), nil))))

%5.1 filter(+LI, -LO): return a list like the input list but only with elements > 0
filter(cons(X, nil), cons(X, nil)) :- greater(X, zero).
filter(cons(X, nil), nil) :- greater(zero, X).
filter(cons(H, T), cons(H, T1)) :- greater(H, zero), filter(T, T1).
filter(cons(zero, T), T1) :- filter(T, T1).
% filter(cons(zero, cons(s(zero), cons(s(s(zero)), nil))), cons(s(zero), cons(s(s(zero)), nil)))

%5.2 count(List, N): N is the number of elements > 0 in list
count(nil, zero).
count(cons(H, T), s(N)) :- greater(H, zero), count(T, N).
count(cons(zero, T), N) :- count(T, N).
% count(cons(zero, cons(s(s(s(zero))), cons(s(s(zero)), nil))), s(s(zero)))

%5.2 find(List, E): E is the first element > 0 in list
find(nil,nil).
find(cons(H, _), H) :- greater(H, zero).
find(cons(zero, T), E) :- find(T, E).
% find(cons(zero, cons(s(s(zero)), cons(s(zero), nil))), s(s(zero)))

%5.3 dropRight(+LI, N, -LO): L0 is like input list but without last N elements
dropRight(LI, N, LO) :- dropRight(LI, N, M, LO).
dropRight(nil, N, zero, nil).
dropRight(cons(H, T), N, s(M), cons(H, T1)) :- greaterEqual(M, N), dropRight(T, N, M, T1).
dropRight(cons(_, T), N, s(M), R) :- greater(N, M), dropRight(T, N, M, R).
% dropRight(cons(a, cons(b, cons(c, nil))), s(zero), cons(a,cons(b,nil)))

%5.3 dropWhile(+LI, -LO): LO is like input list but without the longest prefix consisting of elements > 0
dropWhile(cons(H, T), cons(H, T)) :- greater(H, zero).
dropWhile(cons(zero, T), L) :- dropWhile(T, L).
% dropWhile(cons(zero, cons(zero, cons(zero, cons(s(s(zero)), nil)))), cons(s(s(zero)),nil))

%5.4 partition(List, ListGood, listNoGood): ListGood contains the elements > 0, instead listNoGood contains the others
partition(nil ,nil, nil).
partition(cons(H, T), cons(H, T1), L) :- greater(H, zero), partition(T, T1, L).
partition(cons(zero, T), L, cons(H, T1)) :- partition(T, L, T1).
%[0, 2, 0, 1, 3, 0] -> [2, 1, 3], [0,0,0]
%partition(cons(zero, cons(s(s(zero)), cons(zero, cons(s(zero), cons(s(s(s(zero))), cons(zero, nil)))))), cons(s(s(zero)), cons(s(zero), cons(s(s(s(zero))), nil))), cons(zero, cons(zero, cons(zero, nil))))

%5.4 reversed(+List, -ListReversed): reverse the list
reversed(L, LR) :- reversed(L, nil, LR).
reversed(nil, LR, LR).
reversed(cons(H, T), T1, LR) :- reversed(T, cons(H, T1), LR).
% reversed(cons(zero, cons(s(s(zero)), nil)), cons(s(s(zero)), cons(zero, nil))) 

%5.5 drop(+LI, N, -LO): LO is like input list without first N elements
drop(T, zero, T).
drop(cons(H, T), s(N), R) :- drop(T, N, R).
%drop(cons(zero, cons(s(s(zero)), cons(zero, cons(s(zero), cons(s(s(s(zero))), cons(zero, nil)))))), s(s(zero)), X)

%5.5 take(+LI, N, -LO): LO is like input list with first N elements
take(L, zero, nil).
take(cons(H, T), s(N), cons(H, T1)) :- take(T, N, T1).
%take(cons(zero, cons(s(s(zero)), cons(zero, cons(s(zero), cons(s(s(s(zero))), cons(zero, nil)))))), s(s(zero)), X)

%5.5 zip(L1, L2, L3): L3 consists of the tuples of the elements of L1 and L2
zip(nil, nil, nil).
zip(cons(H, T), cons(H1, T1), cons(cons(H, H1), O)) :- zip(T, T1, O).
%zip(cons(zero, cons(s(s(zero)), nil)), cons(zero, cons(s(zero), nil)), X)




