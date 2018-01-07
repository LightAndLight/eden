module Eden.LambdaCalculus.Expr.Printer where

import Eden.LambdaCalculus.Expr

renderExpr :: Expr -> String
renderExpr (Variable s) = s
renderExpr (Abstraction a b) = "\\" ++ a ++ ". " ++ renderExpr b
renderExpr (Application a b) = nested a ++ " " ++ nested b
  where
    nested a@Abstraction{} = "(" ++ renderExpr a ++ ")"
    nested a = renderExpr a
