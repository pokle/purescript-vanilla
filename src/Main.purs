module Main where

import Prelude (Unit, discard, (>>=))
import Control.Monad.Eff (Eff)
import MiniDOM


main :: forall eff. Eff ( dom :: DOM | eff ) Unit
main = do
  clog "Hello Space sailor"
  getElementById "app" >>= clog
  getElementById "non-existent" >>= clog
