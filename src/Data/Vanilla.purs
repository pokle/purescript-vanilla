module Data.Vanilla where
import Prelude (class Show)
import Data.Generic (class Generic, gShow)

type ElementId      = String
type ElementTagName = String -- Eg. "div", "li"
type ElementClass   = String

data ElementQuery = ElemById ElementId
                  | ElemByClass ElementClass

data ElementConstruction = ElemByTagId ElementTagName ElementId
    -- What about the parent element?
    -- Or children?
    -- How do you move an element? (how do you re-parent it?)

data Mod = EnsureElemExists ElementConstruction
         | EnsureElemDoesNotExist ElementQuery


-- Noise --
-- Show me what you got 
derive instance genericElementQuery :: Generic ElementQuery
instance showElementQuery :: Show ElementQuery where
    show = gShow

derive instance genericElementConstruction :: Generic ElementConstruction
instance showElementConstruction :: Show ElementConstruction where
    show = gShow

derive instance genericMod :: Generic Mod
instance showMod :: Show Mod where
    show = gShow


