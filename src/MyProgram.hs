module MyProgram where

import Prelude hiding (id, const)
import Control.Lens

import Eden.Core.Expr.Printer
import Eden.LambdaCalculus
import Eden.LambdaCalculus.Prelude

myProgram = do
  putStrLn $ renderExpr id
  putStrLn $ renderExpr const
  putStrLn . renderExpr $ _Application # (id, const)
