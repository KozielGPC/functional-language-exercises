import System.Random

-- Função que cria uma lista de tamanho n com valores aleatórios entre 1 e 100
criarListaAleatoria :: Int -> [Int]
criarListaAleatoria n = take n $ randomRs (1, 100) $ mkStdGen 42

-- Função que verifica a interseção de duas listas
intersecaoListas :: Eq a => [a] -> [a] -> [a]
intersecaoListas [] _ = []
intersecaoListas (x:xs) ys
  | x `elem` ys = x : intersecaoListas xs ys
  | otherwise   = intersecaoListas xs ys

main :: IO ()
main = do
  putStrLn "Tamanho da lista 1: "
  tamanhoLista1 <- readLn
  let lista1 = criarListaAleatoria tamanhoLista1
  putStrLn $ "Lista 1: " ++ show lista1

  putStrLn "Tamanho da lista 2: "
  tamanhoLista2 <- readLn
  let lista2 = criarListaAleatoria tamanhoLista2
  putStrLn $ "Lista 2: " ++ show lista2

  let intersecao = intersecaoListas lista1 lista2
  putStrLn $ "Interseção das listas 1 e 2: " ++ show intersecao
