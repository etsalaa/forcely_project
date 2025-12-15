USE ismgroup31;

CREATE TABLE User (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(100) NOT NULL
)

CREATE TABLE Secretary (
    username VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (username) REFERENCES User(username)
        ON DELETE CASCADE
)

CREATE TABLE WarehouseWorker (
    username VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (username) REFERENCES User(username)
        ON DELETE CASCADE
)

CREATE TABLE Customer (
    customerId INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    street VARCHAR(255),
    area VARCHAR(255),
    postalcode VARCHAR(5),
    email VARCHAR(100) UNIQUE
)

CREATE TABLE Product (
    productCode VARCHAR(50) NOT NULL PRIMARY KEY,
    productName VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    description VARCHAR(255),
    category VARCHAR(100),
    martialArt VARCHAR(100),
    imageUrl VARCHAR(255)
);

CREATE TABLE Size (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name ENUM(
        'XXS','XS','S','M','L','XL','XXL','XXXL',
        'OZ_8','OZ_10','OZ_12','OZ_14','OZ_16',
        'CM_100','CM_110','CM_120','CM_130','CM_140',
        'CM_150','CM_160','CM_170','CM_180','CM_190',
        'CM_200','CM_210'
    ) NOT NULL
);

CREATE TABLE Color (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name ENUM(
        'BLACK','RED','BLUE','WHITE','GREEN',
        'PURPLE','PINK','YELLOW','SILVER','GOLD'
    ) NOT NULL
);

-- Πίνακας many-to-many για διαθέσιμα μεγέθη
CREATE TABLE Product_Size (
    productCode VARCHAR(50) NOT NULL,
    size_id INT NOT NULL,
    PRIMARY KEY(productCode, size_id),
    FOREIGN KEY(productCode) REFERENCES Product(productCode) ON DELETE CASCADE,
    FOREIGN KEY(size_id) REFERENCES Size(id)
);

-- Πίνακας many-to-many για διαθέσιμα χρώματα
CREATE TABLE Product_Color (
    productCode VARCHAR(50) NOT NULL,
    color_id INT NOT NULL,
    PRIMARY KEY(productCode, color_id),
    FOREIGN KEY(productCode) REFERENCES Product(productCode) ON DELETE CASCADE,
    FOREIGN KEY(color_id) REFERENCES Color(id)
);

CREATE TABLE Product_Variant (
    id INT PRIMARY KEY AUTO_INCREMENT,
    productCode VARCHAR(50) NOT NULL,
    size_id INT NOT NULL,
    color_id INT NOT NULL,
    stock INT DEFAULT 0,
    imageUrl VARCHAR(255),
    FOREIGN KEY(productCode) REFERENCES Product(productCode) ON DELETE CASCADE,
    FOREIGN KEY(size_id) REFERENCES Size(id),
    FOREIGN KEY(color_id) REFERENCES Color(id),
    UNIQUE(productCode, size_id, color_id) -- εξασφαλίζει ότι κάθε variant είναι μοναδικό
);

CREATE TABLE Cart (
    cartId INT AUTO_INCREMENT PRIMARY KEY,
    createdAt DATE,
    totalAmount DECIMAL(10,2) NOT NULL DEFAULT 0,
    totalQuantity INT NOT NULL DEFAULT 0
);


CREATE TABLE Cart_Item (
    cartId INT NOT NULL,
    productVariant_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    totalAmount DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(cartId, productVariant_id),
    FOREIGN KEY(cartId) REFERENCES Cart(cartId) ON DELETE CASCADE,
    FOREIGN KEY(productVariant_id) REFERENCES Product_Variant(id) ON DELETE CASCADE
);
