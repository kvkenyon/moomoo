module Tensor
  ( zeros,
    prettyPrint,
    (@@),
  )
where

type Shape = [Int]

type Scalar = Double

data Tensor a = Nil | Val a | T [Tensor a] (Tensor a)
  deriving (Show)

infixr 5 @@

(@@) :: [Tensor a] -> Tensor a -> Tensor a
(@@) = T

(<<) :: [Tensor a] -> [Tensor a]
(<<) a = a

row :: Int -> Scalar -> Tensor Scalar
row 0 _ = Nil
row w val = replicate w (Val val) @@ Nil

zeros :: Shape -> Tensor Scalar
zeros [] = Nil
zeros [w] = row w 0
zeros [h, w] = replicate h (row w 0) @@ Nil
zeros (x : xs) = replicate x (zeros xs) @@ Nil

pretty :: Tensor Scalar -> String
pretty Nil = ""
pretty (Val x) = show x ++ " "
pretty (T vec rest) = concatMap pretty vec ++ "\n" ++ pretty rest

prettyPrint :: Tensor Scalar -> String
prettyPrint t = init . init $ pretty t