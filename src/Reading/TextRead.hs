module Reading.TextRead (main) where

import Lib.Prelude 
 
import System.IO
import Data.Char(toUpper)

main :: IO ()
main = do 
       inh <- openFile "/Users/alfonsobustamante/inputHaskell.txt" ReadMode
       outh <- openFile "/Users/alfonsobustamante/outputHaskell.txt" WriteMode
       mainloop inh outh
       hClose inh
       hClose outh

mainloop :: Handle -> Handle -> IO ()
mainloop inh outh = 
    do ineof <- hIsEOF inh
       if ineof
           then return ()
           else do inpStr <- hGetLine inh
                   hPutStrLn outh (map toUpper inpStr)
                   mainloop inh outh