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

main :: IO ()
main = do
  let orders = [15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
      size = 15
      result = stockCheckRecursive size orders
  print result