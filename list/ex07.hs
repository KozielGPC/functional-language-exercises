import System.Random

-- Função que cria uma lista de tamanho n
criarLista :: Int -> IO [Int]
criarLista n = do
    gen <- newStdGen
    return $ take n $ randomRs (1, 100) gen

concatenarListas :: [a] -> [a] -> [a]
concatenarListas [] ys = ys
concatenarListas (x:xs) ys = x : concatenarListas xs ys

main :: IO ()
main = do
    putStrLn "tamanho da lista 1: "
    tamanhoLista1 <- readLn
    lista1 <- criarLista tamanhoLista1

    putStrLn "tamanho da lista 2: "
    tamanhoLista2 <- readLn
    lista2 <- criarLista tamanhoLista2

    let resultadoConcatenacao = concatenarListas lista1 lista2
    putStrLn $ "A concatenação de " ++ show lista1 ++ " e " ++ show lista2 ++ " é: " ++ show resultadoConcatenacao
