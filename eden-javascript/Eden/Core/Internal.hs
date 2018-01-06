module Eden.Core.Internal where

import Data.List

data Statement
  = JsExpr Expr
  | JsReturn Expr

data Expr
  = JsIdent String
  | JsFunCall Expr [Expr]
  | JsAnonymous [String] [Statement]

renderStatement :: Statement -> String
renderStatement (JsExpr e) = renderExpr e ++ ";"
renderStatement (JsReturn e) = "return " ++ renderExpr e ++ ";"

renderExpr :: Expr -> String
renderExpr (JsIdent i) = i
renderExpr (JsFunCall a b) =
  "(" ++ renderExpr a ++ ")(" ++ intercalate (", ") (fmap renderExpr b) ++ ")"
renderExpr (JsAnonymous args body) =
  "function (" ++ intercalate ", " args ++ ") {" ++
  (case body of
     [a] -> " " ++ renderStatement a ++ " "
     _ -> "\n" ++ unlines (fmap renderStatement body)) ++
  "}"
