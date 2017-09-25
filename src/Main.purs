module Main where

import Prelude (Unit, discard, (>>=))
import Control.Monad.Eff (Eff)
import Data.Maybe (Maybe(..))
import Vanilla.DOM (DOM, DOMElement, clog, getElementById, setInnerHTML)

walk :: ∀ eff. Maybe DOMElement -> Eff ( dom :: DOM | eff ) Unit
walk (Just d) = setInnerHTML "Walk the path" d
walk Nothing = clog "Sorry!!!"


main :: ∀ eff. Eff ( dom :: DOM | eff ) Unit
main = do
  clog "Hello Space sailor"
  getElementById "app" >>= clog
  getElementById "non-existent" >>= clog
  getElementById "app" >>= walk