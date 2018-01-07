module Eden.LambdaCalculus.Prelude where

import Prelude hiding (id, const)
import Control.Lens

import Eden.LambdaCalculus.Expr

id :: Expr
id = Abstraction "x" $ Variable "x"

const :: Expr
const = Abstraction "x" $ Abstraction "y" $ Variable "x"
