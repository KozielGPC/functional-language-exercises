-- Função que cria uma lista de tamanho n
criarLista :: Int -> [Int]
criarLista n = [1..n]

-- Função que verifica se o elemento está da lista
estaNaLista :: Eq a => a -> [a] -> Bool
estaNaLista _ [] = False  -- se a lista está vazia, o elemento não está presente
estaNaLista elemento (x:xs) =
  if elemento == x
    then True  -- está na cabeça da lista
    else estaNaLista elemento xs  -- precisa verificar a cauda da lista (o resto)

main :: IO ()
main = do
    putStrLn "tamanho da lista: "
    tamanhoLista <- readLn
    let lista = criarLista tamanhoLista

    putStrLn "elemento a ser testado: "
    elemento <- readLn

    let resultadoTeste = estaNaLista elemento lista

    if resultadoTeste
        then putStrLn $ "O elemento " ++ show elemento ++ " está na lista."
        else putStrLn $ "O elemento " ++ show elemento ++ " não está na lista."
