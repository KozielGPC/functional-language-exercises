stockCheck :: Int -> [Int] -> [Int]
stockCheck initialSize orders = checkOrders initialSize orders []
  where
    checkOrders :: Int -> [Int] -> [Int] -> [Int]
    checkOrders _ [] acc = acc
    checkOrders size (currentOrder:restOrders) acc
      | currentOrder <= size = checkOrders (size - currentOrder) restOrders (acc ++ [currentOrder])
      | currentOrder - head acc <= size = checkOrders (size - (currentOrder - head acc)) restOrders (tail acc ++ [currentOrder])
      | otherwise = checkOrders size restOrders acc


main :: IO ()
main = do
  let orders = [12, 12, 1342, 15, 15, 15, 13, 1, 1, 1, 1, 1, 1, 1, 1, 15, 15,15 ,15 ,15 , 15]
      size = 15
      result = stockCheck size orders
  print result