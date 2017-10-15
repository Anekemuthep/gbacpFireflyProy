module Algorithms.Gbacp (splitByTwoDots, getCustomAudience) where
    
import Lib.Prelude
    
import qualified Data.Char as Charq
import qualified Data.Text as T


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