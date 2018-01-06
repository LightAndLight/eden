module Eden.Core.Expr where

data Expr
  = PyIdent String
  | PyFunCall Expr [Expr]
  | PyLambda [String] Expr
