function partition(array, left, right) {
    const pivot = array[right];
    let i = left - 1;

    for (let j = left; j < right; j++) {
        if (array[j] < pivot) {
            i++;
            swap(array, i, j);
        }
    }

    swap(array, i + 1, right);
    return i + 1;
}

function swap(array, i, j) {
    const temp = array[i];
    array[i] = array[j];
    array[j] = temp;
}

function quicksort(array, left = 0, right = array.length - 1) {
    if (left < right) {
        const pivotIndex = partition(array, left, right);
        quicksort(array, left, pivotIndex - 1);
        quicksort(array, pivotIndex + 1, right);
    }
    return array;
}

function quicksortFunctional(array) {
    if (array.length <= 1) return array;

    const [pivot, ...rest] = array;
    const lesser = array.filter(n => n < pivot);
    const greater = array.filter(n => n > pivot);

    return quicksortFunctional(lesser).concat(pivot).concat(quicksortFunctional(greater));
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
