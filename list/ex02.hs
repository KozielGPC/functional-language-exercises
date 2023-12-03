-- Função que cria uma lista de tamanho n
criarLista :: Int -> [Int]
criarLista n = [1..n]

-- Função que mostra o tamanho de uma lista
tamanhoLista :: [a] -> Int
tamanhoLista [] = 0  -- se a lista está vazia, o tamanho é 0
tamanhoLista (x:xs) = 1 + tamanhoLista xs  -- utilizando recursividade: 1 + tamanho do restante da lista

main :: IO ()
main = do
    putStrLn "tamanho da lista: "
    tamanho <- readLn
    let lista = criarLista tamanho

    putStrLn $ "A lista " ++ show lista ++ " tem tamanho: " ++ show (tamanhoLista lista)
