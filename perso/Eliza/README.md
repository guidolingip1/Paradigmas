# Eliza
### Como rodar o código:
* Baixar Eliza.pl
* Abrir terminal e ir até o local do código utilizando cd.
* Rodar o swipl no terminal, digitar swipl
* Rodar o código com [eliza].


### Como a Eliza funciona:


A Eliza possui um loop principal que recebe o input do usuário,
ao receber o input (frase), ela trabalha o input tornando as letras em letras minúsculas, retirando pontuações e após isso ela quebra o input em palavras,
separa  por palavras chave e retorna uma possível 
resposta baseada na palavra chave escolhida, em alguns casos retorna uma frase
padrão ("default").


```prolog
rules([[keyword, importance of keyword],[
        [pattern #, [the pattern], last response used,
            [response 1],
            [response 2],
            ...
            [response n]]]]).
```

Transformação das letras para minúsculas.
```prolog
Lower_case(X,Y) :-
	X >= 65,
	X =< 90,
	Y is X + 32, !.

