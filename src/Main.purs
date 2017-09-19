module Main where

import Prelude (Unit, unit, discard, (>>=))
import Control.Monad.Eff (Eff)
import Data.Functor
import Control.Bind
import Data.Maybe
import MiniDOM

walk :: ∀ eff. Maybe DOMElement -> Eff ( dom :: DOM | eff ) Unit
walk (Just d) = setInnerHTML "Walk the path" d
walk Nothing = clog "Sorry!!!"


main :: ∀ eff. Eff ( dom :: DOM | eff ) Unit
main = do
  clog "Hello Space sailor"
  getElementById "app" >>= clog
  getElementById "non-existent" >>= clog
  getElementById "app" >>= walk
  
  

