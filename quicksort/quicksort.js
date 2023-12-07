function quicksort(array) {
    if (array.length <= 1) {
        return array;
    }

    const pivot = array[0];
    const lesser = [];
    const equal = [pivot];
    const greater = [];

    for (let i = 1; i < array.length; i++) {
        if (array[i] < pivot) {
            lesser.push(array[i]);
        } else {
            greater.push(array[i]);
        }
    }

    return [...quicksort(lesser), equal, ...quicksort(greater)];
}

function quicksortFunctional(array) {
    if (array.length <= 1) return array;

    const [pivot, ...rest] = array;

    const lesser = array.filter(n => n < pivot);
    const equal = array.filter(n => n === pivot);
    const greater = array.filter(n => n > pivot);

    return quicksortFunctional(lesser).concat(equal).concat(quicksortFunctional(greater));
}

function measureTime(array) {
    const startTime = performance.now();
    // quicksort(array);
    quicksortFunctional(array);
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
    const testSizes = [5000000, 70000000, 350000000]; // 5 milhoes e 70 milhoes

    for (const size of testSizes) {
        const array = generateRandomArray(size);
        const time = measureTime(array);

        console.log(`Array size: ${size}, Time: ${time.toFixed(4)} milliseconds`);
    }
}

main();
