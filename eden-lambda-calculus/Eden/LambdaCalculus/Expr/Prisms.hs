{-# language LambdaCase #-}
module Eden.LambdaCalculus.Expr.Prisms where

import Control.Lens

import Eden.Core.Expr
import qualified Eden.LambdaCalculus.Expr as LC

import Unsafe.Coerce

_LCTerm :: Prism' Expr LC.Expr
_LCTerm = unsafeCoerce id

_Abstraction :: Prism' Expr (String, LC.Expr)
_Abstraction =
  prism'
    (\(n, body) -> Abstraction n (unsafeCoerce body))
    (\case
        Abstraction n body -> Just (n, unsafeCoerce body)
        _ -> Nothing)

_Application :: Prism' Expr (LC.Expr, LC.Expr)
_Application =
  prism'
    (\(a, b) -> Application (unsafeCoerce a) (unsafeCoerce b))
    (\case
        Application a b -> Just (unsafeCoerce a, unsafeCoerce b)
        _ -> Nothing)

_Variable :: Prism' Expr String
_Variable =
  prism'
    (\s -> Variable s)
    (\case
        Variable s -> Just s
        _ -> Nothing)
