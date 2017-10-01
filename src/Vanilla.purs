-- The data structures that make up your Vanilla app

module Vanilla where
import Prelude (class Show)
import Data.Generic (class Generic, gShow)

-- Basic types to name parameters
type ElementId      = String
type ElementTagName = String -- Eg. "div", "li"
type ElementClass   = String

-- Modifications (effects) of the DOM are represented by a Mod 
-- ⎝reverse of DOM⎠
data Mod = EnsureElemExists ElementConstruction
         | EnsureElemDoesNotExist ElementQuery

data ElementConstruction = ElemByTagId ElementTagName ElementId
    -- What about the parent element?
    -- Or children?
    -- How do you move an element? (how do you re-parent it?)

-- When querying for an Element, you can do so by id or class
data ElementQuery = ElemById ElementId
                  | ElemByClass ElementClass

-- Render to a String
class RenderString m where
    render :: m -> String

-- instance  renderStringEnsureElemExists :: RenderString Mod where
--     render  EnsureElemExists (ElemByTagId tag id) = "<"  <> tag <> " id='" <> (escapeAttrVal "'" id) <> "'>"

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


