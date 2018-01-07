{-# language LambdaCase #-}
module Eden.LambdaCalculus.Prisms.Impl where

import Control.Applicative
import Control.Lens
  
import Eden.Core.Expr
import qualified Eden.LambdaCalculus.Expr as LC

_LCTerm :: Prism' Expr LC.Expr
_LCTerm =
  prism'
    (\case
        LC.Application a b -> _Application # (a, b)
        LC.Abstraction a b -> _Abstraction # (a, b)
        LC.Variable a -> _Variable # a)
    (\a ->
       uncurry LC.Abstraction <$> (a ^? _Abstraction) <|>
       uncurry LC.Application <$> (a ^? _Application) <|>
       LC.Variable <$> (a ^? _Variable) <|>
       Nothing)

_Abstraction :: Prism' Expr (String, LC.Expr)
_Abstraction =
  prism'
    (\(n, body) -> PyLambda [n] $ _LCTerm # body)
    (\case
        PyLambda [n] body -> (,) n <$> (body ^? _LCTerm)
        _ -> Nothing)

_Application :: Prism' Expr (LC.Expr, LC.Expr)
_Application =
  prism'
    (\(a, b) -> PyFunCall (_LCTerm # a) [_LCTerm # b])
    (\case
        PyFunCall a [b] -> (,) <$> (a ^? _LCTerm) <*> (b ^? _LCTerm)
        _ -> Nothing)

_Variable :: Prism' Expr String
_Variable =
  prism'
    (\s -> PyIdent s)
    (\case
        PyIdent s -> Just s
        _ -> Nothing)
