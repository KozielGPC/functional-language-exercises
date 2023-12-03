function quicksort(array) {
    if (array.length <= 1) return array;

    const pivot = array[0];

    const lesser = array.filter(n => n < pivot);
    const equal = array.filter(n => n === pivot);
    const greater = array.filter(n => n > pivot);
    
    return quicksort(lesser).concat(equal).concat(quicksort(greater));
}

console.log(quicksort([2,9,3,5,97,15,32,1024,7,5]));