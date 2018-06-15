{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Protolude as PL
import Lib
    
import Web.Spock
import Web.Spock.Config

import Control.Monad.Trans
import Data.Monoid
import Data.IORef
import qualified Data.Text as T

data MySession = EmptySession
data MyAppState = DummyAppState (IORef PL.Int)

main :: PL.IO ()
main =
    do ref <- newIORef 0
       spockCfg <- defaultSpockCfg EmptySession PCNoDatabase (DummyAppState ref)
       runSpock 8080 (spock spockCfg app)

app :: SpockM () MySession MyAppState ()
app =
    do get root PL.$
           text "Hello World!"
       get ("hello" <//> var) PL.$ \name ->
           do (DummyAppState ref) <- getState
              visitorNumber <- liftIO PL.$ atomicModifyIORef' ref PL.$ \i -> (i+1, i+1)
              text ("Hello " <> name <> ", you are visitor number " <> T.pack (show visitorNumber))

-- module Main where

--import Protolude
--import Lib


--main :: IO ()
--main = someFunc
