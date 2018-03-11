module Reading.MatrixRead (main) where

--import qualified Data.Text as T
--import Data.List.Split
--import qualified Data.Map as M
--import System.IO
import Lib.Prelude

--import Control.Applicative
--import Data.Text.Read
--import Control.Monad

mmult :: (Num a) => [[a]] -> [[a]] -> [[a]] 
mmult a b = [[ sum $ zipWith (*) ar bc | bc <- (transpose b)] | ar <- a ]

matrix1 :: (Num a) => [[a]]
matrix1 = [[1,2,3], [4,5,6]]

matrix2 :: (Num a) => [[a]]
matrix2 = [[4,5,6,6], [3,4,5,6]]
--read :: Read a => String -> a

matrix3 :: (Num a) => [[a]]
matrix3 = [[5,5,2,2],[1,1,3,3]]

main :: IO ()
main = print $ mmult (mmult matrix1 matrix2) matrix3 -- "FF": 15 + 15 = 30

--main :: IO ()
--main = do
--    a <- getLine
--    b <- getLine
--    print (a ++ b)

--digsum :: (Integral a) => a -> a -> a
--digsum base = f 0
--  where
--    f a 0 = a
--    f a n = f (a + r) q
--      where
--        (q, r) = n `quotRem` base

--main :: IO ()
--main = print $ digsum 16 255 -- "FF": 15 + 15 = 30

--readAInt :: IO Int
--readAInt = readLn

--main = do
--    z <- getLine
--    print z
