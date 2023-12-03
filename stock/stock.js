// Sem construção funcional
function stockCheck(size, orders) {
    let acceptedOrders = [];

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
            size -= currentOrder - acceptedOrders[0];
            const temp = [];
            for (let i = 1; i < acceptedOrders.length; i++) {
                temp.push(acceptedOrders[i]);                
            }

            acceptedOrders = temp;
        }

        checkOrders(index + 1);
    }

    checkOrders(0);

    return acceptedOrders;
}

// Com construção funcional
function stockCheckFunctional(size, orders) {
    const acceptedOrders = [];

    orders.forEach(currentOrder => {
        if (currentOrder <= size) {
            acceptedOrders.push(currentOrder);
            size -= currentOrder;
        } else if (currentOrder - acceptedOrders[0] <= size) {
            acceptedOrders.push(currentOrder);
            size -= currentOrder - acceptedOrders[0];
            acceptedOrders.splice(0, 1);
        }
    });

    return acceptedOrders;
}

const orders = [12, 12, 1342, 15, 15, 15, 13, 1, 1, 1, 1, 1, 1, 1, 1, 15, 15,15 ,15 ,15 , 15];
const size = 15;

const result = stockCheckFunctional(size, orders);

console.log(result);
