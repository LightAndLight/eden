{-# language LambdaCase #-}
module Eden.LambdaCalculus.Variable where

import Control.Lens

import Eden.Core.Expr
import Eden.Core.Identifier

_Variable :: Prism' Expr Identifier
_Variable =
  prism'
    (\(Identifier s) -> PyIdent s)
    (\case
        PyIdent s -> Just (Identifier s)
        _ -> Nothing)
