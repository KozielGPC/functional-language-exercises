import System.CPUTime

quickSort :: [Int] -> [Int]
quickSort [] = []
quickSort list = quickSort leftSublist ++ pivotList ++ quickSort rightSublist
  where
    pivot :: Int
    pivot = head list

    leftSublist :: [Int]
    leftSublist = filter (< pivot) list

    pivotList :: [Int]
    pivotList = filter (== pivot) list

    rightSublist :: [Int]
    rightSublist = filter (> pivot) list

sortedList :: [Int]
sortedList = quickSort [1..70000000]

main :: IO ()
main = do
  start <- getCPUTime
  seq sortedList (pure ())
  end <- getCPUTime
  let diff = fromIntegral (end - start) / (10 ^ 12)
  putStrLn $ "Time: " ++ show diff ++ " seconds"
