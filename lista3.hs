{-# LANGUAGE ParallelListComp #-}
--1
--Usando list comprehension, defina uma função add10toall :: [Int] -> [Int], que receba uma lista e adicione o valor 10 a cada elemento dessa lista, produzindo outra lista.

add10toall :: [Int] -> [Int]
add10toall lista = [x+10 | x <- lista] 


--2
--Usando list comprehension, defina uma função multN :: Int -> [Int] -> [Int], que receba um número N e uma lista, e multiplique cada elemento da lista por N, produzindo outra lista.

multN :: Int -> [Int] -> [Int]
multN n lista = [x*n | x <-lista] 


--3
--Usando list comprehension, defina uma função applyExpr :: [Int] -> [Int], que receba uma lista e calcule 3*x+2 para cada elemento x da lista, produzindo outra lista.

applyExpr :: [Int] -> [Int]
applyExpr lista = [3*x + 2 | x <- lista]


--4
--Usando list comprehension, escreva uma função addSuffix :: String -> [String] -> [String] , para adicionar um dado sufixo às strings contidas numa lista.

addSuffix :: String -> [String] -> [String]
addSuffix sufixo lista = [x ++ sufixo| x <- lista]

--5
--Usando list comprehension, defina uma função selectgt5 :: [Int] -> [Int], que receba uma lista e selecione somente os valores maiores que 5, produzindo outra lista.

selectgt5 :: [Int] -> [Int]
selectgt5 lista = [x | x <-lista, x>5]

--6
--Usando list comprehension, defina uma função sumOdds :: [Int] -> [Int], que receba uma lista e obtenha o somatório dos valores ímpares, produzindo outra lista. Pesquise funções auxiliares que manipulem listas.

sumOdds :: [Int] -> Int
sumOdds lista = sum [x | x<-lista, odd x]

--7
--Usando list comprehension, defina uma função selectExpr :: [Int] -> [Int], que receba uma lista e selecione somente os valores pares entre 20 e 50, produzindo outra lista.

selectExpr :: [Int] -> [Int]
selectExpr lista = [x | x<-lista, even x, x >=20, x <=50]

--8
--Escreva uma função countShorts :: [String] -> Int, que receba uma lista de palavras e retorne a quantidade de palavras dessa lista que possuem menos de 5 caracteres. Use list comprehension.

countShorts :: [String] -> Int
countShorts lista = length [x | x <-lista, length x < 5]

--9
--Escreva uma função calcExpr :: [Float] -> [Float], que calcule x^2/2 para cada elemento x da lista de entrada e selecione apenas os resultados que forem maiores que 10. Use list comprehension.

calcExpr :: [Float] -> [Float]
calcExpr lista = filter (> 10) [(x^2)/2 | x <-lista]

--10
--Escreva uma função trSpaces :: String -> String, que receba uma string e converta espaços (' ') em traços ('-'). Use list comprehension.
{-
trSpaces :: String -> String
trSpaces frase = map [if x == '-' then x =" " else x| x <- lista]
-}

--11
--a ) [(2,3),(2,5),(4,5)]

--b ) ["lazyfrog","lazydog","bigfrog","bigdog"]

--c ) "p-r-l-l-p-p-d-"


--12 
--Defina uma função selectSnd :: [(Int,Int)] -> [Int], que receba uma lista de tuplas e selecione somente os segundos elementos dessas tuplas, produzindo outra lista. Use list comprehension.

selectSnd :: [(Int,Int)] -> [Int]
selectSnd lista = [snd x | x <- lista]

--13
--Usando a função zip com list comprehension e outras funções auxiliares, escreva uma função dotProd :: [Int] -> [Int] -> [Int] que calcule o somatório dos produtos dos pares de elementos de duas listas, conforme o exemplo:
{-
dotProd :: [Int] -> [Int] -> [Int]
dotProd listaa listab = [(x,y)| x <- listaa |y <- listab, sum(x y)]
-}

--14
--genRects :: Int -> (Int,Int) -> [(Float,Float,Float,Float)]

--15
--Em Haskell, a função zipWith é uma função de alta ordem que aplica uma função a pares de elementos de duas listas. Pesquise sobre a função zipWith e utilize-a para definir uma função dotProd', que produza o mesmo resultado da função dotProd do exercício 13.

dotProd' :: [Int] -> [Int] -> [Int]
dotProd' listaa listab= zipWith (+) listaa listab
