{-
Welcome to your custom Prelude
Export here everything that should always be in your library scope
For more info on what is exported by Protolude check:
https://github.com/sdiehl/protolude/blob/master/Symbols.md
-}
--module Lib.Prelude
--    ( module Exports
--    ) where

--import Protolude as Exports

{-# LANGUAGE RankNTypes #-}
module Lib.Prelude
    ( module Exports
    , andThen
    , Task
    , RTask
    , set
    , view
    , (^.)
    , to
   -- , read
   -- , forall
    , makeLenses
    , String
    , mapView
    ) where

import Protolude as Exports hiding (to)
import Flow as Exports
import Control.Lens (set, view, (^.), to, makeLenses, Lens')
import Prelude (String)

--import Text.Read (Read)

type RTask env e a = ReaderT env (ExceptT e IO) a

type Task e a = ExceptT e IO a

andThen :: Monad m => (a -> m b) -> m a -> m b
andThen f x = x >>= f

mapView :: Functor f => Lens' a b -> f a -> f b
mapView l f = view l <$> f

