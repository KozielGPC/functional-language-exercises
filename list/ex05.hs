-- Função que cria uma lista de tamanho n
criarLista :: Int -> [Int]
criarLista n = [1..n]

-- Função que faz reversão de uma lista
reverterLista :: [a] -> [a]
reverterLista [] = [] -- se a lista está vazia, a lista retornada será vazia
reverterLista (x:xs) = reverterLista xs ++ [x]  -- Caso recursivo: reversão da cauda + adição do primeiro elemento no final

main :: IO ()
main = do
    putStrLn "tamanho da lista: "
    tamanhoLista <- readLn
    let lista = criarLista tamanhoLista

    putStrLn $ "A lista original: " ++ show lista
    putStrLn $ "A lista revertida: " ++ show (reverterLista lista)
