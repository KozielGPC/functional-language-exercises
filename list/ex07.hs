concatenarListas :: [a] -> [a] -> [a]
concatenarListas [] ys = ys
concatenarListas (x:xs) ys = x : concatenarListas xs ys

main :: IO ()
main = do
    let list1 = [3,4,2,7,1,8,2,1]
    let list2 = [10,9,6,5,6,9,10]

    let resultadoConcatenacao = concatenarListas list1 list2
    putStrLn $ "A concatenação de " ++ show list1 ++ " e " ++ show list2 ++ " é: " ++ show resultadoConcatenacao
