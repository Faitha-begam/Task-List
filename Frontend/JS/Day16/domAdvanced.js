// Task 1 - Character Counter
let count = 0
const countCharacter =()=>{
    const taskOneInput = document.getElementById("taskOneInput").value
    const taskOneCount = document.getElementById("taskOneCount")
    count++
    taskOneCount.innerText = "Total Characters: " + count
}

// Task 2 - Age Category Checker
const checkAge =()=>{
    const taskTwoInput = document.getElementById("taskTwoInput").value
    const taskTwoP = document.getElementById("taskTwoP")
    if(taskTwoInput <= 12){
      taskTwoP.innerText = "Child"
    }
    else if( taskTwoInput >=13 && taskTwoInput<=19){
      taskTwoP.innerText = "Teenager"
    }
    else if(taskTwoInput >=20 && taskTwoInput<=59){
      taskTwoP.innerText = "Adult"
    }
    else{
        taskTwoP.innerText = "Senior Citizen"
    }
}

// Task 3 - Dark Mode / Light Mode
const changeMode =()=>{
    const bodyColor = document.getElementById("body")
    const taskThreeBtn = document.getElementById("taskThreeBtn")
    if(bodyColor.style.backgroundColor === "black"){
        bodyColor.style.backgroundColor = "white" 
        bodyColor.style.color = "black" 
        taskThreeBtn.innerText = "Dark Mode"
    }
    else{
        bodyColor.style.backgroundColor = "black" 
        bodyColor.style.color = "white"
        taskThreeBtn.innerText = "Light Mode"
    }
}

// Task 4 - Movie Ticket Calculator
const calculateTotal =()=>{
    const taskFourInput = document.getElementById("taskFourInput").value
    const taskFourP = document.getElementById("taskFourP")

    const total = taskFourInput*150
    taskFourP.innerText = `Total Amount: ${total}`  
}

// Task 5 - Profile Card Generator
const createProfile =()=>{
    const taskFiveName = document.getElementById("taskFiveName").value
    const taskFiveRole = document.getElementById("taskFiveRole").value
    const taskFiveCompany = document.getElementById("taskFiveCompany").value
    const profileCard = document.getElementById("profileCard")

    profileCard.style.display = "block"
    Image
    profileCard.innerHTML =  `
        <img src="../assets/images/common/userProfile.jpg" width="100px" height="100px" style="border-radius: 100px; padding:5px;"> 
        <h2>Profile Card</h2>
        <p><strong>Name:</strong> ${taskFiveName}</p>
        <p><strong>Role:</strong> ${taskFiveRole}</p>
        <p><strong>Company:</strong> ${taskFiveCompany}</p>`
}

// Task 6 - Search Hero

const searchHero=()=>{
    const taskSixInput = document.getElementById("taskSixInput").value
    const taskSixP = document.getElementById("taskSixP")
    let arr = ["Vijay","Ajith","Suriya","SK","Dhanush"]
    for(let f=0; f<arr.length; f++){
    if(taskSixInput === arr[f]){
        taskSixP.innerText = "hero found or not? " + "Found"
        break
    }
    else{
         taskSixP.innerText = "hero found or not? " + "Not Found"
    }
   }
}

//  Task 7 - Lucky/Normal
const checkNumber =()=>{
    const taskSevenInput = Number(document.getElementById("taskSevenInput").value)
    const taskSevenP = document.getElementById("taskSevenP")
    let luckyNumber = [7,14,21,28]
    let found = false

    for(let c=0; c<luckyNumber.length; c++){
        if(taskSevenInput === luckyNumber[c]){
          found = true
          break
        }
        
    }
    if(found){
        taskSevenP.innerText = "Lucky or Normal?" + "Lucky Number";
    }
    else{
       taskSevenP.innerText = "Lucky or Normal?" + "Normal Number"
    }
}

// Task 8 - Product Price Calculator
const displayProduct =()=>{
    const taskEightPname =document.getElementById("taskEightName").value
    const taskEightQnty = document.getElementById("taskEightQnty").value
    const taskEightPrice = document.getElementById("taskEightPrice").value
    const productCard = document.getElementById("productCard")


    const totalAmount = taskEightPrice*taskEightQnty
    productCard.style.display = "block"
    productCard.innerHTML = `<h2> Product Details </h2>
                             <p> Product Name: ${taskEightPname} </p>
                             <p> Product Quantity: ${taskEightQnty} </p>
                             <p> Product Price: ${taskEightPrice} </p>
                             <p> TOTAL AMOUNT : ${totalAmount} </p>`
}

