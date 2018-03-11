module Parallels.ControlParallel (main, main1) where

import Lib.Prelude    

import Control.Parallel
import Data.List as L

-- parallel folding

pfold :: (Num a, Enum a) => (a -> a -> a) -> [a] -> a
pfold _ [x] = x
pfold mappend xs  = (ys `par` zs) `pseq` (ys `mappend` zs) where
  len = length xs
  (ys', zs') = splitAt (len `div` 2) xs
  ys = pfold mappend ys'
  zs = pfold mappend zs'

main :: IO ()
main = print $ pfold (+) [ foldl' (*) 1 [1..x] | x <- [1..5000] ]

-------------------------------------------------------------------

--pqsort [] = []
--pqsort [x] = [x]
--pqsort (x:xs) = lt `par` gt `pseq` lt ++ (x:gt)
--     where 
--        lt = pqsort [y | y <- xs, y < x]
--        gt = pqsort [y | y <- xs, y >= x]
        
--main2 = do
--    print $ head sorted -- will be 1
--    print $ last sorted -- will be 10000
--      where nums = [1..5000] ++ reverse [5000..10000]
--            sorted = pqsort nums

-------------------------------------------------------------------
main1 :: IO ()
main1 = a `par` b `par` c `pseq` print (a, b, c, a+b+c)
   where
       a = ack 3 10
       b = fac 42
       c = fib 34

fac 0 = 1
fac n = n * fac (n-1)

ack 0 n = n+1
ack m 0 = ack (m-1) 1
ack m n = ack (m-1) (ack m (n-1))

fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
---------------------------------------------------------------

--main2 :: IO ()
--main2 = print (2*a+b)
--   where
--       a = 2
--       b = 3

 