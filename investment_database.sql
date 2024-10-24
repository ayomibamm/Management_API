/*
Project Objective:

The objective of this project is to develop a simplified investment banking database that simulates client transactions, 
focusing on tracking investments in various financial products such as stocks, bonds, ETFs, and mutual funds. 
The project will involve creating two tables: a Clients table to store client details and a Transactions table to record their 
financial activities. This database will provide insights into client behavior, transaction types, and overall investment performance, 
serving as a foundational tool for analyzing investment trends and client portfolios.
*/

-- Creating the Database
CREATE DATABASE InvestmentBankingDB;

-- Use the Database
USE InvestmentBankingDB;

-- Creating the Clients Table
CREATE TABLE Clients (
    ClientID VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Country VARCHAR(50)
);

-- Insert Data into Clients Table
INSERT INTO Clients 
VALUES
('0001', 'Paris McCormick', 47, 'Japan'),
('0002', 'Jasiah Ellis', 33, 'India'),
('0003', 'Ayla Ochoa', 25, 'France'),
('0004', 'Winston Reyna', 65, 'Australia'),
('0005', 'Luella Haynes', 49, 'USA'),
('0006', 'Kason Alvarez', 31, 'Brazil'),
('0007', 'Leilani Alfaro', 28, 'Japan'),
('0008', 'Xzavier Harris', 62, 'India'),
('0009', 'Penelope Shelton', 22, 'France'),
('0010', 'Leonel Novak', 36, 'Japan'),
('0011', 'Kaiya Mullins', 45, 'India'),
('0012', 'Allen Lynch', 37, 'Canada'),
('0013', 'Malia Brandt', 56, 'Canada'),
('0014', 'Damir Collier', 50, 'UK'),
('0015', 'Ivory Stokes', 40, 'South Africa'),
('0016', 'Santana Montgomery', 53, 'USA'),
('0017', 'Evangeline Harding', 62, 'South Africa'),
('0018', 'Brodie Smith', 42, 'USA'),
('0019', 'Olivia Medrano', 39, 'Japan'),
('0020', 'Arian Lin', 38, 'Australia'),
('0021', 'Makenna Cruz', 40, 'Brazil'),
('0022', 'Ryan Waters', 25, 'France'),
('0023', 'Bristol Gray', 22, 'South Africa'),
('0024', 'Nicholas Morrow', 58, 'South Africa'),
('0025', 'Reyna Torres', 31, 'South Africa'),
('0026', 'Jayden Shepherd', 40, 'Germany'),
('0027', 'Katalina Pearson', 31, 'Brazil'),
('0028', 'Gunner Schwartz', 52, 'UK'),
('0029', 'Lilliana Chavez', 65, 'Australia'),
('0030', 'Ian Pope', 57, 'Canada');

-- Creating the Transactions Table
CREATE TABLE Transactions (
    TransactionID VARCHAR(5) PRIMARY KEY,
    ClientID VARCHAR(5),
    TransactionType VARCHAR(10),
    ProductType VARCHAR(20),
    Quantity INT,
    PricePerUnit DECIMAL(10, 2),
    TotalTransactionValue DECIMAL(15, 2),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

-- Inserting Data into Transactions Table
INSERT INTO Transactions 
VALUES
('A01', '0010', 'Buy', 'ETF', 91, 123.68, 11254.88),
('A02', '0022', 'Sell', 'Stock', 926, 385.72, 357176.72),
('A03', '0012', 'Buy', 'Stock', 474, 199.54, 94581.96),
('A04', '0015', 'Sell', 'Mutual Fund', 728, 377.17, 274579.76),
('A05', '0029', 'Buy', 'ETF', 324, 229.53, 74367.72),
('A06', '0013', 'Buy', 'Stock', 761, 420.77, 320205.97),
('A07', '0007', 'Buy', 'Mutual Fund', 790, 220.37, 174092.30),
('A08', '0021', 'Sell', 'Bond', 823, 136.35, 112216.05),
('A09', '0030', 'Sell', 'Stock', 233, 479.90, 111816.70),
('A10', '0002', 'Sell', 'Stock', 955, 183.23, 174984.65),
('A11', '0002', 'Sell', 'Bond', 983, 453.77, 446055.91),
('A12', '0012', 'Sell', 'Stock', 680, 220.02, 149613.60),
('A13', '0006', 'Sell', 'Stock', 873, 492.03, 429542.19),
('A14', '0022', 'Buy', 'ETF', 477, 183.67, 87610.59),
('A15', '0016', 'Buy', 'Stock', 780, 426.71, 332833.80),
('A16', '0023', 'Buy', 'ETF', 889, 103.22, 91762.58),
('A17', '0001', 'Sell', 'Bond', 243, 230.78, 56079.54),
('A18', '0003', 'Sell', 'ETF', 813, 230.31, 187242.03),
('A19', '0012', 'Buy', 'ETF', 283, 388.02, 109809.66),
('A20', '0002', 'Sell', 'ETF', 811, 237.95, 192977.45),
('A21', '0004', 'Sell', 'Stock', 771, 417.24, 321692.04),
('A22', '0024', 'Buy', 'Mutual Fund', 510, 45.50, 23205.00),
('A23', '0018', 'Sell', 'ETF', 926, 429.09, 397337.34),
('A24', '0026', 'Sell', 'Mutual Fund', 724, 400.81, 290186.44),
('A25', '0027', 'Sell', 'Mutual Fund', 610, 365.46, 222930.60),
('A26', '0022', 'Sell', 'Mutual Fund', 462, 113.55, 52460.10),
('A27', '0001', 'Sell', 'Stock', 169, 60.18, 10170.42),
('A28', '0006', 'Buy', 'Mutual Fund', 295, 315.19, 92981.05),
('A29', '0013', 'Sell', 'Bond', 963, 279.40, 269062.20),
('A30', '0007', 'Sell', 'Stock', 495, 454.63, 225041.85),
('A31', '0017', 'Buy', 'Mutual Fund', 544, 438.95, 238788.80),
('A32', '0001', 'Sell', 'Stock', 184, 23.24, 4276.16),
('A33', '0009', 'Buy', 'Bond', 719, 360.80, 259415.20),
('A34', '0020', 'Sell', 'Mutual Fund', 500, 395.68, 197840.00),
('A35', '0014', 'Buy', 'Stock', 427, 471.97, 201531.19),
('A36', '0021', 'Buy', 'Bond', 211, 369.82, 78032.02),
('A37', '0009', 'Buy', 'Stock', 968, 246.24, 238360.32),
('A38', '0023', 'Buy', 'Bond', 30, 489.94, 14698.20),
('A39', '0009', 'Buy', 'ETF', 580, 391.13, 226855.40),
('A40', '0022', 'Sell', 'Mutual Fund', 234, 98.64, 23081.76);
