function stockCheckRecursive(size, orders) {
    const acceptedOrders = [];

    function checkOrders(index) {
        if (index >= orders.length) {
            return;
        }

        const currentOrder = orders[index];

        if (currentOrder <= size) {
            acceptedOrders.push(currentOrder);
            size -= currentOrder;
        } else if (currentOrder - acceptedOrders[0] <= size) {
            acceptedOrders.push(currentOrder);
            size -= currentOrder - orders[0];
            const firstOrderIndex = acceptedOrders.findIndex(order => order === orders[0]);
            acceptedOrders.splice(firstOrderIndex, 1);
        }

        checkOrders(index + 1);
    }

    checkOrders(0);

    return acceptedOrders;
}

const orders = [15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,1 ,1 ,1 , 1];
const size = 15;

const result = stockCheckRecursive(size, orders);

console.log(result);
