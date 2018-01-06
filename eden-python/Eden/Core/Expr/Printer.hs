module Eden.Core.Expr.Printer where

import Data.List

import Eden.Core.Expr

renderExpr :: Expr -> String
renderExpr (PyIdent s) = s
renderExpr (PyFunCall l rs) =
  "(" ++ renderExpr l ++ ")(" ++ intercalate ", " (fmap renderExpr rs) ++ ")"
renderExpr (PyLambda args body) =
  "lambda " ++ intercalate ", " args ++ ": " ++ renderExpr body
