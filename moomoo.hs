module MooMoo where

-- f(x1,x2) = ln(x1) + x1*x2 - sin(x2)

type Scalar = Double

f :: Scalar -> Scalar -> Scalar
f x y = log x + (x * y) - sin y

log' :: Scalar -> Scalar
log' x = 1 / x

mult' :: Scalar -> Scalar -> Scalar
mult' x y = x

f' :: Scalar -> Scalar -> Scalar
f' x y = 1 / x + y

newtype Unary = Unary (Scalar -> Scalar)

newtype Binary = Binary (Scalar -> Scalar -> Scalar)

data Vertex = Empty | Vertex Scalar [Vertex]
  deriving (Show)

-- instance Functor ComputeGraph where
--   fmap :: (a -> b) -> ComputeGraph a -> ComputeGraph b
--   fmap f Empty = Empty
--   fmap f (Vertex x) = Vertex $ f x
