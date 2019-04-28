%1
%run odd(3).
odd(N) :- X is mod(N,2),
    X = 1.

%2
%run hasN([1,2,3],3).
hasN([],0).
hasN(Lista,Tamanho) :-
  Lista = [_|X],
  hasN(X,M),
  Tamanho is 1+M.

%3
%run inc99([1,2,3],N).
inc99([],[]).
inc99(Lista1,Lista2) :-
  Lista1 = [H|X],
  Lista2 = [B|Y],
  B is H+99,
  inc99(X,Y).

%4
%run incN([1,2,3],D,31).
incN([],[],_).
incN(Lista1,Lista2,N) :-
  Lista1 = [H|X],
  Lista2 = [B|Y],
  B is H+N,
  incN(X,Y,N).

%5
%run comment(["oi","tudo","bem"],N).
comment([],[]).
comment(Lista1,Lista2) :-
  Lista1 = [H|X],
  Lista2 = [B|Y],
  string_concat("%%", H, B),
  comment(X,Y).

%6
%run onlyEven([1,2,3],N).
onlyEven([],[]).
onlyEven(Lista1,Lista2) :-
  Lista1 = [H|X],
  0 is mod(H,2),
  Lista2 = [B|Y],
  B is H,
  onlyEven(X,Y), !.

onlyEven(Lista1,Lista2) :-
  Lista1 = [H|T],
  onlyEven(T,Lista2).

%7
%run countdown(4,L).
countdown(0,[]).
countdown(N,L) :-
  L = [A|Y],
  A is N,
  B is N-1,
  countdown(B,Y), !.

%8
%run nRandoms(3,L).
nRandoms(0,[]).
nRandoms(N,L) :-
  L = [H|T],
  random(1,100,H),
  A is N-1,
  nRandoms(A,T), !.

%9
%run potN0(3,L).
potN0(-1,[]).
potN0(N,L) :-
  L = [A|Y],
  A is 2^N,
  B is N-1,
  potN0(B,Y), !.

%10
%run zipmult([1,2],[2,3],L).
zipmult([],[],[]).
zipmult(L1,L2,L3) :-
  L1 = [H1|T1],
  L2 = [H2|T2],
  L3 = [H3|T3],
  H3 is H1*H2,
  zipmult(T1,T2,T3), !.

