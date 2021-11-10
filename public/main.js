// const { table } = require("console");

// Global variable
let employees = []

// Setter method
const setEmployees = (data) => {
  employees = data;
}

// Display employees
const displayEmployees = () => {
  employees.sort((a, b) => {
    return a.id - b.id;
  });
  const demoTable = document.querySelector('#employee-table');

  // display all employees by modifying the HTML in 'demo-table'
  let tableHTML = ""
  console.log(employees);
  employees.map(employee => {
    tableHTML +=
    `<tr key=${employee.id}>
    <th>${employee.id}</th>
    <th>${employee.first_name}</th>
    <th>${employee.last_name}</th>
    <th>${employee.job}</th>
    <th>${employee.salary}</th>
    </tr>`;
  })
  demoTable.innerHTML = tableHTML;
}

//Select all employees when code first runs
selectEmployees();
console.log("Main.js script running when page loads");


// Async function definitions to select, insert, update, and delete employees
async function selectEmployees() {
  try {
    // Get all employees from "/employees"
    const response = await fetch("/employees")
    const jsonData = await response.json();
    // console.log("Inside selectEmployees(), jsonData:", jsonData);

    setEmployees(jsonData);
    displayEmployees();
  }
  catch (err) {
    console.log(err.message);
  }
}

async function insertEmployee() {
  const inputID = document.querySelector("#inputEmployeeID");
  const inputFirstName = document.querySelector("#inputEmployeeFirstName");
  const inputLastName = document.querySelector("#inputEmployeeLastName");
  const inputJobTitle = document.querySelector("#inputEmployeeJobTitle");
  const inputSalary = document.querySelector("#inputEmployeeSalary");

  const id = inputID.value;
  const first_name = inputFirstName.value;
  const last_name = inputLastName.value;
  const job_title = inputJobTitle.value;
  const salary = inputSalary.value;

  try {
    // insert new demo to /employees with POST request
    const body = { id: id, first_name: first_name, last_name: last_name, job_title: job_title, salary: salary };

    // connect to heroku? Remove localhost:port
    const response = await fetch("/employees", {
      method: "POST",
      headers: {"Content-Type": "application/json"},
      body: JSON.stringify(body)
    });

    const newEmployee = await response.json();
    employees.push(newEmployee);
    displayEmployees();

    inputID.value = 0;
    inputFirstName.value = 0;
    inputLastName.value = 0;
    inputJobTitle.value = 0;
    inputSalary.value = 0;
  }
  catch (err) {
    console.log(err.message);
  }
}
