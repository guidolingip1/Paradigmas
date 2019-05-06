% vitima

vitima(anita).

% onde os suspeitos estavam
%segunda

segunda(pedro , santa_maria).
segunda(caren , porto_alegre).
segunda(henrique , apartamento).
segunda(bia , apartamento).
segunda(adriano , apartamento).
segunda(alice , apartamento).
segunda(bernardo , santa_maria).
segunda(maria , apartamneto).

%terca

terca(pedro , santa_maria).
terca(caren , porto_alegre).
terca(henrique , porto_alegre).
terca(bia , porto_alegre).
terca(adriano , apartamento).
terca(alice , porto_alegre).
terca(bernardo , santa_maria).
terca(maria , santa_maria).

%quarta

quarta(pedro , porto_alegre).
quarta(caren , porto_alegre).
quarta(henrique , apartamento).
quarta(bia , porto_alegre).
quarta(adriano , santa_maria).
quarta(alice , porto_alegre).
quarta(bernardo , porto_alegre).
quarta(maria , santa_maria).

%quinta

quinta(pedro , santa_maria).
quinta(caren , santa_maria).
quinta(henrique , apartamento).
quinta(bia , santa_maria).
quinta(adriano, apartamento).
quinta(alice , apartamento).
quinta(bernardo , santa_maria).
quinta(maria , santa_maria).

%sexta

sexta(pedro , apartamento).
sexta(caren , apartamento).
sexta(henrique , apartamento).
sexta(bia , apartamento).
sexta(adriano , apartamento).
sexta(alice , apartamento).
sexta(bernardo , apartamento).
sexta(maria , apartamneto).


% pobres  !$$$$

pobre(bernardo).
pobre(bia).
pobre(pedro).
pobre(maria).


% insanos ミ●﹏☉ミ

insano(adriano).
insano(maria).


% ricos $$$$$

rico(alice).
rico(henrique).
rico(adriano).
rico(caren).

% relacionamento (｡◕‿◕｡)

relacionamento(anita, bernardo).
relacionamento(bernardo, anita).

relacionamento(bernardo, caren).
relacionamento(caren, bernardo).

relacionamento(anita, pedro).
relacionamento(pedro, anita).

relacionamento(pedro, alice).
relacionamento(alice, pedro).

relacionamento(alice, henrique).
relacionamento(henrique, alice).

relacionamento(henrique, maria).
relacionamento(maria, henrique).

relacionamento(maria, adriano).
relacionamento(adriano, maria).

relacionamento(adriano, caren).
relacionamento(caren, adriano).


% cena do crime (ง'̀-'́)ง

cena_do_crime(X) :- quinta(X, apartamento); sexta(X, apartamento).


% roubos

roubou_arma(X) :- quarta(X, santa_maria); quinta(X, porto_alegre); quarta(X, apartamento); quinta(X, apartamento).
roubou_chave(X) :- segunda-feira(X, santa_maria); terca(X, porto_alegre).

% acesso a cena do crime

acesso(X) :- roubou_arma(X), roubou_chave(X), cena_do_crime(X).

% motivos

ciumes(X,Y) :- relacionamento(X,A), relacionamento(Y,A).

motivo(X) :- ciumes(X, anita); pobre(X); insano(X).

% Assassino t(ಠ益ಠt)

assassino(X) :- motivo(X), acesso(X).


