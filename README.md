# Optimistic Data Exchange & Storage in Blockchain Using Edge Computing Environments

## 📌 Project Overview

**Optimistic Data Exchange & Storage in Blockchain Using Edge Computing Environments** is a Java-based application designed to provide secure and efficient data exchange and storage in a distributed environment.

The system allows consumers to **register and log in, search for available data, make purchase requests, recharge their wallets, and download files**. A MySQL database is used to store and manage application data.

The project demonstrates how blockchain concepts can be combined with edge computing to improve **data security, integrity, accessibility, and decentralized data exchange**.

## 🎯 Objectives

* Provide secure data exchange between users.
* Store and manage data efficiently.
* Maintain data integrity and security.
* Allow consumers to search and access available files.
* Implement a wallet-based purchasing mechanism.
* Provide controlled file downloading.
* Use database-driven operations for managing users and transactions.

## 🚀 Key Features

### 👤 Consumer Registration & Login

* New consumers can create an account.
* Registered consumers can securely log in.
* User information is maintained in the database.

### 🔍 Data Search

* Consumers can search for available data/files.
* Relevant data can be identified before making a purchase request.

### 💰 Wallet Management

* Consumers can recharge their wallets.
* Wallet balance can be used for purchasing data.

### 🛒 Purchase Request

* Consumers can request/purchase available data.
* The system manages purchase-related information.

### 📥 File Download

* Purchased files can be downloaded.
* The application provides functionality for downloading both files and original files.

### 🗄️ Database Management

* MySQL is used for storing application data.
* SQL scripts are provided in `BC07.sql`.

## 🛠️ Technologies Used

* **Java**
* **MySQL**
* **JDBC**
* **SQL**
* **Blockchain Concepts**
* **Edge Computing Concepts**

## 📂 Project Structure

```text
Optimistic-data-exchange-storage-in-blockchain/
│
├── BC07.sql
│
├── ConsumerLogin.java
├── ConsumerRegister.java
├── ConsumerSearchData.java
├── PurchaseRequest.java
├── RechargeWallet.java
├── DownloadFile.java
├── DownloadOriginalFile.java
│
└── README.md
```

## 🔄 Application Workflow

```text
        Consumer
           │
           ▼
   Consumer Registration
           │
           ▼
      Consumer Login
           │
           ▼
     Search Available Data
           │
           ▼
     Select / Purchase Data
           │
           ▼
     Check Wallet Balance
           │
           ▼
      Purchase Request
           │
           ▼
       File Download
```

## 🗃️ Database

The project uses **MySQL** for data storage and management.

The database script is available in:

```text
BC07.sql
```

It can be imported into MySQL to create the required database tables and structures.

## ⚙️ Main Modules

| Module                      | Description                           |
| --------------------------- | ------------------------------------- |
| `ConsumerRegister.java`     | Handles consumer registration         |
| `ConsumerLogin.java`        | Handles consumer authentication       |
| `ConsumerSearchData.java`   | Allows consumers to search for data   |
| `PurchaseRequest.java`      | Handles data purchase requests        |
| `RechargeWallet.java`       | Manages wallet recharge functionality |
| `DownloadFile.java`         | Handles file downloads                |
| `DownloadOriginalFile.java` | Handles original file downloads       |
| `BC07.sql`                  | Contains database SQL scripts         |

## 🔐 Security & Data Integrity

The project focuses on secure data exchange and storage by combining database management with blockchain and edge-computing concepts.

Key objectives include:

* Secure access to consumer accounts
* Controlled access to purchased data
* Reliable data storage
* Data integrity
* Reduced dependency on centralized data exchange
* Efficient access to data in distributed environments

## 💡 Advantages

* Secure data exchange
* Easy consumer registration and authentication
* Wallet-based purchasing
* Controlled file access
* Database-backed data management
* Supports decentralized data exchange concepts
* Suitable for distributed edge-computing environments

## 🔮 Future Enhancements

* Implement smart contracts for automated transactions.
* Integrate a real blockchain network such as Ethereum.
* Add stronger encryption for stored and transferred files.
* Introduce role-based authentication.
* Add cloud and edge hybrid storage.
* Improve scalability for large numbers of users.
* Add a web-based interface using Spring Boot.
* Implement real-time transaction monitoring.

## ▶️ How to Run

### 1. Clone the Repository

```bash
git clone https://github.com/Shiva25805/Optimistic-data-exchange-storage-in-blockchain-.git
```

### 2. Configure MySQL

* Install MySQL.
* Create/import the required database using `BC07.sql`.
* Update the database connection details in the Java source files if required.

### 3. Configure Java

Make sure Java and JDBC are properly configured.

### 4. Compile and Run

Compile the required Java files and run the application starting with the appropriate login/registration module.

## 👨‍💻 Author

**Shiva**

**B.Tech – Information Technology**

---

⭐ If you find this project useful, consider giving the repository a star!
