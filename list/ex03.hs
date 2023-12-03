-- Função que cria uma lista de tamanho n
criarLista :: Int -> [Int]
criarLista n = [1..n]

-- Função que soma os elementos de uma lista
somaLista :: Num a => [a] -> a
somaLista [] = 0  -- se a lista está vazia, a soma é 0
somaLista (x:xs) = x + somaLista xs  -- elemento atual + soma total

main :: IO ()
main = do
    putStrLn "tamanho da lista: "
    tamanhoLista <- readLn
    let lista = criarLista tamanhoLista

    putStrLn $ "A soma dos elementos da lista " ++ show lista ++ " é: " ++ show (somaLista lista)
