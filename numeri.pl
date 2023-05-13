% succ: N -> N
succ(N, s(N)).

% Esempio -> succ(s(s(s(zero))), s(s(s(s(zero)))))
% X vale -> X/s(s(s(s(zero))))
% Esempio -> succ(X,Y)
% Esempio -> succ(X,s(s(s(s(zero)))))

% sum: N x N -> N
sum(zero, N, N).  % Esempio -> sum(zero, s(s(zero)), Y)
sum(s(N), M, s(O)) :- sum(N, M, O).
% Esempio -> sum(s(zero), s(zero), s(s(zero)))

%mul: N x N -> N
mul(zero, N, zero).
mul(s(N), M, O2) :- mul(N, M, O), sum(O, M, O2).
% Esempio -> mul(s(s(s(zero))), s(s(zero)), O)

% dec: N -> N (è parziale, non si applica a tutti gli elementi del dominio)
dec(s(N), N).
% Esempio -> dec(s(zero),O)

%fattoriale: N -> N
factorial(zero, s(zero)).
factorial(s(N), O) :- factorial(N, O2), mul(O2, s(N), O).

%greater: N x N -> Boolean
greater(s(_), zero).
greater(s(M), s(N)) :- greater(M, N).


%nextPrev
nextprev(s(N), N, s(s(N))).



