import System.Random

-- Função que cria uma lista de tamanho n
criarLista :: Int -> IO [Int]
criarLista n = do
    gen <- newStdGen
    return $ take n $ randomRs (1, 100) gen

-- Função que verifica se duas listas são iguais
listasIguais :: Eq a => [a] -> [a] -> Bool
listasIguais [] [] = True
listasIguais (x:xs) (y:ys) = x == y && listasIguais xs ys
listasIguais _ _ = False

main :: IO ()
main = do
    putStrLn "tamanho da lista 1: "
    tamanhoLista1 <- readLn
    lista1 <- criarLista tamanhoLista1

    putStrLn "tamanho da lista 2: "
    tamanhoLista2 <- readLn
    lista2 <- criarLista tamanhoLista2
    
    putStrLn $ "As listas 1 e 2 são iguais? " ++ show (listasIguais lista1 lista2)
