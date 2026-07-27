// Task 1
const changeHeader =()=>{
        const heroName = document.getElementById("heroname").value;
        const heroNameH2 = document.getElementById("heronameh2");
          heroNameH2.innerHTML = heroName
    }

// Task 2
const hidePara =()=>{
    const taskTwoPara = document.getElementById("tasktwopara")
    if (taskTwoPara.style.display === "block" ){
        taskTwoPara.style.display = "none" 
    }
}
// Task 3
const showPara =()=>{
   const taskTwoPara = document.getElementById("tasktwopara")
    if (taskTwoPara.style.display === "none" ){
        taskTwoPara.style.display = "block" 
    }
}
// Task 4
const showHide =()=>{
    const taskFourPara = document.getElementById("taskfourpara")
    const taskFourBtn = document.getElementById("taskfourbtn")
    if (taskFourPara.style.display === "block" ){
        taskFourPara.style.display = "none" 
        taskFourBtn.innerHTML = "Show"
    }
    else{
        taskFourPara.style.display = "block"
        taskFourBtn.innerHTML = "Hide"
    }
}

// Task 5
const loginUser =()=>{
    const taskFiveInput = document.getElementById("taskfiveinput").value
const taskFivePara = document.getElementById("taskfivepara")
if(taskFiveInput === "admin"){
    taskFivePara.innerHTML = "Login Success"
}
else{
    taskFivePara.innerHTML = "Invalid User"
}
}

// Task 6
const plength =()=>{
const taskSixInput = document.getElementById("tasksixinput").value
const taskSixP = document.getElementById("tasksixp")
if(taskSixInput.length >= 8){
    taskSixP.innerText = "Strong Password"
}
else{
    taskSixP.innerText = "Weak Password"
}
}

// Task 7
const mergeName =()=>{
    const taskSevenInputOne = document.getElementById("taskseveninputone").value
    const taskSevenInpuTwo = document.getElementById("taskseveninputwo").value
    const taskSevenH = document.getElementById("tasksevenh")

    taskSevenH.textContent = "Full Name : " + taskSevenInputOne + " " + taskSevenInpuTwo
}

// Task 8
const wake = ()=>{
    const catImageOne = document.getElementById("catImageOne")
    const taskEightP = document.getElementById("taskeightp")
    
    catImageOne.src = "../assets/images/common/awakeCat.jpg"
    taskEightP.innerText = "I Said Don't"
}

// Task 9
const change =()=>{
    const taskNineH = document.getElementById("tasknineh")

    taskNineH.style.color = "brown"
    taskNineH.innerText = "I'm Brown now 🤎"
}

// Task 10
const check =()=>{
    const taskTenInput = document.getElementById("taskteninput").value
    const taskTenP = document.getElementById("tasktenp") 
    if(taskTenInput === ""){
       taskTenP.innerText = "Please Enter Value"
    }
    else{
    taskTenP.innerText = "Form Submitted"
    }  
}

// Task 11
 let count = 0
const increase =()=>{
    const lastTaskH = document.getElementById("lastTaskH")
   
        count++
        lastTaskH.innerText = "count : " + count
    
}