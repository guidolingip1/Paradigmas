import Data.Char
import Data.List
import Text.Read

--1 Determina se a letra é uma vogal
isVowel :: Char -> Bool
isVowel x = (x == 'a' || x == 'e' || x == 'i' || x == 'o' ||  x == 'u')

--2 Função que adiciona vírgula no final de strings
--AHAAAAAAA eu sabia que eu ia conseguir :D
addComma :: [String] -> [String]
addComma list = map (++",")list

--3 Recebe uma lista e retorna uma lista formatada em HTML
--Depois de horas resolvido
htmlListItems :: [String] -> [String]
htmlListItems list = map(\n -> "<LI>" ++ n ++ "<LI>")list

--4 Retira vogais de uma string
retiravogal :: String -> String
retiravogal frase = filter (\x -> x == 'b' || x == 'c' || x == 'd' || x == 'f' ||  x == 'g'||  x == 'h'||  x == 'j'||  x == 'k'||  x == 'l'||  x == 'm'||  x == 'n'||  x == 'p'||  x == 'q'||  x == 'r'||  x == 's'||  x == 't'||  x == 'v'||  x == 'x'||  x == 'y'||  x == 'z') frase

--5 Função que substitui caracteres por - menos os espaços
subs :: String -> String
subs xs = concat [if x == ' ' then " " else "-" | x <- xs]

--6 Retorna o Primeiro nome
firstName :: String -> String
firstName xs = takeWhile (/=' ') xs

--7 recebe uma string e determina se é um numero
--como retornava Nothing ou Just alguma coisa foi feito um case of para True or False
isInt :: String -> Bool
isInt frase =
  case (readMaybe frase :: Maybe Int) of
    Nothing -> False
    Just _  -> True

--8 Me perdi todo :(
lastName :: String -> String
lastName xs = dropWhile (/= ' ') xs

--9 Não consegui

--10 Não consegui
--11 
encodeName :: String -> String
encodeName xs=  concat [if x == 'a' then "4" else x]

--12 Me enrolei também
concatPalavras :: [String] -> [String]
concatPalavras list = while length list <10 map(\n ->n ++ ".")

{-Professora, passei horas e horas em cima disso, não joguei,
não vadiei, fiquei só em cima disso e mesmo assim não entendi direito,
a disciplina tem um monitor ?, é possivel uma aula de resolução de exercicios ?-}