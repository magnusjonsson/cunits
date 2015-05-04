module App.SymTab where

import App.Type as Type
import Data.Map as Map

data SymTab = SymTab {
      variables :: Map String Type
    } deriving Show

empty :: SymTab
empty = SymTab { variables = Map.empty }

lookupVariable :: String -> SymTab -> Maybe Type
lookupVariable name symtab =
    Map.lookup name (variables symtab)

bindVariable :: String -> Type -> SymTab -> SymTab
bindVariable name ty st =
    SymTab { variables = Map.insert name ty (variables st) }
