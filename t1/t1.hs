--Determina se a letra é uma vogal
isVowel :: Char -> Bool
isVowel x = (x == 'a' || x == 'e' || x == 'i' || x == 'o' ||  x == 'u')

--Função que adiciona vírgula no final de strings
--AHAAAAAAA eu sabia que eu ia conseguir :D
addComma :: [String] -> [String]
addComma list = map (++",")list

--Recebe uma lista e retorna uma lista formatada em HTML
--Depois de horas resolvido
htmlListItems :: [String] -> [String]
htmlListItems list = map(\n -> "<LI>" ++ n ++ "<LI>")list

--Retira vogais de uma string
retiravogal :: String -> String
retiravogal frase = filter (\x -> x == 'b' || x == 'c' || x == 'd' || x == 'f' ||  x == 'g'||  x == 'h'||  x == 'j'||  x == 'k'||  x == 'l'||  x == 'm'||  x == 'n'||  x == 'p'||  x == 'q'||  x == 'r'||  x == 's'||  x == 't'||  x == 'v'||  x == 'x'||  x == 'y'||  x == 'z') frase

--Função que substitui caracteres por - menos os espaços
subs :: String -> String
subs xs = concat [if x == ' ' then " " else "-" | x <- xs]
