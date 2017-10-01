module Vanilla.Example (addExample) where

import Vanilla
import Data.Array (concat, difference)
import Data.Functor (map)
-- import Data.Eq (Eq)

type Todo = { id :: String, text :: String }

-- instance eqTodo :: Eq Todo where
--   eq a b = 

ids ts = map (\t -> t.id) ts


ensureTodoItems :: Array Todo -> Array Todo -> Array Mod
ensureTodoItems newItems oldItems =
    concat
        [ map ensureTodoItem newItems
        , map EnsureElemDoesNotExist (map ElemById ((ids oldItems) `difference` (ids newItems)))
        ]

ensureTodoItem todoItem =
    EnsureElemExists (ElemByTagId "li" todoItem.id)


addExample :: Array Mod
addExample = ensureTodoItems [{id:"1",text:"H"}] []