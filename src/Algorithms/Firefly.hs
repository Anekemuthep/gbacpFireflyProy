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
    let dist = x1 - x2
    in  exp(-1*dist)

mov :: Float -> Float -> Float -> Float -> Float
mov x1 x2 alpha aleat = (intensity x1 x2)*(x1-x2) + x1 + alpha*(aleat-0.5)

-- | The sigmoid function:  1 / (1 + exp (-x))
sigmoid :: Floating a => a -> a
sigmoid x = 1 / (1 + exp (-x))
{-# INLINE sigmoid #-}

-- | Derivative of the sigmoid function: sigmoid x * (1 - sigmoid x)
--sigmoid' :: Floating a => a -> a
--sigmoid' !x = case sigmoid x of
--  s -> s * (1 - s)