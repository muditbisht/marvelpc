CREATE DATABASE marvel;
USE marvel;
-- Product Table

CREATE TABLE IF NOT EXISTS Products (
  Product_ID INT(6) NOT NULL,
  Company VARCHAR(50),
  Product_Name VARCHAR(50) NOT NULL UNIQUE,
  Types VARCHAR(30) NOT NULL, 
  Specs VARCHAR(600),
  Description VARCHAR(400),
  Price DECIMAL(10,2) NOT NULL,

	PRIMARY KEY (Product_ID)
);



-- Seller Table

CREATE TABLE IF NOT EXISTS Seller (
  Seller_ID INT(6) NOT NULL AUTO_INCREMENT,
  Name VARCHAR(50) NOT NULL UNIQUE,
  Phone CHAR(10) NOT NULL UNIQUE,
  Address VARCHAR(200) NOT NULL,
  City VARCHAR(30) NOT NULL,
  State VARCHAR(2) NOT NULL,
  Pincode VARCHAR(10) NOT NULL,
  Star DECIMAL(2,1),
  Email VARCHAR(100) NOT NULL UNIQUE,
  PRIMARY KEY (Seller_ID)
);



-- Inventory Table

CREATE TABLE IF NOT EXISTS Inventory (
	Inventory_ID INT AUTO_INCREMENT,
  Seller_ID INT(6) NOT NULL,
  Product_ID INT(6) NOT NULL,
  Pieces INT DEFAULT 0,
	UNIQUE(Seller_ID,Product_ID),
  PRIMARY KEY (Inventory_ID),
  FOREIGN KEY (Seller_ID)
    REFERENCES Seller (Seller_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (Product_ID)    
    REFERENCES Products (Product_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);



-- Customer Table

CREATE TABLE IF NOT EXISTS Customer (
  Customer_ID INT(6) NOT NULL,
  Name VARCHAR(30) NOT NULL,
  Email VARCHAR(45) NOT NULL,
  Address VARCHAR(200) NOT NULL,
  City VARCHAR(30) NOT NULL,
  State VARCHAR(2) NOT NULL,
  Pincode VARCHAR(10) NOT NULL,
  Phone CHAR(10) NOT NULL,
  Orders INT NOT NULL DEFAULT 0,
  PRIMARY KEY (Customer_ID)

);


-- Cart Tale

CREATE TABLE IF NOT EXISTS Cart (
  Cart_ID INT(10) NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) DEFAULT "Normal",
  Item_qty INT NOT NULL DEFAULT 0,
  Customer INT(6) NOT NULL,
  PRIMARY KEY (Cart_ID),
  FOREIGN KEY (Customer)    
    REFERENCES Customer (Customer_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );


-- Rig Table

CREATE TABLE IF NOT EXISTS Rig (
  Rig_ID INT(6) NOT NULL AUTO_INCREMENT,
  Design VARCHAR(50) NULL,
	Name VARCHAR(30) DEFAULT "Normal",
	Customer INT(6) NOT NULL,
	Cart_ID INT(10) NULL,
  PRIMARY KEY (Rig_ID),
	FOREIGN KEY (Customer)    
    REFERENCES Customer (Customer_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (Cart_ID)
		REFERENCES Cart(Cart_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
  );


-- Order table

CREATE TABLE IF NOT EXISTS Orders (
  Order_ID INT(10) NOT NULL AUTO_INCREMENT,
  Inventory_ID INT(6)  NULL,
  Cart_ID INT(10)  NULL,
  Rig_ID INT(6) NULL,
	qty INT DEFAULT 1,
  PRIMARY KEY (Order_ID),
  FOREIGN KEy (Inventory_ID)    
    REFERENCES Inventory (Inventory_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (Cart_ID)    
    REFERENCES Cart (Cart_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (Rig_ID)    
    REFERENCES Rig (Rig_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- Card Table

CREATE TABLE IF NOT EXISTS Card (
  Card_no VARCHAR(20) NOT NULL,
  Customer INT(6) NOT NULL,
  Type VARCHAR(5) NOT NULL,
  PRIMARY KEY (Card_no),
  FOREIGN KEY (Customer)    
    REFERENCES Customer (Customer_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- Transacton Table

CREATE TABLE IF NOT EXISTS Transaction (
  Tran_ID INT(6) NOT NULL AUTO_INCREMENT,
  Mode CHAR(3) NOT NULL,
  Payment DECIMAL(10,2) NOT NULL,
  Card_Num VARCHAR(20) NULL,
  Cart_ID INT(10) NOT NULL,
  PRIMARY KEY (Tran_ID),
  FOREIGN KEY (Card_Num)    
    REFERENCES Card (Card_no)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (Cart_ID)    
    REFERENCES Cart (Cart_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- Shipment Table

CREATE TABLE IF NOT EXISTS Shipment (
  Shipment_ID INT(6) NOT NULL AUTO_INCREMENT,
  Customer_ID INT(6) NOT NULL,
  Balance DECIMAL(10,2) NOT NULL,
  Tran_ID INT(6) NOT NULL,
  PRIMARY KEY (Shipment_ID),
  FOREIGN KEY (Customer_ID)    
    REFERENCES Customer (Customer_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (Tran_ID)    
    REFERENCES Transaction (Tran_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- Compatibility Table

CREATE TABLE IF NOT EXISTS Compatibility (
  Product_1 INT(6) NOT NULL,
  Product_2 INT(6) NOT NULL,
  PRIMARY KEY (Product_1, Product_2),
  FOREIGN KEY (Product_1)   
    REFERENCES Products (Product_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (Product_2)   
    REFERENCES Products (Product_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);







INSERT INTO Products VALUES
	("1",
	"Kingston",
	"Kingston FURY Memory -8GB Kit",
	"RAM",
	"{'Frequency speed':'Automatic Overclocking upto 1866MHz','CAS Latency':'CL9-CL11','Voltage':'start as low as 1.35V'}",
	"HyperX HX318C10FWK2/8 is a kit of two 512M x 64-bit (4GB) DDR3-1866 CL10 SDRAM (Synchronous DRAM) 1Rx8 memory modules, based on eight 512M x 8-bit DDR3 FBGA component per module",
	"8255.00");
INSERT INTO Products VALUES
	("2",
	"Corsair",
	"Corsair CMSO8GX3600 8GB Memory",
	"RAM",
	"{'Format':'204 pin DDR3L SODIMM','Speed Rating PC3':'12800 (1600MHz)','Tested Voltage': '1.35V','Latency':'9-9-9-24'}",
	"High-performance vengeance memory for your laptop if you're a serious road warrior or you use your notebook for heavy-duty applications like photo and video editing",
	"4750.00"),

	("3",
	"HyperX",
	"HyperX Fury 16 GB 2133 MHz",
	"RAM",
	"{'Item Weight':'18.1 g',
	'Product Dimensions':'13.3 x 3.1 x 0.3 cm',
	'Item model number':'HX421C14FB/16',
	'RAM Size':'16 GB',
	'Computer Memory Type':	'DDR4 SDRAM',
	'Digital Storage Capacity':'16 GB',
	'Included Components':'1 x 16GB Internal Memory',
	'Voltage':'1.2 Volts',
	'Wattage':'1'}",
	"Hyperx fury ddr4 memory automatically overclocks to the highest frequency published, to deliver instant top-level performance for motherboards with intel's 100 series and x99 chipsets",
	"11400.00");
INSERT INTO Products VALUES
	("4",
	"Transcend",
	"Transcend 16 GB DDR4 2400",
	"RAM",
	"{'Product Dimensions':'7 x 3 x 0.3 cm','Item model number':'TS1GSH64V4B','RAM Size':'8 GB','Computer Memory Type':'DDR4 SDRAM','Voltage':'1.2 Volts','Wattage':'3'}",
	"Laptop Ram that provides error less work, if you wants to work with complex software then this RAM is what you need",
	"12600.00");
INSERT INTO Products VALUES
	("5",
	"Crucial",
	"Crucial 32GB Kit(16GBx2)DDR4",
	"RAM",
	"{'Item Weight':'18.1 g',
	'Product Dimensions':'1.3 x 0.1 x 0.3 cm',
	'Item model number':'CT2K16G4SFD824A',
	'RAM Size':'32 GB',
	'Computer Memory Type':	'DDR4 SDRAM',
	'Included Components':'DDR4 Internal Memory',
	'Voltage':'1.2 Volts',
	'Wattage':'1'}",
	"32gb kit (16GBx2) ddr4 2400 mt/s (PC4-192000) cl17 dr x8 unbuffered sodimm 260pin",
	"14799.00"),
	("6",
	"A-DATA",
	"ADATA PremierDDR4 64GB",
	"RAM",
	"{'Item Weight':'45.4 g',
	'Product Dimensions':'6 x 4 x 0.5 cm',
	'Item model number':'AD4U240038G17-R',
	'RAM Size':'64 GB',
	'Computer Memory Type':	'DDR4 SDRAM',
	'Included Components':'DDR4 Internal Memory',
	'Voltage':'1.2 Volts'}",
	"ADATA Premier DDR4 2400 SO-DIMM memory is the latest upgrade solution that supports Intel's newest platforms for faster data transfer and enhanced power efficiency",
	"21999.00"),
	("7",
	"Gskill",
	"Gskill F4-3000C16D-16GTZR TridentZ",
	"RAM",
	"{'Item Weight':'136 g',
	'Product Dimensions':'13.5 x 0.8 x 4.4 cm',
	'Item model number':'F4-3000C16D-16GTZR',
	'RAM Size':'16 GB',
	'Computer Memory Type':	'DDR4 SDRAM',
	'Included Components':'DDR4 Internal Memory'}",
	"Designed for PC enthusiasts, overclockers, and extreme gamers, the Trident Z series DDR4 is built with specially screened ICs qualified under the legendary G.SKILL selection process, and rigorously tested",
	"11699.00"),
	("8",
	"Ballistix",
	"Ballistix Sport LT BLS4G4D240FSE 8GB DDR4 PC4",
	"RAM",
	"{'Item Weight':'22.7 g',
	'Product Dimensions':'13.3 x 0.6 x 3.3 cm',
	'Item model number':'AD4U240038G17-R',
	'RAM Size':'08 GB',
	'Computer Memory Type':	'DDR4 SDRAM',
	'Included Components':'DDR4 Internal Memory',
	'Voltage':'1.2 Volts',
	'Batteries':'1 Lithium ion batteres required'}",
	"Speed. Style. Sport. Get more out of your memory. Designed for performance enthusiasts, gamers, and anyone who simply wants to get more out of their system, Crucial Ballistix Sport LT DDR4 memory helps you do just that",
	"2299.00"),
	("9",
	"Zebronics",
	"Zebronics ZEB-G31 Socket775",
	"Motherboard",
	"{'Chipset':'Intel� Q33 + ICH7',
	'BIOS':'Supports Plug and Play, Advanced power management',
	'Graphics':'Intel� Graphics Media Accelerator 3100,Pixel Shader 2.0, DirectX 9.0',
	'Audio':'Realtek ALC883 5.1 Channel',
	'LAN':'Realtek� RT8105S Ethernet Controller'}",
	"Zebronics motherboard supports Security Wake On Internet Technology with the onboard Qualcomm Atheros LAN, so you can connect with your PC from anywhere in the world.",
	"2019.00"),
	("10",
	"ASUS",
	"ASUS EX-A320M Gaming AMD Motherboard",
	"Motherboard",
	"{'Item Height':'25 Millimeters',
	'Item Width':'24.4 Centimeters',
	'Item Weight':'948 g',
	'Product Dimensions':'24.4 x 24.4 x 2.5 cm',
	'Item model number':'90MB0VG0-M0EAYM',
	'Processor Socket':'Am4',
	'Computer Memory Type':'DDR4 SDRAM',
	'Number of USB 2.0 Ports':'2'
 	 }",
	"CPU AMD AM4 Socket for AMD Ryzen/ AMD Ryzen 2nd Generation/Ryzen with Radeon Vega Graphics/Ryzen 1st Generation/7th Generation A-series/Athlon X4/Athlon Processors Supports CPU up to 8 cores.",
	"5748.00"),
	("11",
	"Gigabyte",
	"Gigabyte H310M-H HDMI and VGA Port motherboard",
	"Motherboard",
	"{'Item Weight':'540 g',
	'Product Dimensions':'22.6 x 17.4 x 3 cm',
	'Item model number':'H310M H',
	'Computer Memory Type':'DDR4 SDRAM',
	'Processor Count':'1',
	'Number of USB Ports':'7'
 	 }",
	"Exclusive Realtek 8118 Gaming LAN High Speed Gigabit LAN with Automatic Bandwidth Allocation Realtek 8118 LAN is a good performance and friendly network chip for gaming players with automatic bandwidth allocation to ensure the highest network priority of the game or application",
	"4990.00"),
	("12",
	"Asus",
	"ASUS ROG Strix H370-F Gaming LGA1151",
	"Motherboard",
	"{'Item Weight':'499 g',
	'Product Dimensions':'30.5 x 24.4 x 2.5 cm',
	'Item model number':'H310M H',
	'Computer Memory Type':'DDR4 SDRAM',
	'Processor Count':'1',
	'Number of USB Ports':'8',
	'RAM Size':'1TB',
	'Voltage':'12V'
 	 }",
	"ASUS ROG STRIX H370-F GAMING, Intel H370 ATX gaming motherboard with Aura Sync RGB LED lighting, pre-mounted I/O shield, dual M.2, onboard M.2 heatsink, SATA 6Gbps and USB 3.1 Gen 2",
	"14149.00"),
	("13",
	"MSI Gaming",
	"MSI Z170A Gaming M7 Mother Board",
	"Motherboard",
	"{'Item Weight':'1.5 Kg',
	'Product Dimensions':'35 x 30 x 6 cm',
	'Item model number':'7976-001R',
	'Computer Memory Type':'DDR3 SDRAM',
	'Processor Count':'1',
	'Number of USB Ports':'9',
	'RAM Size':'2TB'
 	 }",
	"Supports 6th Gen Intel CoreTM / Pentium/ Celeron processors for LGA 1151 socket,DDR4 Boost: Give your DDR4 memory a performance boost,USB 3.1 Gen2 2X FASTER: USB 3.1 Gen2 offers performance twice as fast as a regular USB 3.0 connection, GAMING LAN with LAN Protect, powered by KillerTM",
	"25026.00"),
	("14",
	"ASRock",
	"ASRock H110M-DVS R3 7th Gen BIOS Motherboard",
	"Motherboard",
	"{'Item Weight'-'721g',
	'Product Dimensions':'28 x 21 x 6.3 cm',
	'Item model number':'H110M',
	'Computer Memory Type':'DDR3 SDRAM'
	 }",
	"{'Supports 7th and 6th Generation Intel� Core� Processors (Socket 1151)',
	'ASRock Super Alloy | Supports DDR4 2133',
	'1 PCIe 3.0 x16, 1 PCIe 2.0 x1 | Graphics Output Options: DVI-D, VGA',
	'7.1 CH HD Audio (Realtek ALC887 Audio Codec), ELNA Audio Caps'}",
	"3299.00"),
	("15",
	"Gigabyte",
	"Gigabyte GA-B250M-D2V ATX Intel Motherboard",
	"Motherboard",
	"{'Item Weight':'299g',
	'Product Dimensions':'24.4 x 4 x 30.5 cm',
	'Item model number':'GA-B250M-D2V',
	'Computer Memory Type':'DDR4 SDRAM',
	'Processor Socket':'Socket 1151',
	'Hardware Interface':'PCIE x 16'
	 }",
	"Supports 7th/ 6th Generation Intel Core Processors Dual Channel Non-ECC Unbuffered DDR4, 2 DIMMs High Quality Audio Capacitors and Audio Noise Guard with LED Trace Path Lighting GbE LAN with cFosSpeed Internet Accelerator Software Smart Fan 5 features Multiple Temperature Sensors",
	"4270.00"),
	("16",
	"MSI Gaming",
	"MSI H110M Pro-VH LGA 1151 Socket Motherboard",
	"Motherboard",
	"{'Item Weight'-'499g',
	'Product Dimensions'-'22.6 x 17.3 x 5 cm',
	'Item model number'-'H110M PRO-VH Plus',
	'Computer Memory Type'-	'DDR4 SDRAM',
	'No. of USB 2.0 Ports':'2'
	 }",
	"MSI introduces DDR4 Boost technology with optimized traces and fully isolated memory circuitry. This design ensures the memory signals stay pure for optimal performance and stability",
	"3365.00"),
	("17",
	"Western Digital",
	"Western Digital SN750 NVMe 250GB SSD",
	"Internal Storage Drives",
	"{'Colour':'Black',
	'Item Height':'2 Millimeters',
	'Item Width':'8 Centimeters',
	'Item Weight':'9.07 g',
	'Product Dimensions':'2.2 x 8 x 0.2 cm',
	'Item model number':'WDS250G3X0C',
	'Number of Lithium Ion Cells':'1',
	'Number of Lithium Metal Cells':'1',
	'Included Components':'Internal SSD'}",
	"The WD BLACK SN750 NVMe SSD delivers top-tier performance for gaming and hardware enthusiasts who are looking to build or upgrade their PC",
	"7280.00"),
	("18",
	"WD Technologies",
	"Western Digital SN750 NVMe 500GB SSD",
	"Internal Storage Drives",
	"{'Colour':'Black',
	'Item Height':'2 Millimeters',
	'Item Width':'8 Centimeters',
	'Item Weight':'9.07 g',
	'Product Dimensions':'2.2 x 8 x 0.2 cm',
	'Item model number':'WDS250G3X0C',
	'Number of Lithium Ion Cells':'1',
	'Number of Lithium Metal Cells':'1',
	'Included Components':'Internal SSD'}",
	"The WD BLACK SN750 NVMe SSD delivers top-tier performance for gaming and hardware enthusiasts who are looking to build or upgrade their PC",
	"10500.00"),
	("19",
	"Seagate",
	"Seagate New BarraCuda ST1000DM010 1TB",
	"Internal Storage Drives",
	"{'Colour':'Silver',
	'Item Height':'20 Millimeters',
	'Item Width':'10.2 Centimeters',
	'Item Weight':'381 g',
	'Product Dimensions':'14.7 x 10.2 x 2 cm',
	'Item model number':'ST1000DM010',
	'Number of Lithium Ion Cells':'1',
	'Computer Memory Type':'EDO DRAM',
	'Included Components':'Internal HDD'}",
	"BarraCuda Cost-effective storage upgrade for laptop or desktop computers Store all your games, music, movies and more with up to 4TB of storage SATA 6Gb/s interface optimizes burst performance",
	"3197.00"),
	("20",
	"TT Global",
	"TT GLOBAL 1TB 2.5' Client Internal HDD",
	"Internal Storage Drives",
	"{'Colour':'Silver',
	'Item Height':'10 Millimeters',
	'Item Width':'7 Centimeters',
	'Item Weight':'118 g',
	'Product Dimensions':'10 x 7 x 1 cm',
	'Item model number':'TTG21000SA-T54',
	'Included Components':'Internal HDD'}",
	"TTGLOBAL Internal Hard Drive mfg by Marshal. High QC leveled product",
	"3599.00");

INSERT INTO Products VALUES
	("21",
	"Western Digital",
	"Western Digital20EZRZ 2TB Internal Hard Drive",
	"Internal Storage Drives",
	"{'Colour':'Blue',
	'Item Height':'26 Millimeters',
	'Item Width':'10.2 Centimeters',
	'Item Weight':'726 g',
	'Product Dimensions':'14.7 x 10.2 x 2.6 cm',
	'Item model number':'WD20EZRZ',
	'Included Components':'Internal HDD',
 	'Computer Memory Type':'DDR3 SDRAM'}",
	"WD expands their award-winning desktop and mobile storage line-up with WD Blue PC hard drives. Extensively tested and built to WD�s high standards,Boost your PC storage with WD Blue drives",
	"4839.00"),
	("22",
	"Samsung",
	"Samsung 860 Evo 500GB SATA III Internal SSD",
	"Internal Storage Drives",
	"{'Colour':'Black',
	'Item Height':'2 Millimeters',
	'Item Width':'8 Centimeters',
	'Item Weight':'90.7 g',
	'Product Dimensions':'10 x 0.7 x 0.7 cm',
	'Item model number':'MZ-76E500BW',
	'Hardware Platform':'SATA 6GB/s',
	'Hard Drive Interface':'Serial ATA-600',
	'Included Components':'Internal SSD,Warranty'}",
	"The newest edition to the world's SATA SSD series, the Samsung 860 EVO. Specially designed for mainstream PCs and laptops, with the latest V-NAND and a robust algorithm-based controller",
	"7965.00"),
	("23",
	"Toshiba",
	"Toshiba 1TB Internal 3.5 Hard Drive SATA",
	"Internal Storage Drives",
	"{'Colour':'Black',
	'Item Height':'14.7 Centimeters',
	'Item Width':'26 Milliimeters',
	'Item Weight':'458 g',
	'Product Dimensions':'10.2 x 2.6 x 14.7 cm',
	'Item model number':'DT01ACA100 / HDKPC03',
	'Hard Drive Interface':'Serial ATA-600',
	'Included Components':'Internal HDD,Warranty'}",
	"Toshiba's DT01ACA series of 7,200 rpm 3.5-inch HDD deliver 1TB of storage capacity. Optimized for use in consumer and commercial desktop computers, All-in-One systems, gaming PCs, external storage",
	"3140.00"),
	("24",
	"Kingston",
	"Kingston SSDNow A400 240GB",
	"Internal Storage Drives",
	"{'Colour':'Gray',
	'Item Weight':'49.9 g',
	'Product Dimensions':'10 x 0.7 x 0.7 cm',
	'Item model number':'SA400S37',
	'Included Components':'Kingston SSDNow A400 240GB SATA 3 Solid State Drive (SA400S37/240GIN)'}",
	"Powered by a latest-gen controller for read and write speeds of up to 500MB/s and 450MB/s, this SSD is 10x faster than a traditional hard drive for higher performance, ultra-responsive multi-tasking and an overall faster system",
	"2520.00"),
	("25",
	"Chiptronex",
	"CHIPTRONEX X310B Mid Tower Gaming Cabinet",
	"CPU Cabinet",
	"{
	'Case with': 'USB 3.0',
	'Item Weight':'3.94 Kg',
	'Package Dimensions':'46.6 x 46.6 x 24.4 cm',
	'Item part number':'X SERIES'}",
	"The Mid tower is excellently styled with a black brushed aluminum effect front panel 1 x SuperSpeed USB3.0 port, 1 x Hi-Speed USB2.0 Port and HD audio ports is an ideal solution for any home user",
	"1954.00"),
	("26",
	"Corsair",
	"Corsair Carbide Series Steel Gaming Case",
	"CPU Cabinet",
	"{'Model Name':'Carbide SPEC-01',
	'Item Weight':'4.81 Kg',
	'Product Dimensions':'47.8 x 19.8 x 42.9 cm',
	'Item model number':'CC-9011050-WW',
	'Hardware Interface':'USB 3.0',
	'Included Components':'1x Carbide Series SPEC-01 Mid-Tower Gaming Case, 1x Accessories Box with Screws, Zip Ties and Other Mounting Hardware, 1x Warranty and Support Information'}",
	"Corsair Carbide Series SPEC-01 Red LED Mid-Tower Gaming Case is proof that great looks, smart design and durable construction. You get aggressive styling, a huge side panel window for admiring your components and an LED-lit front intake fan that draws cool air directly to your graphics cards",
	"3027.00"),
	("27",
	"BBC Gaming",
	"BBC Gaming Cabinet 8804 With 3.0 USB",
	"CPU Cabinet",
	"{'USB Type':'3.0 Usb',
	'Type':'Gaming Heavy Cabinet',
	'Material':'ABS PLASTIC+ STEEL',
	'Item Weight':'5 Kg',
	'Product Dimensions':'54 x 50 x 23.5 cm'}",
	"BBC 8804 is the gaming cabinet its have more space as you can see in the pictures because the hdd fitting choice in the smps place you can see in the pictures",
	"2999.00"),
	("28",
	"Aorus",
	"Aorus Gigabyte AC300W R2 ATX PC Case",
	"CPU Cabinet",
	"{'RGB Fusion':'16.7M Customizable RGB Lighting',
	'Features':'Transparent Full Side Panel Window,Support Vertical and Horizontal VGA Installation,Liquid Cooling Capable',
	'Item Weight':'7.36 Kg',
	'Product Dimensions':'45.8 x 21.1 x 46.9 cm',
	'Included Components':'Cabinet and Manual'}",
	"DETACHABLE DUST FILTER PSU Shroud Design with 16.7m customizable colour options and numerous lighting effects, you could now choose the right scheme for your gaming rig through Aoros Graphics Engine",
	"5899.00"),
	("29",
	"Cooler Master",
	"Cooler Master MasterBox Lite 5 RGB CPU Case",
	"CPU Cabinet",
	"{'Features':'Tempered glass side panel,3 RGB Fans in the front,
	Customizable trim colors - choose from three distinct colors to suit your style, all included in the box,
	Support for 4 fans and water-cooling',
	'Item Size':'4.8 kg',
	'Graphics Card Interface':'PCI-E',
	'Product Dimensions':'47 x 20 x 46 cm'}",
	"The MasterBox Lite 5 RGB is an ATX case and is your straightforward option for your PC build that doesn't ignore good looks, customization or performance. A sleek dark mirror front panel and three custom trim colors (included in the box) offer a great first entry point for customization",
	"6899.00"),
	("30",
	"Circle Gaming",
	"Circle Gaming Elegantor Green ATX Tower Case",
	"CPU Cabinet",
	"{'Material': 'Steel Black Body',
	'External 5.25 Inch Drive Bays': '2',
	'External 3.5 Inch Drive Bays': '2',
	'Internal 3.5 Inch Drive Bays': '2',
	'Item Weight':'5.58 Kg',
	'Product Dimensions':'54 x 53.2 x 22.8 cm'}",
	"FEATURES � Compatible Motherboard: ATX / Micro ATX � Material: Steel Black Body � External 5.25 Inch Drive Bays: 2 � External 3.5 Inch Drive Bays: 2 � Internal 3.5 Inch Drive Bays: 2 � SSD 2.5: 2 � Expansion Slots: 7 � Front Audio Port: 2 HD- Audio � Front USB Port 3.0: 1 � Front USB Port 2.0: 2",
	"3619.00"),
	("31",
	"Circle Gaming",
	"Circle CC 830 Professional Gaming Cabinet",
	"CPU Cabinet",
	"{'Material': 'Steel Black Body',
	'Item Weight':'6.64 Kg',
	'Product Dimensions':'56.4 x 54.2 x 24.8 cm',
	'Item model number':'Circle830-GamingCabinet'}",
	"Redefine your gaming experience with the Circle CC 830 Professional Gaming Cabinet. Get high speed performance and epic efficiency with this cabinet as it is custom built especially for gamers",
	"4810.00"),
	("32",
	"Antec",
	"Antec Mid Tower Cabinet",
	"CPU Cabinet",
	"{'Material': 'SGCC,Plastic',
	'Item Weight':'4.52 Kg',
	'Product Dimensions':'43 x 19 x 46 cm',
	'Form Factor':'ATX'}",
	"The RGB lighting make a sleek and aggressive feeling, Come to show off your gaming build with NX200. Features a full-sized ABS side window panel to show off your components. Ventilated PSU compartment helps keep your power supply cool, yet your cables hidden.",
	"2899.00"),
	("33",
	"Intel",
	"Intel Core i5-8400 BX80684I58400 Processor",
	"Processor",
	"{'Graphics Support':'Intel UHD Graphics 630',
	'Compatibility':'Compatible only with Motherboards based on Intel 300 Series Chipsets',
	'No. of cores and threads':'6 Cores / 12 Threads',
	'Processor speed':'2.80 GHz up to 4.00 GHz Max Turbo Frequency / 9 MB Cache',
	'Intel Optane Memory Supported',
	'Item Weight':'118 g',
	'Product Dimensions':'11.9 x 10.7 x 11.9 cm'}",
	"You will be able to enjoy a fast multimedia experience with this Intel Core i5-8400 processor",
	"18500.00"),
	("34",
	"AMD Technologies",
	"AMD YD2200C5FBBOX 3.7GHz Socket AM4 Processor",
	"Processor",
	"{'Item Height':'8 Millimeters',
	'Item Width':'41 Millimeters',
	'Item Weight':'454 g',
	'Product Dimensions':'4.1 x 4.1 x 0.8 cm',
	'Batteries':'1 Lithium ion batteries required',
	'Item model number':'YD2200C5FBBOX',
	'Processor Brand':'AMD',
	'Processor Speed':'3.7 GHz',
	'Processor Socket':'am4',
	'Processor Count':'4',
	'RAM Size':'8 GB',
	'Computer Memory Type':'DDR4 SDRAM',
	'Wireless Type':'802.11 b/n/ac',
	'Wattage':'65',
	'Hardware Platform':'Windows'
	}",
	"Run your applications at 3.7ghz clock speed on a quad core processor, which belongs to zen+ architecture. Processor is compatible with am4 socket and also support ddr 4 memory with multiplier unlocked",
	"8450.00"),
	("35",
	"Intel",
	"Intel Core i7 9700K Desktop 9th Gen Processor",
	"Processor",
	"{'No. of cores and threads':'8 Cores / 8 Threads',
	'Processor speed':'3.60 GHz up to 4.90 GHz / 12 MB Cache',
	'Compatibility':'Compatible only with Motherboards based on Intel 300 Series Chipsets,Intel Optane Memory Supported',
	'Graphics Supported':'Intel UHD Graphics 630',
	'Item Weight':'45.4 g',
	'Product Dimensions':'11.6 x 10.1 x 7 cm',
	'Item model number':'BX80684I79700K',
	'Processor Socket':'Lga 1151',
	'Processor Count':'8',
	'Computer Memory Type':'DDR4 SDRAM',
	'Wattage':'95',
	'Hardware Platform':'Windows'
	}",
	"9th Gen Intel Core i7-9700K desktop processor with Intel Turbo Boost Technology 2.0 offers powerful performance for gaming, creating and productivity. Thermal solution NOT included in the box. ONLY compatible with 300 series chipset based motherboard",
	"34780.00"),
	("36",
	"Intel",
	"Intel Core i9 9900K Coffee Lake Desktop Processor",
	"Processor",
	"{'No. of cores and threads':'8 Cores / 16 Threads',
	'Processor Speed':'3.60 GHz up to 5.00 GHz / 16 MB Cache',
	'Compatibility':'Compatible only with Motherboards based on Intel 300 Series Chipsets,Intel Optane Memory Supported',
	'Graphics Supported':'Intel UHD Graphics 630',
	'Item Weight':'340 g',
	'Product Dimensions':'7.4 x 11.2 x 11.7 cm',
	'Item model number':'BX80684I99900K',
	'Processor Socket':'Lga 1151',
	'Processor Count':'8',
	'Computer Memory Type':'DDR4 SDRAM',
	'Wattage':'95',
	'Hardware Platform':'Windows'
	}",
	"9th Gen Intel Core i9-9900K desktop processor with Intel Turbo Boost Technology 2.0 offers powerful performance for gaming, creating and productivity. Thermal solution NOT included in the box",
	"53500.00"),
	("37",
	"AMD Technologies",
	"AMD Ryzen 5 2400G Processor",
	"Processor",
	"{'Features':'Built-In Radeon Vega RX 11 Graphics,4 Cores/8 Threads UNLOCKED',
	'Frequency': '3.9 GHz Max Boost',
	'Socket Type': 'AM4',	
	'Thermal Solution': 'Wraith Stealth Cooler',
	'Item Weight':'454 g',
	'Product Dimensions':'4.1 x 4.1 x 0.8 cm',
	'Item model number':'YD2400C5FBBOX',
	'Processor Count':'4',
	'Wireless Type':'802.11 b/n/ac',
	'Computer Memory Type':'DDR4 SDRAM',
	'Wattage':'65',
	'Hardware Platform':'Windows'
	}",
	"AMD YD2400C5FBBOX Ryzen 5 2400G Processor with Radeon RX Vega 11 Graphics",
	"12670.00"),
	("38",
	"AMD Technologies",
	"AMD YD270XBGAFBOX 4.3GHz Socket AM4 Processor",
	"Processor",
	"{'Features':'Dual channel memory,Floatmi technology,
	             Sensmi technology, ryzen master utility',
	'Item Weight':'45.4 g',
	'Product Dimensions':'4.1 x 4.1 x 0.8 cm',
	'Item model number':'YD270XBGAFBOX',
	'Processor Count':'8',
	'Wireless Type':'802.11 b/n/ac',
	'Computer Memory Type':'DDR4 SDRAM',
	'Wattage':'105',
	'Hardware Platform':'Windows',
	'Processor Speed':'4.3 GHz',
	}",
	"Run your applications at 4.3ghz clock speed on a 8 core 16 thread processor, which belongs to zen+ architecture. Processor is compatible with am4 socket and also support ddr 4 memory with multiplier unlocked",
	"29850.00"),
	("39",
	"Intel",
	"Intel Core i5 9400F 9th Generation Processor",
	"Processor",
	"{
	'Item Weight':'340 g',
	'Product Dimensions':'11.6 x 7 x 10.1 cm',
	'Item model number':'BX80684I59400F',
	'Processor Count':'6',
	'Wireless Type':'802.11 b/n/ac',
	'Computer Memory Type':'DDR4 SDRAM',
	'Wattage':'65',
	'Hardware Platform':'Windows',
	'Processor Speed':'4.1 GHz',
	}",
	"Create, edit, and share 4K content with ease, and enjoy immersive, full-screen 4K and 360 experiences.",
	"12889.00"),
	("40",
	"Intel",
	"Intel 8Th Generation I3 8100 3.6GHZ Quad Core",
	"Processor",
	"{'Cores/Threads':'4/4',
	'Item Weight':'249 g',
	'Product Dimensions':'11.6 x 7 x 10.1 cm',
	'Item model number':'BX80684I38100',
	'Processor Count':'4',
	'Wireless Type':'802.11 b/n/ac',
	'Computer Memory Type':'DDR4 SDRAM',
	'Wattage':'65',
	'Hardware Platform':'Windows',
	'Processor Speed':'3.60 GHz Base Frequency/ 6MB Cache',
	}",
	"The 8th Generation Intel Core i3-8100 comes with 4 processing Cores and 4 Threads. That's 2 additional Cores versus the previous generation for more processing power.",
	"11285.00"),
	("41",
	"Asus India",
	"ASUS GeForce GTX1050Ti 4GB Graphics Card",
	"Graphics Cards",
	"{
	'Form Factor':'Plug-in Card',
	'Item Height':'11.2 Centimeters',
	'Item Width':'38 Millimeters',
	'Maximum Display Resolution':'7680 x 4320',
	'Item Weight':'544 g',
	'Product Dimensions':'19.3 x 3.8 x 11.2 cm',
	'Item model number':'PH-GTX1050TI-4G',
	'Processor Count':'1',
	'Graphics Coprocessor':'GeForce GTX 650 Ti',
	'Graphics RAM Type':'GDDR5',
	'Graphics Card Ram Size':'4 GB',
	'Graphics Card Interface':'PCI-E'
	}",
	"ASUS Cerberus GeForce GTX 1050 Ti OC Edition 4GB GDDR5 with rigorous testing for enhanced reliability and performance.",
	"14880.00"),
	("42",
	"MSI Gaming",
	"MSI GAMING GeForce GTX 1060 6GB GDDR5 DirectX 12",
	"Graphics Cards",
	"{'Features':'Virtual reality ready ,4K Display,
	             Dual fans thermal design,Military Class 4 components', 
	'Boost / Base Core Clock':'1759 MHz / 1544 MHz',
	'DisplayPort': '(Version 1.4)' ,
	'HDMI':'(Version 2.0) / DL-DVI-D'}",
	"GeForce GTX graphics cards are the most advanced ever created. Discover unprecedented performance, power efficiency, and next-generation gaming experiences",
	"24449.00"),
	("43",
	"Nvidia Corporation",
	"NVIDIA GTX 1080 Ti Super11GB GDDR5X Graphics Card",
	"Graphics Cards",
	"{'Memory': '11GB Memory Interface 352bit DRAM Type GDDR5X',
	'CUDA Cores':'3584',
	'Graphics Clock':'Base Clock:1556MHz, Boost Clock:1670MHz',
	'Memory Clock':'5500MHz (effective 11000MHz)'}",
	"The Nvidia JetStream series of graphics cards features advanced innovative cooling and an optimized product design to deliver the ultimate gaming performance",
	"75500.00"),
	("44",
	"Nvidia",
	"NVIDIA Titan V Graphics Card",
	"Graphics Cards",
	"{'Architecture':'NVIDIA Volta',
	'Frame Buffer':'12 GB HBM2',
	'Boost Clock':'1455 MHz',
	'Tensor Cores':'640',
	'CUDA Cores':'5120'}",
	"NVIDIA TITAN V is the most powerful graphics card ever created for the PC, driven by the world�s most advanced architecture�NVIDIA Volta. NVIDIA�s supercomputing GPU architecture is now here for your PC, and fueling breakthroughs in every industry",
	"399990.00"),
	("45",
	"Zotac",
	"Zotac Nvidia GT 1030 2GB GDDR5 Graphic card",
	"Graphics Cards",
	"{'CUDA Core' : '384',
	'Memory Clock' : '6.0 Ghz',
	'Memory Bus Width' : '64-bit' ; 'Memory Bandwidth' :'56 GB/s',
	'Supported Technologies':'DirectX12.0,Vulkan1.0,OpenGL4.5,OpenCL1.2,Shader Model5.0'}",
	"64 bit Bus Width - OpenGL 4.5, DirectX 12, Vulkan 1.0, OpenCL 1.2 - 1 x DisplayPort - 1 x HDMIDVI - PC. The new ZOTAC GeForce GT 1030, powered by the award-winning NVIDIA Pascal architecture, accelerates your entire PC experience",
	"6996.00"),
	("46",
	"Galax",
	"GALAX GeForce� RTX 2080Ti 11GB GDDR6 Graphic Card",
	"Graphics Cards",
	"{'Features':'Real-Time Ray Tracing. VR Ready. Game Ready Drivers,NVIDIA GeForce Experience. NVIDIA Ansel. NVIDIA G-SYNC Compatible. NVIDIA Highlights. NVIDIA GPU Boost.',
	'CUDA Cores':'4352',
	'Boost Clock (MHz)':'1545',
	'Model':'28IULBUCT2CK',
	'Item Weight':'1.93 Kg',
	'Product Dimensions':'39 x 25 x 9 cm'
	}",
	"SG for Serious Gaming, dedicated for gamers who are looking for powerful and stable performance. Specially designed with 6 heat pipes to connect the radiator fin and GPU, working along with the GALAX-engineered Triple 80mm fans, making the thermal systems light and effective",
	"105000.00"),
	("47",
	"Galax",
	"GALAX GeForce� RTX 2080 Blower 8GB GDDR6",
	"Graphics Cards",
	"{'Features':'Real-Time Ray Tracing. VR Ready. Game Ready Drivers,NVIDIA GeForce Experience. NVIDIA Ansel. NVIDIA G-SYNC Compatible. NVIDIA Highlights. NVIDIA GPU Boost.',
	'CUDA Cores':'2944',
	'Boost Clock (MHz)':'1710',
	'Model':'RTX 2080 Blower 8GB',
	'Item Weight':'785 g',
	'Product Dimensions':'26.8 x 12.3 x 3.8 cm'
	}",
	"The latest product brings you the economical with high value black design and components. Combined with vapor chamber heatsink and blower type design, the GALAX GeForce GTX 2080 brings effortless cooling performance in a cost effective way",
	"67000.00"),
	("48",
	"Zotac",
	"Zotac GeForce GTX1060 3GB Graphics Card",
	"Graphics Cards",
	"{'Features':'VR ready,Nvidia Ansel,Nvidia GPU Boost 3.0,Nvidia G-Sync,Nvidia GameStream,Vulkan API',
	'CUDA Cores':'1152',
	'Boost Clock (MHz)':'1708',
	'Model':'ZT-P10610A-10L',
	'Item Weight':'1.81 Kg',
	'Product Dimensions':'17.8 x 10.2 x 5.1 cm'
	}",
	"SG for Serious Gaming, dedicated for gamers who are looking for powerful and stable performance. Specially designed with 6 heat pipes to connect the radiator fin and GPU, working along with the GALAX-engineered Triple 80mm fans, making the thermal systems light and effective",
	"13950.00");



INSERT INTO Seller VALUES
	('100001',
	'Santoshi Peripherals',
	'9999345124',
	'A-11, Kasturba Gandhi Marg',
	'New Delhi',
	'DL',
	'110005',
	'4.7',
	'info@santoshigroup.com'),
	('100002',
	'Rajnish Infocom',
	'9911305968',
	'E-52, Worli Road,Andheri West',
	'Mumbai',
	'MH',
	'400002',
	'4.3',
	'pr@rajneesh.com'),
	('100003',
	'Ballistics PC LLP',
	'9810516289',
	'Tower-A, RMZ Infinity, No.-3, Swami Vivekananda Road',
	'Bangalore',
	'KA',
	'560016',
	'4.4',
	'contact@ballistictspc.com'),
	('100004',
	'Cloudtech Corporation',
	'9886967314',
	'4th Floor, Imperia Indiana, Howrah Road',
	'Kolkata',
	'WB',
	'700003',
	'4.2',
	'help@cloudtech.co'),
	('100005',
	'Saluja Computers',
	'9999301124',
	'B-353, MG Marg',
	'Indore',
	'MP',
	'452006',
	'4.5',
	'computers@salujagroup.com'),
	('100006',
	'Cyberhub India',
	'8073957135',
	'Cyber Tower, Industry Lane',
	'Hyderabad',
	'TS',
	'500004',
	'4.1',
	'custompc@cyberco.com');



INSERT INTO Inventory(Seller_ID,Product_ID,Pieces) VALUES
	(100001,1,10),(100001,2,10),(100001,9,10),(100001,10,10),(100001,17,10),(100001,18,10),(100001,25,10),(100001,26,10),(100001,33,10),(100001,34,10),(100001,41,10),(100001,42,10),
	(100002,3,10),(100002,4,10),(100002,11,10),(100002,12,10),(100002,19,10),(100002,20,10),(100002,27,10),(100002,28,10),(100002,35,10),(100002,36,10),(100002,43,10),(100002,44,10),
	(100003,5,10),(100003,6,10),(100003,13,10),(100003,14,10),(100003,21,10),(100003,22,10),(100003,29,10),(100003,30,10),(100003,37,10),(100003,38,10),(100003,45,10),(100003,46,10),
	(100004,7,10),(100004,8,10),(100004,15,10),(100004,16,10),(100004,23,10),(100004,24,10),(100004,31,10),(100004,32,10),(100004,39,10),(100004,40,10),(100004,47,10),(100004,48,10),
	(100005,1,10),(100005,2,10),(100005,9,10),(100005,10,10),(100005,17,10),(100005,18,10),(100005,25,10),(100005,26,10),(100005,33,10),(100005,34,10),(100005,41,10),(100005,42,10),
	(100006,3,10),(100006,4,10),(100006,11,10),(100006,12,10),(100006,19,10),(100006,20,10),(100006,27,10),(100006,28,10),(100006,35,10),(100006,36,10),(100006,43,10),(100006,44,10);


