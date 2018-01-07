module Main where

import Control.Lens
import Data.Maybe

import qualified JavaScript.MyProgram as JavaScript
import qualified Python.MyProgram as Python

import qualified JavaScript.Expr as JavaScript
import qualified JavaScript.Expr.Printer as JavaScript
import qualified JavaScript.Statement as JavaScript
import qualified JavaScript.Optics as JavaScript

import qualified Python.Expr as Python
import qualified Python.Expr.Printer as Python
import qualified Python.Optics as Python

jsToPy :: JavaScript.Expr -> Maybe Python.Expr
jsToPy = fmap (review Python._LCTerm) . preview JavaScript._LCTerm

pyToJs :: Python.Expr -> Maybe JavaScript.Expr
pyToJs = fmap (review JavaScript._LCTerm) . preview Python._LCTerm

-- The following two functions could have been written once and instantiated
-- to both python and javascript. see 'MyProgram'
someJavaScript :: JavaScript.Expr
someJavaScript =
  JavaScript.JsAnonymous
    ["x"]
    [JavaScript.JsReturn (JavaScript.JsIdent "x")]

somePython :: Python.Expr
somePython =
  Python.PyLambda
    ["x"]
    (Python.PyLambda
      ["y"]
      (Python.PyIdent "x"))

main = do
  putStrLn "My program..."
  putStrLn "\n...As Javascript:"
  JavaScript.myProgram
  putStrLn "\n...As Python:"
  Python.myProgram

  putStrLn "\nPython translated from JavaScript via lambda calculus"
  putStrLn . fromMaybe "failed" $ Python.renderExpr <$> jsToPy someJavaScript

  putStrLn "\nJavaScript translated from Python via lambda calculus"
  putStrLn . fromMaybe "failed" $ JavaScript.renderExpr <$> pyToJs somePython
