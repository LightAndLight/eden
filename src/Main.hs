module Main where

import qualified JavaScript.MyProgram as JavaScript
import qualified Python.MyProgram as Python

main = do
  putStrLn "Javascript:"
  JavaScript.myProgram
  putStrLn "\nPython:"
  Python.myProgram
