{-
Trabalho 2
Guilherme Guidolin
Paradigmas de programação
-}

{-# LANGUAGE ParallelListComp #-} --Importei para resolver o caso 1
import Text.Printf
import Data.List (sort)

type Point     = (Float,Float)--(x,y)
type Rect      = (Point,Float,Float) --(x,y),w,h
type Circle    = (Point,Float)--(x,y),r


-------------------------------------------------------------------------------
-- Paletas
-------------------------------------------------------------------------------

rgbPalette :: Int -> [(Int,Int,Int)]
rgbPalette n = take n $ cycle [(255,0,0),(0,255,0),(0,0,255)]

greenPalette :: Int -> [(Int,Int,Int)]
greenPalette n = [(0,80+i*10,0) | i <- [0..n] ]

multiColorPallete :: Int -> [(Int,Int,Int)] --Tentei encontrar uma lógica como encontrei na 1, mas como não encontrei entao fiz por lista.
multiColorPallete n = [(r,g,b) | r <- listaR | g <- listaG | b <- listaB ]
  where 
    listaR = [0,255,255,255,255,255,120,0,63,0,63,0]
    listaG = [255,255,122,0,63,0,0,63,0,255,255,255]
    listaB = [0,0,0,0,122,255,255,255,255,255,255,62]



-------------------------------------------------------------------------------
-- Funções geradoras
-------------------------------------------------------------------------------


geraMatriz :: Int -> [Rect]
geraMatriz n = [((x*(w+gap),y*(h+gap)),w,h) | x <- take n (cycle listaX)| y <-  sort(take n (cycle listaY))]
  where (w,h) = (50,50)
        gap = 10
        nraiz = sqrt (fromIntegral  n)
        listaX = [0..(nraiz-1)]   
        listaY = [0..(nraiz-1)]  

genCirclesInCircle :: Int -> [Circle] 
genCirclesInCircle n = [( (cx + 50 * sin((graus * x) * divRad), cy + 50 * cos((graus * x) * divRad) ), r ) | x <- [0..fromIntegral(n-1)]]
  where r = 10
        graus = fromIntegral(360) / fromIntegral(n) -- graus de cada step
        divRad = pi / fromIntegral(180) -- divisão para obter angulo em radianos
        cx = 100 -- coordenadas xy do circulo central
        cy = 100


-------------------------------------------------------------------------------
-- Strings SVG
-------------------------------------------------------------------------------

-- Gera string representando retângulo SVG 
-- dadas coordenadas e dimensoes do retângulo e uma string com atributos de estilo
svgRect :: Rect -> String -> String 
svgRect ((x,y),w,h) style = 
  printf "<rect x='%.3f' y='%.3f' width='%.2f' height='%.2f' style='%s' />\n" x y w h style

svgCircle :: Circle -> String -> String 
svgCircle ((x,y),r) style = 
  printf "<circle cx='%.3f' cy='%.3f' r='%.2f' style='%s'/>\n" x y r style
-- String inicial do SVG
svgBegin :: Float -> Float -> String
svgBegin w h = printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h 

-- String final do SVG
svgEnd :: String
svgEnd = "</svg>"

-- Gera string com atributos de estilo para uma dada cor
-- Atributo mix-blend-mode permite misturar cores
svgStyle :: (Int,Int,Int) -> String
svgStyle (r,g,b) = printf "fill:rgb(%d,%d,%d); mix-blend-mode: screen;" r g b


-- Gera strings SVG para uma dada lista de figuras e seus atributos de estilo
-- Recebe uma funcao geradora de strings SVG, uma lista de círculos/retângulos e strings de estilo
svgElements :: (a -> String -> String) -> [a] -> [String] -> String
svgElements func elements styles = concat $ zipWith func elements styles

-------------------------------------------------------------------------------
-- Função principal que gera arquivo com imagem SVG
-------------------------------------------------------------------------------


genCase1 :: IO ()
genCase1 = do
  writeFile "case1.svg" $ svgstrs
  where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
        svgfigs = svgElements svgRect rects (map svgStyle palette)
        rects = geraMatriz nrects
        palette = greenPalette nrects
        nrects = 5*5 --Colocar o tamanho da matrix

        (w,h) = (1500,500) -- width,height da imagem SVG



genCase2 :: IO ()
genCase2 = do
  writeFile "case2.svg" $ svgstrs
  where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd 
        svgfigs = svgElements svgCircle circles (map svgStyle palette)
        circles = genCirclesInCircle nCircles
        palette = multiColorPallete nCircles
        nCircles = 12 -- qtd de circulos
        (w,h) = (1500,500) -- width,height da imagem SVG