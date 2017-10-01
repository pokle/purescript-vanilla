module Vanilla.String where
-- Helps you take your Vanilla to a HTML string (for the server side)

import Data.Array (fold)
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Prelude (map, show, (<>))
import Vanilla (ElementConstruction(..), Mod(..))

escapeAttrVal :: String -> String -> String
escapeAttrVal quote value = replaceAll (Pattern quote) (Replacement ("\\" <> quote)) value

--| Eg.
--| > import Vanilla.Example
--| > import Vanilla.String
--| > render addExample
--| "Vanilla.EnsureElemExists (Vanilla.ElemByTagId \"li\" \"1\")"
render :: Array Mod -> String
render mods = fold (map show mods)

renderMod :: Mod -> String
renderMod (EnsureElemExists (ElemByTagId tag id)) = "<<" <> show (EnsureElemExists (ElemByTagId tag id)) <> ">>"
renderMod (EnsureElemDoesNotExist eq) = "<<" <> show (EnsureElemDoesNotExist eq) <> ">>"

