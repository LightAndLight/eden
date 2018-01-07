module MyProgram where

import Prelude hiding (id, const)
import Control.Lens

import Eden.Core.Expr.Printer
import Eden.LambdaCalculus.Prisms
import Eden.LambdaCalculus.Expr
import Eden.LambdaCalculus.Prelude


myProgram = do
  putStrLn . renderExpr $ _LCTerm # id
  putStrLn . renderExpr $ _LCTerm # const
  putStrLn . renderExpr $ _LCTerm # Application id const
