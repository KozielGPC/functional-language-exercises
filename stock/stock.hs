import System.CPUTime

stockCheckRecursive :: Int -> [Int] -> [Int]
stockCheckRecursive size orders = checkOrders 0 size orders []
  where
    checkOrders :: Int -> Int -> [Int] -> [Int] -> [Int]
    checkOrders index remainingSize orders acceptedOrders
      | index >= length orders = acceptedOrders
      | currentOrder <= remainingSize =
          checkOrders (index + 1) (remainingSize - currentOrder) orders (acceptedOrders ++ [currentOrder])
      | currentOrder - head acceptedOrders <= remainingSize =
          checkOrders (index + 1) (remainingSize - (currentOrder - head acceptedOrders)) orders (tail acceptedOrders ++ [currentOrder])
      | otherwise = checkOrders (index + 1) remainingSize orders acceptedOrders
      where
        currentOrder = orders !! index



sortedList :: [Int]
sortedList = stockCheckRecursive 14 [1..50000]

main :: IO ()
main = do
  start <- getCPUTime
  seq sortedList (pure ())
  end <- getCPUTime
  let diff = fromIntegral (end - start) / (10 ^ 12)
  putStrLn $ "Time: " ++ show diff ++ " seconds"