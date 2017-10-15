module Algorithms.Firefly (sumSet, restNum, intensity) where
    
import Lib.Prelude
    
import qualified Data.Char as Charq
import qualified Data.Text as T

sumSet :: Int -> Int
sumSet x = x + 1

restNum :: [Char] -> [Char]
restNum xs = xs ++ xs

intensity :: Float -> Float -> Float
intensity x1 x2 =
    let e = exp 1
        dist = x1 - x2
    in 1.2 * (e ** (0.2 * dist))