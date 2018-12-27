-- Haskell

{-
  This is Hello World
  written in Haskell.
-}

hello 0 = return ()
hello n = do
  putStrLn "Hello, World!" -- Greetings.
  hello (n-1)

main = do
  hello 10
