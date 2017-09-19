module Main where

import Prelude (Unit, unit, discard, (>>=))
import Control.Monad.Eff (Eff)
import Data.Functor
import Control.Bind
import Data.Maybe
import MiniDOM

walk :: ∀ eff. DOMElement -> Eff ( dom :: DOM | eff ) Unit
walk d = setInnerHTML "Walk the path" d


main :: ∀ eff. Eff ( dom :: DOM | eff ) Unit
main = do
  clog "Hello Space sailor"
  getElementById "app" >>= clog
  getElementById "non-existent" >>= clog
  app <- getElementById "app"
  case app of
    Just d -> walk d
    Nothing -> clog "Sowwy"
  

