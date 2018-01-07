module Eden.LambdaCalculus.Expr where

data Expr
  = Variable String
  | Abstraction String Expr
  | Application Expr Expr
