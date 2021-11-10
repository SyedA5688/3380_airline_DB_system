# 3380_airline_system_project
This repository contains the implementation of the airline personnel HR web/database system for COSC 3380 Database Systems with Dr. Carlos Ordonez, Fall 2021.

Group Members:
Syed Rizvi
Aaron Wright
Nathaniel Valtierra
Kirmanbek Bazarov


Prerequirements:
- Node.js installed on local machine
- npm package manager (comes with node)

Instructions for getting started:
1. Pull the code
```
git clone https://github.com/SyedA5688/3380_airline_DB_system.git
```

2. Navigate to repository base
```
cd 3380_airline_DB_system
```

3. Install dependencies
```
npm install
```

4. Create an esql_creds.json file
- Create an ElephantSQL account, create an instance, then follow instructions in create_table_script.txt to create example employee table
- Create a file called esql_creds.json, fill in details of your ElephantSQL instance so that web application connects to your ElephantSQL database. In future we might all work out of one person's ElephantSQL instance to test concurrency in transactions.

5. Start the Web Server (web server listens for web requests made by web client, which is user)
```
node index.js
```

6. Once server is listening on a local port, start web client
  - Option 1: Install Live Server extension on VSCode, then right-click on index.html and open with live server (recommended, this refreshes webpage whenever you change code)
  - Option 2: Right click index.html, open with chrome (will not refresh everytime code changes)