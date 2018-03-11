{-# LANGUAGE ExistentialQuantification #-}

module Parallels.ControlStrategies where

import Lib.Prelude
import Control.Parallel.Strategies

--fib :: Int -> Int
--fib x 
-- | x <= 1    = 1
-- | otherwise = fib (x-1) + fib (x-2)

--main = do
--  let fs = (map fib [1..40]) `using` parListSplitAt 38 rdeepseq rdeepseq
--  in print fs

--fib :: Int -> Int
--fib n
--  | n <= 1 = 1
--  | otherwise = let
--                   x = fib (n-1)
--                   y = fib (n-2)
--                in
--                   x ‘par‘ (y ‘pseq‘ x + y + 1)