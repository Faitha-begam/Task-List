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