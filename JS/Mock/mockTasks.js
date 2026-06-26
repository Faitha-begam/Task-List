// Create a program to calculate a student's grade

let marks = 85;

if (marks >= 90 && marks <= 100) {
    console.log("Grade: A");
} 
else if (marks >= 80 && marks <= 89) {
    console.log("Grade: B");
} 
else if (marks >= 70 && marks <= 79) {
    console.log("Grade: C");
} 
else if (marks >= 60 && marks <= 69) {
    console.log("Grade: D");
} 
else if (marks >= 0 && marks < 60) {
    console.log("Grade: Fail");
} 
else {
    console.log("Invalid Marks");
}

// Task 2 - Even or Odd
 const checkNumber = () => {
    let number = Number(document.getElementById("num").value);

    if (number % 2 === 0) {
        document.getElementById("result").textContent = "Even"
    } else {
        document.getElementById("result/'").textContent = "Odd"
    }
}

// Task 3 - Sum of Array
let studentMark = []

const addMarks = () => {
    let mark = Number(document.getElementById("marks").value);

    studentMark.push(mark)

    console.log(studentMark)

    document.getElementById("marks").value = ""
}

const calculate = () => {
    console.log(studentMark)
    let total = 0

    for (let i = 0; i < studentMark.length; i++) {
        total = total + studentMark[i];
    }

    let average = total / studentMark.length;

    console.log("Total Marks:", total);
    console.log("Average Marks:", average);
}

// Task 4
let movieCollections = [150, 300, 200, 450, 250]

let highest = movieCollections[0]
let index = 0;

for (let i = 1; i < movieCollections.length; i++) {

    if (movieCollections[i] > highest) {
        highest = movieCollections[i]
        index = i
    }

}

console.log("Highest Collection:", highest)
console.log("Movie Index:", index)