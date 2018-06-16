{-# LANGUAGE OverloadedStrings #-}
module Main where

--import Protolude
import Lib.Prelude

import Web.Spock
import Web.Spock.Config
import qualified Data.Text as Text

main :: IO ()
main = do
  spockCfg <- defaultSpockCfg () PCNoDatabase ()
  runSpock 8080 $ spock spockCfg $ do

    get root $
      text "Hello Spock!"

    get ("hello" <//> var) $ \name ->
      text (Text.concat ["Hello ", name, "!"])

-- module Main where

--import Protolude
--import Lib


--main :: IO ()
--main = someFunc
