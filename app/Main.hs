{-# LANGUAGE OverloadedStrings #-}
module Main where

--import Protolude
--import Lib
    
import System.Environment
import Web.Spock.Safe

main :: IO ()
main = do
    env <- getEnvironment
    let port = maybe 8080 read $ lookup "PORT" env
    runSpock port $ spockT id $
      get "/" $ text "Hello, world!"

-- module Main where

--import Protolude
--import Lib


--main :: IO ()
--main = someFunc
