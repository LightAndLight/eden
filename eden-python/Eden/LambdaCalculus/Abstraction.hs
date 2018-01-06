{-# language LambdaCase #-}
module Eden.LambdaCalculus.Abstraction where

import Control.Lens

import Eden.Core.Expr
import Eden.Core.Identifier

_Abstraction :: Prism' Expr (Identifier, Expr)
_Abstraction =
  prism'
    (\(Identifier n, body) -> PyLambda [n] body)
    (\case
        PyLambda [n] body -> Just (Identifier n, body)
        _ -> Nothing)
