-- HTML utilities
module Vanilla.HTML where

import Data.String (Pattern(..), Replacement(..), replaceAll)
import Prelude ((<>)) 

escapeAttrVal :: String -> String -> String
escapeAttrVal quote value = replaceAll (Pattern quote) (Replacement ("\\" <> quote)) value