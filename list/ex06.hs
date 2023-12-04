-- Função que verifica se duas listas são iguais
listasIguais :: Eq a => [a] -> [a] -> Bool
listasIguais [] [] = True
listasIguais (x:xs) (y:ys) = x == y && listasIguais xs ys
listasIguais _ _ = False

main :: IO ()
main = do

    let list1 = [3,4,2,7,1,8,2,1]
    let list2 = [3,4,2,7,1,8,2,1]
    
    putStrLn $ "As listas 1 e 2 são iguais? " ++ show (listasIguais list1 list2)
