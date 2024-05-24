# DBKE - iOS application, database restore function module
At the moment of launching the client application, the application accesses the business logic to obtain table data. A console is provided for each table where the user can run their SQL queries. 

The user can also work with the database configuration: view backups and restore the database manually using each backup, adjust the frequency of full backups, differential backups and transaction logs, as well as completely clear the database data.

## Functional scheme
![2024-05-24 01 21 15](https://github.com/Sub4ikGG/dbke-iOS/assets/98654420/8f2ba122-5a18-451c-b05d-a32b6ec3f6fd)

## Backend & API
The backend of the application is written in C# and uses a .NET web server and SQL Server. All of this is running in a Docker cluster. The [API documentation](https://hatebin.com/mgcyqqdejl) for the system is presented in Swagger YAML code.

## Application Design
To further study and understand our topic, I have created a [design](https://www.figma.com/design/tMuHSXWpR1gbkzCilentZp/DBKE?node-id=0-1&t=2LBdNKzi2HBFGHNi-1) for the application using Figma.

## Application Stack
To develop the application, I used Swift, and SwiftUI to create the user interface. 
![изображение](https://github.com/Sub4ikGG/dbke-iOS/assets/98654420/af095a4f-2ba9-4d25-9222-01b1941750b6)

I also used the Model-View-Intent (MVI) pattern to separate the business logic from the user interface. The Model component is responsible for data storage and retrieval, the View component is the user interface, and the ViewModel component acts as a bridge between the two. 
I used Combine to manage the state of the application.

## Screen record
https://github.com/Sub4ikGG/dbke-iOS/assets/98654420/f467df3b-2397-4e6f-a1bf-8d41cd05711a

## Screenshots
<img src="https://github.com/Sub4ikGG/dbke-iOS/assets/98654420/d5206230-791a-4f26-84f1-2ee1fd84cb2d" width="300">
<img src="https://github.com/Sub4ikGG/dbke-iOS/assets/98654420/8195625d-f92b-41d4-bb63-5da208a95639" width="300">
<img src="https://github.com/Sub4ikGG/dbke-iOS/assets/98654420/7d17f7df-231f-4a59-9839-3d85b6451fcb" width="300">
<img src="https://github.com/Sub4ikGG/dbke-iOS/assets/98654420/2ed6c996-2324-436f-85c2-ef302bcead46" width="300">
<img src="https://github.com/Sub4ikGG/dbke-iOS/assets/98654420/714c6aa1-5798-4de9-887c-b09bfccc5959" width="300">
<img src="https://github.com/Sub4ikGG/dbke-iOS/assets/98654420/c470801d-25ad-49df-9c0a-b66c94571c0e" width="300">
<img src="https://github.com/Sub4ikGG/dbke-iOS/assets/98654420/a39bab46-f8ad-4095-b880-f67a09245153" width="300">

