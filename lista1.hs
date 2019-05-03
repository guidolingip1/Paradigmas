import System.IO
import Data.List

{-Questoes 1 Paradigmas-}

sumSquares :: Int -> Int ->Int
sumSquares x y = x^2 + y^2

--Aqui se a boleana for verdadeira retorna True se nao False
hasEqHeads :: [Int] -> [Int] -> Bool
hasEqHeads a b = (head a) == (head b)


addSuper :: [String] -> [String]
addSuper lista = map("Super "++) lista

contaespaco :: String -> Int
contaespaco frase = length (filter(==' ') frase)


cinco :: [Float] -> [Float]
cinco lis = map (\x -> 3*x^2 + 2/x +1) lis

--APLICAR FILTER PARA ISOLAR ALGO EXEMPLO NUMEROS MENORES QUE 0 OU ESPAÇOS
negativos :: [Float] -> [Float]
negativos lis = filter (<0) lis


-- CUIDAR O uso de && exemplo x .. && "x"
entre :: [Int] -> [Int]
entre num = filter (\x -> x >= 1 && x <= 100) num


idade :: [Int] -> [Int]
idade list = filter (\x -> 2019 - x > 1980) list

--Crio uma lista de int determino que o resultado é outra lista de int
par :: [Int] -> [Int]
-- determino que se o X só sera passado para a outra lista se o seu módulo de 2 for igual de 0
par list = filter (\x -> mod x 2==0)list

--Inserir letra como ' ' e não ""
charFound :: Char -> String -> Bool
charFound letra frase = filter(==letra)frase/=[]

nomea :: [String] -> [String]
nomea list = filter(\x -> last x == 'a') list




