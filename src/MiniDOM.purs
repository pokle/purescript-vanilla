module MiniDOM where
  
import Prelude (Unit)
import Control.Monad.Eff (Eff, kind Effect)

foreign import data DOMElement :: Type
foreign import data DOM :: Effect
foreign import clog :: forall eff t . t -> Eff (dom :: DOM | eff) Unit
foreign import getElementById :: forall eff . String -> Eff (eff) DOMElement
