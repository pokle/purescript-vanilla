module Examples.Log where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import Vanilla.DOM (DOM, clog)

main :: ∀ eff. Eff ( dom :: DOM | eff ) Unit
main = do
  clog "Hello there, this is a log message."

