:- dynamic parents_of/3.
mother_of(C, M) :- parents_of(C, _, M).
father_of(C, F) :- parents_of(C, F, _).

sibling_of(C1, C2) :-
  parents_of(C1, F, M),
  parents_of(C2, F, M),
  C1 \= C2.

parent_of(C, P) :- parents_of(C, P, _).
parent_of(C, P) :- parents_of(C, _, P).

ancestor_of(A, B) :- parent_of(A, B).
ancestor_of(A, B) :- parent_of(A, X), ancestor_of(X, B).

% ?- aggregate_all(count, father_of(_, philip), Count). Count = 4.
