module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import MiniDOM


main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  clog "Hello Space sailor"
  getElementById "app" >>= clog
  getElementById "non-existent" >>= clog
