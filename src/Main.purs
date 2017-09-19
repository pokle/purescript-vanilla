module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)



foreign import clog :: forall eff . Cloggable -> Eff (console :: CONSOLE | eff) Unit

foreign import data DOMElement :: Type

data Cloggable = CloggableString String | CloggableDOMElement DOMElement

foreign import getElementById :: forall eff . String -> Eff (eff) DOMElement

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  clog (CloggableString "Hello Space sailor")
  elem <- getElementById "app"
  clog (CloggableDOMElement elem)
