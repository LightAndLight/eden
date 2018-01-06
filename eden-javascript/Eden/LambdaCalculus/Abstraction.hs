{-# language LambdaCase #-}
module Eden.LambdaCalculus.Abstraction where

import Control.Lens

import Eden.Core.Expr
import Eden.Core.Statement
import Eden.Core.Identifier

_Abstraction :: Prism' Expr (Identifier, Expr)
_Abstraction =
  prism'
    (\(Identifier n, body) -> JsAnonymous [n] [JsReturn body])
    (\case
        JsAnonymous [n] [JsReturn e] -> Just (Identifier n, e)
        _ -> Nothing)
