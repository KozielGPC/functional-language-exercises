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

function measureTime(array) {
    const startTime = performance.now();
    stockCheckFunctional(100000, array);
    // stockCheck(150000, array);
    const endTime = performance.now();

    return endTime - startTime;
}

function generateRandomArray(size) {
    const array = [];
    for (let i = 0; i < size; i++) {
        array.push(Math.floor(Math.random() * 1000));
    }
    return array;
}

function main() {
    const testSizes = [11000000, 120000000, 700000000];

    for (const size of testSizes) {
        const array = generateRandomArray(size);
        const time = measureTime(array);

        console.log(`Array size: ${size}, Time: ${time.toFixed(4)} milliseconds`);
    }
}

main();
