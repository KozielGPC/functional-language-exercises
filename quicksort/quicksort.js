function quicksort(array) {
    if (array.length <= 1) return array;

    const pivot = array[0];

    // Partition the array into three parts: lesser, equal and greater
    const lesser = array.filter(n => n < pivot);
    const equal = array.filter(n => n === pivot);
    const greater = array.filter(n => n > pivot);

    // Recursively apply quicksort to lesser and greater parts, and concatenate the results
    return quicksort(lesser).concat(equal).concat(quicksort(greater));
}

function measureTime(array) {
    const startTime = performance.now();
    quicksort(array);
    const endTime = performance.now();

    return endTime - startTime;
}

function generateRandomArray(size) {
    // Generate an array with random integers between 0 and 999
    const array = [];
    for (let i = 0; i < size; i++) {
        array.push(Math.floor(Math.random() * 1000));
    }
    return array;
}

function main() {
    // Define an array of test sizes
    const testSizes = [10, 100, 1000, 10000, 100000, 1000000, 10000000, 80000000];

    for (const size of testSizes) {
        const array = generateRandomArray(size);
        const time = measureTime(array);

        console.log(`Array size: ${size}, Time: ${time.toFixed(4)} milliseconds`);
    }
}

main();
