module Vanilla.DOM where
  
import Prelude (Unit)
import Data.Maybe
import Control.Monad.Eff (Eff, kind Effect)

foreign import data DOMElement :: Type
foreign import data DOM :: Effect

type ElementId = String
foreign import clog :: forall eff t . t -> Eff (dom :: DOM | eff) Unit
foreign import getElementById :: ∀ eff. ElementId -> Eff (dom :: DOM | eff) (Maybe DOMElement)
foreign import setInnerHTML :: ∀ eff. ElementId -> DOMElement -> Eff (dom :: DOM | eff) Unit