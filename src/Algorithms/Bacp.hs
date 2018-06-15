{-# LANGUAGE DeriveGeneric #-}

module Algorithms.Bacp (splitByTwoDots, getCustomAudience) where
    
import Lib.Prelude

<<<<<<< HEAD
import qualified Data.List as D

=======
import qualified Data.List as L
>>>>>>> 417e6491402be7e1c60d14060c5682f2a74113d8
import qualified Data.Char as Charq
import qualified Data.Text as T

--transpose2:: (forall a, Num a) => [[a]] -> [[a]]
transpose2 ([]:_) = []
<<<<<<< HEAD
transpose2 x = (D.map D.head x) : transpose (D.map D.tail x)
=======
transpose2 x = (L.map L.head x) : transpose (L.map L.tail x)
>>>>>>> 417e6491402be7e1c60d14060c5682f2a74113d8

--haddamardProd v1 v2 = [(v1!!i)*(v2!!i) | i <- [0..((length v1)-1)]]

{- Implementacion de producto de haddamard para matrices. Producto componente
   a componente de dos matrices. Por ejemplo,

   haddamardM [[1,2],[0,3]] [[4,3],[3,3]]==[[4,6],[0,9]]
-}

--haddamardM xss yss = [haddamardProd (xss!!i) (yss!!i) | i <- [0..((length xss)-1)]]

--row1 n v = map (fromEnum.(==v)) [1..n]

--row n v = convIntToNumB (row1 n v)

--vectSum :: [Integral] -> [Integral] -> [Integral]
--vectSum v1 v2 = [(v1!!i)+(v2!!i) | i <- [0..((length v1)-1)]]

--fPB xs n = foldr (.) id [vectSum (row n (xs!!i)) | i <- [0..((length xs)-2)]] (row n (xs!!((length xs)-1)))

--vSum xs = foldr (.) id [vectSum (xs!!i) | i <- [0..((length xs)-2)]] (xs!!((length xs)-1))

--vProd xs = foldr (.) id [haddamardProd (xs!!i) | i <- [0..((length xs)-2)]] (xs!!((length xs)-1))

{- funciones para hacer cero a elementos delante de la posicion i, 
   asi setZeroFrom 2 [3,4,5,6,7,8,9]==[3,4,5,0,0,0,0]-}

--zeroFrom p1 px x
--   | px <= p1    = x
--   | otherwise   = 0

--setZeroFrom i xs = [zeroFrom i j (xs!!j) | j <- [0..((length xs)-1)]]

-----------------------------------------------
{- estas funciones permiten que los numeros delante del primer 1
   de la lista, haga a los demas 0 desde la posicion siguiente
   en adelante en cada fila de una matriz. Por ejemplo
   onePerSet [[1,1,0], == [[1,0,0],
              [1,1,1],     [1,0,0],
              [0,1,1],     [0,1,0],
              [0,0,1]]     [0,0,1]]
                    
   -}

--positionsBoolSet xs = [i | i <- [0..((length xs)-1)], (xs!!i)==1]

--correctionEmpty xs
--   | xs == []  = [0]
--   | otherwise = xs

{- esta funcion corrige la funcion de posicion para cuando no hay 1s en
   el conjunto. Lleva vacio a 0.-}

--correctedPosSet xs = correctionEmpty (positionsBoolSet xs)

{- función que transforma matriz binaria en una donde no se repiten elementos por fila 
   para este caso, que un curso no se repita en mas de un periodo. -}

--onePerSet xss = [setZeroFrom (minimum (correctedPosSet (xss!!i))) (xss!!i) 
--                | i <- [0..((length xss)-1)]
--                ]

--validMatrix xss
--  | nub (vSum (transpose2 xss)) == [0,1] = True
--  | nub (vSum (transpose2 xss)) == [1,0] = True
--  | nub (vSum (transpose2 xss)) == [1]   = True
--  | otherwise                            = False

--svalidMatrix xss
--  | 0  `elem`(vSum xss)  = False
--  | otherwise            = True

--max_load xss = maximum (vSum (haddamardM xss traspLoad))

--loadOf xss = vSum (haddamardM xss traspLoad)

--course_load = [3, 6, 6, 6, 2, 3, 4, 1, 8, 1, 7, 2, 2, 3, 7, 1, 8, 8, 2, 4, 9, 7, 5, 10, 3, 10, 8, 8, 3, 5, 7, 7, 10, 5, 5, 4, 7, 8, 4, 6, 1, 2, 7, 2, 7, 3, 4, 6, 3, 5]

--course_load_1 = [4, 4, 3, 3, 3, 2, 3, 3, 2, 2, 5, 5, 5, 1, 5, 3, 4, 4, 1, 4, 4, 4, 4, 5, 1, 2, 1, 5, 2, 2, 1, 1, 2, 2, 2, 4, 4, 3, 1, 1, 2, 5, 2, 1, 4, 5, 1, 2, 3, 5] --5,3,4,3,3,1,5,1,3,2,3,1,2,2,4]

--test_load = [5,4,2,3,3,4,3,1,2,2,5,5,5,1,5,3,4,4,1,4,4,4,4,5,1,2,1,5,2,2,1,1,2,2,2,4,4,3,1,1,2,5,2,1,4,5,1,2,3,5,4,5,3,4,3,3,1,5,1,3,2,3,1,2,2,4]

--promSetPer p xs = (fromIntegral (sum xs))/p

--loadMatrix = [course_load | i <- [1..10]]

--traspLoad = transpose2 (loadMatrix)



splitByTwoDots :: [Char] -> [[Char]]
splitByTwoDots x =
     splitHelper [] [] x
         

splitHelper :: [[Char]] -> [Char] -> [Char] -> [[Char]]
splitHelper acum header act =
    case act of
        (':' : z) ->
            splitHelper
                (acum ++ ([header ++ ""]))
                []
                z


        (y : z) ->
            splitHelper
                acum
                (header ++ [y])
                z

        [] ->
            acum ++ [header]

computePairs :: ([Char], [Char]) -> Maybe ([Char], [Char])
computePairs (x, y) = if y=="segmento-1"
                     then Nothing
                     else Just (x, y)


getCustomAudience :: Text -> Maybe (Text, Text)
getCustomAudience x =
    case x of
        "segmento-2" ->
            Just ("6068523723872","Lookalike (CL 3%) - Segmento-2")

        "segmento-3" ->
            Just ("6068275952072","Lookalike (CL 3%) - Segmento-3")

        "segmento-4" ->
            Just ("6068512823872","Lookalike (CL 3%) - Segmento-4")

        "segmento-6" ->   
            Just ("6068275953472","Lookalike (CL 3%) - Segmento-6")

        "segmento-8" ->    
            Just ("6068275961672","Lookalike (CL 3%) - Segmento-8")
        
        "segmento-9" ->
            Just ("6068275979272","Lookalike (CL 3%) - Segmento-9")
        
        "segmento-10" ->
            Just ("6068529963872","Lookalike (CL 3%) - Segmento-10")

        "segmento-12" ->
            Just ("6068275977672","Lookalike (CL 3%) - Segmento-12")

        "segmento-14" ->
            Just ("6070976731872","Lookalike (CL 3%) - Segmento-14")

        "segmento-15" ->
            Just ("6068275980272","Lookalike (CL 3%) - Segmento-15")

        "segmento-16" ->
            Just ("6068275985672","Lookalike (CL 3%) - Segmento-16")

        "segmento-17" ->
            Just ("6070976994072","Lookalike (CL 3%) - Segmento-17")

        "segmento-18" ->
            Just ("6068534796672","Lookalike (CL 3%) - Segmento-18")

        "segmento-21" ->
            Just ("6068275988072","Lookalike (CL 3%) - Segmento-21")

        "segmento-23" ->
            Just ("6068451444272","Lookalike (CL 3%) - Segmento-23")


        "segmento-24" ->
            Just ("6068311151472","Lookalike (CL 3%) - Segmento-24")

        
        "segmento-25" ->
            Just ("6068311180472","Lookalike (CL 3%) - Segmento-25") 
            
  
        "segmento-26" ->
            Just ("6068311206472","Lookalike (CL 3%) - Segmento-26")          

        _ ->
            Nothing