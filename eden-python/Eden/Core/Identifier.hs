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
      [ "False"
      , "class"
      , "final"
      , "is"
      , "return"
      , "None"
      , "continue"
      , "for"
      , "lambda"
      , "try"
      , "True"
      , "def"
      , "from"
      , "nonlocal"
      , "while"
      , "and"
      , "del"
      , "global"
      , "not"
      , "with"
      , "as"
      , "elif"
      , "if"
      , "or"
      , "yield"
      , "assert"
      , "else"
      , "import"
      , "pass"
      , "break"
      , "except"
      , "in"
      , "raise"
      ]
