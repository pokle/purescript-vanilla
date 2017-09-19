module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)


-- foreign import clog :: String -> Eff (console :: CONSOLE | e)

-- | Write a message to the console.
foreign import clog
  :: forall eff
   . String
  -> Eff (console :: CONSOLE | eff) Unit

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  clog "Hello Space sailor"
