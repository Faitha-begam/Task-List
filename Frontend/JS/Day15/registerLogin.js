let arr = []
const getValue =(e)=>{
    e.preventDefault()
    const firstName = document.getElementById("fname").value
    const lastName = document.getElementById("lname").value
    const mailID = document.getElementById("mailid").value
    const dateOfBirth = document.getElementById("dateofbirth").value
 
    const userData = {firstName, lastName, mailID, dateOfBirth}
    arr.push(userData)
    console.log(arr);
    
    document.getElementById("registerForm").reset()
}