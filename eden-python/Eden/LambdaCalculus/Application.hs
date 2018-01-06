{-# language LambdaCase #-}
module Eden.LambdaCalculus.Application where

import Control.Lens

import Eden.Core.Expr
import Eden.Core.Identifier

_Application :: Prism' Expr (Expr, Expr)
_Application =
  prism'
    (\(a, b) -> PyFunCall a [b])
    (\case
        PyFunCall a [b] -> Just (a, b)
        _ -> Nothing)
