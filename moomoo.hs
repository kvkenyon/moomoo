module MooMoo where

import Tensor (prettyPrint, zeros)

-- Build a computational graph for
-- a multivariable function of scalars
-- f(x1, y1) = ln(x1) + x1*x2 - sin(x2)

type Scalar = Double

data Expr
  = Val Scalar
  | Add Expr Expr
  | Mult Expr Expr
  | Log Expr
  | Sin Expr
  | Subt Expr Expr
  deriving (Show)

value :: Expr -> Scalar
value (Val x) = x
value (Add x y) = value x + value y
value (Mult x y) = value x * value y
value (Log x) = log $ value x
value (Sin x) = sin $ value x
value (Subt x y) = value x - value y

data Op
  = EVAL Expr
  | ADD Scalar
  | MULT Scalar
  | LOG
  | SIN
  deriving (Show)