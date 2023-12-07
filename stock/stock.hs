import System.CPUTime

stockCheckRecursive :: Int -> [Int] -> [Int]
stockCheckRecursive maxSize orders = checkOrders maxSize orders []
  where
    checkOrders :: Int -> [Int] -> [Int] -> [Int]
    checkOrders remainingSize [] acceptedOrders = reverse acceptedOrders
    checkOrders remainingSize (currentOrder:restOrders) acceptedOrders
      | currentOrder <= remainingSize =
          checkOrders (remainingSize - currentOrder) restOrders (currentOrder:acceptedOrders)
      | not (null acceptedOrders) && currentOrder - head acceptedOrders <= remainingSize =
          checkOrders (remainingSize - (currentOrder - head acceptedOrders)) restOrders (currentOrder:tail acceptedOrders)
      | otherwise = checkOrders remainingSize restOrders acceptedOrders


sortedList :: [Int]
sortedList = stockCheckRecursive 100000 [1..700000000]

main :: IO ()
main = do
  start <- getCPUTime
  seq sortedList (pure ())
  end <- getCPUTime
  let diff = fromIntegral (end - start) / (10 ^ 12)
  putStrLn $ "Time: " ++ show diff ++ " seconds"