module Tensor
  ( zeros,
    prettyPrint,
  )
where

type Shape = [Int]

type Scalar = Double

data Tensor a = Nil | Val a | T [Tensor a] (Tensor a)
  deriving (Show)

zeros :: Shape -> Tensor Scalar
zeros [] = Nil
zeros [w] = T (replicate w $ Val 0) Nil
zeros [h, w] = T (replicate h (T (replicate w (Val 0)) Nil)) Nil
zeros (x : xs) = T (replicate x (zeros xs)) Nil

pretty :: Tensor Scalar -> String
pretty Nil = ""
pretty (Val x) = show x ++ " "
pretty (T vec rest) = concatMap pretty vec ++ "\n" ++ pretty rest

prettyPrint :: Tensor Scalar -> String
prettyPrint t = init . init $ pretty t