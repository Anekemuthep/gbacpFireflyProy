module Algorithms.Firefly (sumSet, restNum) where
    
import Lib.Prelude
    
import qualified Data.Char as Charq
import qualified Data.Text as T

sumSet :: Int -> Int
sumSet x = x + 1

restNum :: [Char] -> [Char]
restNum xs = xs ++ xs