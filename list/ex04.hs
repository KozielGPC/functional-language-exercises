-- Função que cria uma lista de tamanho n
criarLista :: Int -> [Int]
criarLista n = [1..n]

-- Função que calcula o produto dos elementos de uma lista
produtoLista :: Num a => [a] -> a
produtoLista [] = 1 -- se a lista está vazia, o produto é 1
produtoLista (x:xs) = x * produtoLista xs  -- elemento atual * produto total

main :: IO ()
main = do
    putStrLn "tamanho da lista: "
    tamanhoLista <- readLn
    let lista = criarLista tamanhoLista

    putStrLn $ "O produto dos elementos da lista " ++ show lista ++ " é: " ++ show (produtoLista lista)