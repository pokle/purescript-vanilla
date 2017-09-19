module MiniDOM where
  
import Prelude (Unit)
import Control.Monad.Eff (Eff)
-- import Control.Monad.Eff.Console (CONSOLE)

foreign import data DOMElement :: Type
foreign import clog :: forall eff t . t -> Eff (t :: DOMElement | eff) Unit
foreign import getElementById :: forall eff . String -> Eff (eff) DOMElement
