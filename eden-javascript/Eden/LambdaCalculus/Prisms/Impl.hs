{-# language LambdaCase #-}
module Eden.LambdaCalculus.Prisms.Impl where

import Control.Applicative
import Control.Lens

import Eden.Core.Expr
import Eden.Core.Statement
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
    (\(n, body) -> JsAnonymous [n] [JsReturn $ _LCTerm # body])
    (\case
        JsAnonymous [n] [JsReturn e] -> (,) n <$> (e ^? _LCTerm)
        _ -> Nothing)

_Application :: Prism' Expr (LC.Expr, LC.Expr)
_Application =
  prism'
    (\(a, b) -> JsFunCall (_LCTerm # a) [_LCTerm # b])
    (\case
        JsFunCall a [b] -> (,) <$> (a ^? _LCTerm) <*> (b ^? _LCTerm)
        _ -> Nothing)

_Variable :: Prism' Expr String
_Variable =
  prism'
    (\s -> JsIdent s)
    (\case
        JsIdent s -> Just s
        _ -> Nothing)
