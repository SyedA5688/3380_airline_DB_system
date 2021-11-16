# 3380_airline_system_project
This repository contains the implementation of the airline personnel HR web/database system for COSC 3380 Database Systems with Dr. Carlos Ordonez, Fall 2021.

Group Members:
Syed Rizvi
Nathaniel Valtierra
Kurmanbek Bazarov


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

4. Replace the sample url in the .env file with the url of your ElephantSQL instance
- Create an ElephantSQL account, create an instance, then follow instructions in create_table_script.txt to create example employee table
- Replace the sample url in the .env file with the url of your ElephantSQL instance so that web application connects to your ElephantSQL database. In future we might all work out of one person's ElephantSQL instance to test concurrency in transactions.

5. Start the Web Server (web server listens for web requests made by web client, which is user)
```
node index.js
```

6. Once server is listening on a local port, start web client
  - Start a new terminal
  - cd to client/ directory
  - run ```npm start``` to start developmental react frontend client
