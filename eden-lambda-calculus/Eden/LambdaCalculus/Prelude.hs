module Eden.LambdaCalculus.Prelude where

import Prelude ()
import Control.Lens

import Eden.LambdaCalculus

id :: Expr
id =
  let
    x = "x" ^?! _Identifier
  in
    _Abstraction # (x, _Variable # x)

const :: Expr
const =
  let
    x = "x" ^?! _Identifier
    y = "y" ^?! _Identifier
  in
    _Abstraction # (x, _Abstraction # (y, _Variable # x))
