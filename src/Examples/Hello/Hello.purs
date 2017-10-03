module Examples.Hello where

import Prelude (Unit, discard, (>>=))
import Control.Monad.Eff (Eff)
import Data.Maybe (Maybe(..))
import Vanilla.DOM (DOM, DOMElement, clog, getElementById, setInnerHTML)

walk :: ∀ eff. Maybe DOMElement -> Eff ( dom :: DOM | eff ) Unit
walk (Just d) = setInnerHTML "Walk the path sailor!" d
walk Nothing = clog "Sorry!!! Nothing here"


main :: ∀ eff. Eff ( dom :: DOM | eff ) Unit
main = do
  clog "Hello Space sailor"
  getElementById "target-div" >>= clog
  getElementById "non-existent" >>= clog
  getElementById "target-div" >>= walk