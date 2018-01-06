module Eden.Core.Identifier where

import Control.Lens

data Identifier = Identifier String
  deriving Eq

_Identifier :: Prism' String Identifier
_Identifier =
  prism'
    (\(Identifier s) -> s)
    (\s -> if s `elem` reserved then Nothing else Just $ Identifier s)
  where
    reserved =
      [ "break"
      , "case"
      , "catch"
      , "class"
      , "const"
      , "continue"
      , "debugger"
      , "default"
      , "delete"
      , "do"
      , "else"
      , "export"
      , "extends"
      , "finally"
      , "for"
      , "function"
      , "if"
      , "import"
      , "in"
      , "instanceof"
      , "new"
      , "return"
      , "super"
      , "switch"
      , "this"
      , "throw"
      , "try"
      , "typeof"
      , "var"
      , "void"
      , "while"
      , "with"
      , "yield"
      ]
