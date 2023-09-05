module MooMoo where

-- f(x1,x2) = ln(x1) + x1*x2 - sin(x2)

type Scalar = Double

add :: Scalar -> Scalar -> Scalar
add = (+)

mult :: Scalar -> Scalar -> Scalar
mult = (*)

ln :: Scalar -> Scalar
ln = log

sin :: Scalar -> Scalar
sin = Prelude.sin

newtype Unary = Unary (Scalar -> Scalar)

newtype Binary = Binary (Scalar -> Scalar -> Scalar)

data Vertex = Empty | Vertex Scalar [Vertex]
  deriving (Show)

-- instance Functor ComputeGraph where
--   fmap :: (a -> b) -> ComputeGraph a -> ComputeGraph b
--   fmap f Empty = Empty
--   fmap f (Vertex x) = Vertex $ f x
