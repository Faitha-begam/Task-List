// Flat an Array - method 1
console.log('Flat an Array - method 1');

const arr = [1,2,3,4,[1,2,3]]
let array = []
for(let f=0; f<4; f++){
    array.push(arr[f])
    }
for(let g=0; g<arr[4].length; g++){
    array.push(arr[g])
}
console.log(array)


// Flat an Array - method 2
console.log('Flat an Array - method 2');

const arrr = [1, 2, 3, 4, [1, 2, 3]];
for (let i = 0; i < arrr.length; i++) {
    if (Array.isArray(arrr[i])) {
       for (let j = 0; j < arrr[i].length; j++) {
            console.log(arr[i][j]);
        }
    } 
    else {
        console.log(arrr[i]);
    }
}


// Find the Indices Target Sum
console.log('Find the Indices Target Sum');

const arrayTwo = [1,2,3,4,5,6,7]
let target = 9
for(let f=0; f<arrayTwo.length; f++){
    for(let g=f+1; g<arrayTwo.length; g++){
        if(arrayTwo[f] + arrayTwo[g] == target){
           console.log(arrayTwo[f] , arrayTwo[g]);
           
        }
    }
}





