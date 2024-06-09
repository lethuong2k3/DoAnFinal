CREATE DATABASE QLSKTT
Go
USE QLSKTT
GO
--Tạo bảng
CREATE TABLE BanToChuc
(
    MaBTC INT PRIMARY KEY,
    TenBTC VARCHAR(50) NOT NULL,
    TinhThanh VARCHAR(255) NOT NULL
)

CREATE TABLE SuKienTheThao
(
    MaSuKien INT PRIMARY KEY,
    MaBTC INT,
    TenSuKien VARCHAR(50) NOT NULL,
    NgBatDau SMALLDATETIME NOT NULL,
    NgKetThuc SMALLDATETIME NOT NULL,
    DiaDiem VARCHAR(255) NOT NULL,
    CONSTRAINT FK_SKTT_BTC FOREIGN KEY (MaBTC) REFERENCES BanToChuc(MaBTC)
)

CREATE TABLE HuanLuyenVien
(   
    MaHLV INT PRIMARY KEY,
    TenHLV VARCHAR(50) NOT NULL,
    SDT VARCHAR(20) NOT NULL,
    DiaChi VARCHAR(255) NOT NULL,
    GioiTinh INT NOT NULL
)

CREATE TABLE DoiThiDau
(
    MaDoi INT PRIMARY KEY,
    MaHLV INT,
    TenDoi VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    SoLuongVDV INT NOT NULL,
    SoLuongHuyChuong INT NOT NULL,
    CONSTRAINT FK_DTD_HLV FOREIGN KEY (MaHLV) REFERENCES HuanLuyenVien(MaHLV)
)

CREATE TABLE VanDongVien
(   
    MaVDV INT PRIMARY KEY,
    MaDoi INT,
    HoTen VARCHAR(50) NOT NULL, 
    NgSinh DATE NOT NULL,
    GioiTinh INT NOT NULL,
    DiaChi VARCHAR(255) NOT NULL,
    SDT VARCHAR(20) NOT NULL,
    CONSTRAINT FK_VDV_DTD FOREIGN KEY (MaDoi) REFERENCES DoiThiDau(MaDoi)
)

CREATE TABLE MonTheThao
(
    MaMon INT PRIMARY KEY,
    TenMon VARCHAR(50) NOT NULL,
    MoTa VARCHAR(255) NOT NULL
)

CREATE TABLE NoiDungThiDau
(
    MaND INT PRIMARY KEY,
    MaMon INT,
    TenND VARCHAR(50) NOT NULL,
    ThoiGian SMALLDATETIME NOT NULL,
    DiaDiemThi VARCHAR(255) NOT NULL,
    GhiChu VARCHAR(255),
    CONSTRAINT FK_NDTD_MTT FOREIGN KEY (MaMon) REFERENCES MonTheThao(MaMon)
)

CREATE TABLE NguoiDung
(
    MaKh INT PRIMARY KEY,
    TenKh NVARCHAR(50) NOT NULL,
	taiKhoan VARCHAR(255),
	matKhau VARCHAR(255),
    SDT VARCHAR(20) NOT NULL,
    DiaChi VARCHAR(255) NOT NULL,
    GioiTinh INT NOT NULL,
	vaiTro VARCHAR(255)
)

CREATE TABLE Ve
(  
    MaVe INT PRIMARY KEY,
    MaBTC INT,
    MaKH INT,
	MaSuKien INT,
    LoaiVe VARCHAR(50) NOT NULL,
    GiaVe MONEY NOT NULL,
    NgayMua SMALLDATETIME NOT NULL,
    GhiChu VARCHAR(255),
    CONSTRAINT FK_V_BTC FOREIGN KEY (MaBTC) REFERENCES BanToChuc(MaBTC),
    CONSTRAINT FK_V_KH FOREIGN KEY (MaKH) REFERENCES NguoiDung(MaKH),
	CONSTRAINT FK_V_SKTT FOREIGN KEY (MaSuKien) REFERENCES SuKienTheThao(MaSuKien)
)

CREATE TABLE ThamGia
(
  MaVDV INT,
  MaND INT,
  MaSuKien INT,
  HuyChuong INT NOT NULL,
  PRIMARY KEY(MaVDV, MaND, MaSuKien),
  CONSTRAINT FK_VDV FOREIGN KEY (MaVDV) REFERENCES VanDongVien(MaVDV),
  CONSTRAINT FK_ND FOREIGN KEY (MaND) REFERENCES NoiDungThiDau(MaND),
  CONSTRAINT FK_SKTT FOREIGN KEY (MaSuKien) REFERENCES SuKienTheThao(MaSuKien)
)

--insert into dữ liệu
--Bảng BanToChuc
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1001', N'Ban tổ chức A', N'Hà Nội')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1002', N'Ban tổ chức B', N'Hồ Chí Minh')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1003', N'Ban tổ chức C', N'Đà Nẵng')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1004', N'Ban tổ chức D', N'Hải Phòng')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1005', N'Ban tổ chức E', N'Cần Thơ')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1006', N'Ban tổ chức F', N'Bình Dương')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1007', N'Ban tổ chức G', N'Đồng Nai')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1008', N'Ban tổ chức H', N'Khánh Hòa')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1009', N'Ban tổ chức I', N'Hải Dương')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1010', N'Ban tổ chức K', N'Long An')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1011', N'Ban tổ chức L', N'Tiền Giang')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1012', N'Ban tổ chức M', N'Thừa Thiên Huế')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1013', N'Ban tổ chức N', N'Gia Lai')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1014', N'Ban tổ chức P', N'Bình Thuận')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1015', N'Ban tổ chức Q', N'An Giang')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1016', N'Ban tổ chức R', N'Bà Rịa - Vũng Tàu')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1017', N'Ban tổ chức S', N'Bắc Giang')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1018', N'Ban tổ chức T', N'Bắc Ninh')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1019', N'Ban tổ chức U', N'Bến Tre')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1020', N'Ban tổ chức V', N'Bình Định')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1021', N'Ban tổ chức X', N'Cà Mau')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1022', N'Ban tổ chức Y', N'Hòa Bình')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1023', N'Ban tổ chức Z', N'Đắk Lắk')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1024', N'Ban tổ chức AA', N'Lào Cai')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1025', N'Ban tổ chức AB', N'Lạng Sơn')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1026', N'Ban tổ chức AC', N'Nam Định')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1027', N'Ban tổ chức AD', N'Nghệ An')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1028', N'Ban tổ chức AE', N'Ninh Bình')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1029', N'Ban tổ chức AF', N'Phú Thọ')
insert into BanToChuc (MaBTC, TenBTC, TinhThanh)
values ('1030', N'Ban tổ chức AG', N'Vĩnh Long')
select * from BanToChuc
------------------------------------------------------------------------------
--Bảng SuKien 
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2001', N'Giải vô địch Aikido 2024', '2024-05-09', '2024-05-10', N'Sân vận động Quốc gia Mỹ Đình', '1001')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2002', N'Giải vô địch thể dục thể hình TP.HCM', '2024-03-21','2024-03-23', N'Nhà thi đấu Phú Thọ, TP.HCM', '1003')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2003', N'Giải vô địch Cầu lông Việt Nam 2024', '2024-09-20','2024-09-25', N'Nhà thi đấu Phan Đình Phùng, TP.HCM', '1007')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2004', N'Giải Bóng rổ Sinh viên toàn quốc 2023', '2024-12-04', '2024-12-09', N'Sân Đại học Thể dục thể thao Đà Nẵng', '1002')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2005', N'Giải Wushu toàn quốc', '2024-05-31', '2024-06-02', N'Nhà thi đấu Hà Nội', '1026')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2006', N'Giải vô địch Bắn cung trẻ quốc gia', '2024-07-17', '2024-07-27', N'Trung tâm TDTT quận Gò Vấp', '1015')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2007', N'Giải đấu kiếm Vietnam', '2024-07-01', '2024-07-14', N'Sân vận động Quốc gia, Hồ Chí Minh', '1030')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2008', N'Muay Thái Hạ Long Heritage', '2024-11-03', '2024-11-04', N'Hạ Long, Quảng Ninh', '1013')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2009', N'Giải bóng chày Vũng Tàu', '2024-06-23', '2024-06-25', N'Sân vận động Vũng Tàu City, Bà Rịa - Vũng Tàu', '1024')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2010', N'Giải bóng ném Bình Định', '2024-09-10', '2024-09-15', N'Sân vận động Bình Định, Bình Định', '1019')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2011', N'Giải golf Nha Trang Masters', '2024-08-20', '2024-08-25', N'Sân golf Vinpearl, Nha Trang, Khánh Hòa', '1006')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2012', N'Giải đấu cờ vua Đà Nẵng Challenge', '2024-10-11', '2024-10-12', N'Trung tâm văn hoá Đà Nẵng', '1027')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2013', N'Giải Karate Hà Nội', '2024-04-11', '2024-04-14', N'Khu vực Hồ Gươm, Hà Nội', '1008')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2014', N'Giải đua xe moto Việt Nam Mở rộng', '2024-10-01', '2024-10-05', N'Trung tâm văn hoá Hà Nội', '1029')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2015', N'Giải bơi lội Phan Thiết', '2024-05-04', '2024-05-04', N'Biển Phan Thiết, Bình Thuận', '1012')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2016', N'Giải bóng bàn Hội An', '2024-03-07', '2024-03-17', N'Sân vận động Hội An, Quảng Nam', '1011')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2017', N'Giải Judo Vũng Tàu Cup', '2024-07-28', '2024-07-29', N'Sân vận động Vũng Tàu, Bà Rịa - Vũng Tàu', '1017')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2018', N'Cuộc thi rugby Challenge', '2024-07-06', '2024-07-06', N'Nhà văn hoá sinh viên', '1004')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2019', N'Giải đấu Kickboxing Nha Trang Open','2024-06-14', '2024-06-17', N'Nhà thi đấu Nha Trang, Khánh Hòa', '1022')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2020', N'Taekwondo sinh viên TP.HCM', '2024-08-26', '2024-09-08', N'Sân vận động quân khu 7', '1021')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2021', N'Giải leo núi Sapa', '2024-02-25', '2024-02-25', N'Thị trấn Sapa, Lào Cai', '1016')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2022', N'Giải bóng đá Quốc tế Hà Nội', '2024-06-10', '2024-07-10', N'Sân vận động quốc gia Mỹ Đình', '1023')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2023', N'Giải đua xe đạp Tour de Đà Lạt', '2024-01-20', '2024-01-25', N'Nhà văn hoá thành phố Đà Lạt, Lâm Đồng', '1014')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2024', N'Giải quần vợt Học sinh - Sinh viên Hải Phòng', '2024-03-05', '2024-03-10', N'Sân vận động Lạch Tray, Hải Phòng', '1009')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2025', N'Giải đua thuyền kayak Phú Quốc Challenge', '2024-07-20', '2024-07-25', N'Bãi biển Dương Đông, Phú Quốc, Kiên Giang', '1028')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2026', N'Hội thi đấu vật Huế', '2024-12-20', '2024-12-25', N'Cung điện Hoàng Gia, Huế', '1018')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2027', N'Marathon Đà Nẵng - Đường đua cảng biển', '2026-01-15', '2026-01-15', N'Đường biển Đà Nẵng', '1025')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2028', N'Giải boxing Ninh Bình Classic', '2024-11-05', '2024-11-07', N'Sân vận động Tràng An, Ninh Bình', '1005')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2029', N'Giải bóng chuyền trường Đại học Quốc gia Hà Nội', '2024-02-20', '2024-02-25', N'Sân vận động ĐHQG Hà Nội', '1020')
insert into SuKienTheThao (MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values ('2030', N'Giải đấu cờ tướng quốc tế Hồ Chí Minh', '2024-03-10', '2024-03-15', N'Trung tâm văn hóa Hồ Chí Minh, TP.HCM', '1010')
select * from SuKienTheThao
-----------------------------------------------------
--Bảng HLV
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi)
values ('3001', N'Đỗ Văn Thành', '0982994234', 1, N'77 Đường AB, Quận Thủ Đức')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi)
values ('3002', N'Phạm Ngọc Anh', '0356526743', 0, N'41 Đường XY, Quận 05')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi)
values ('3003', N'Bùi Chí Công', '0887987675', 1, N'12 Đường UV, Quận 01')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi)
values ('3004', N'Trần Gia Lâm', '0909519769', 1, N'34 Đường KN, Quận 08')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi)
values ('3005', N'Lê Thị Vy', '0398457432', 0, N'22 Đường BG, Quận 11')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi)
values ('3006', N'Đặng Hữu Nhân', '0675866567', 1, N'71 Đường JK, Quận 03')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3007', N'Nguyễn Văn A', '0123456789', 1, N'123 Đường ABC, Quận XYZ')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3008', N'Trần Thị B', '0987654321', 0, N'456 Đường DEF, Quận UVW')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3009', N'Lê Văn C', '0369847123', 1, N'789 Đường GHI, Quận MNO')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3010', N'Phạm Thị D', '0543217896', 0, N'101 Đường JKL, Quận PQR')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3011', N'Hoàng Văn E', '0632145987', 1, N'202 Đường STU, Quận WXY')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3012', N'Vũ Thị F', '0874963215', 0, N'303 Đường VWX, Quận YZA')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3013', N'Đặng Văn G', '0918273645', 1, N'404 Đường YZA, Quận BCD')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3014', N'Nguyễn Thị H', '0567348291', 0, N'505 Đường CDE, Quận EG')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3015', N'Trần Văn I', '0981726354', 1, N'606 Đường GHI, Quận HIJ')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3016', N'Lê Thị K', '0365987412', 0, N'707 Đường JKL, Quận KLM')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3017', N'Phạm Văn L', '0123876549', 1, N'808 Đường MNO, Quận NOP')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3018', N'Hoàng Thị M', '0987654312', 0, N'909 Đường PQR, Quận QRS')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3019', N'Vũ Văn N', '0654321987', 1, N'1010 Đường STU, Quận TUV')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3020', N'Đặng Thị O', '0897412365', 0, N'1111 Đường VX, Quận WY')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3021', N'Nguyễn Văn P', '0765432189', 1, N'1212 Đường ZA, Quận XZ')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3022', N'Trần Thị Q', '0958746213', 0, N'1313 Đường BCD, Quận CDE')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3023', N'Lê Văn R', '0612398745', 1, N'1414 Đường DF, Quận EFG')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3024', N'Phạm Thị S', '0874521963', 0, N'1515 Đường HI, Quận HIJ')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3025', N'Hoàng Văn T', '0987456123', 1, N'1616 Đường JL, Quận KL')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3026', N'Vũ Thị U', '0321456987', 0, N'1717 Đường MNO, Quận NOP')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3027', N'Đặng Văn V', '0679812345', 1, N'1818 Đường PQR, Quận QRS')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3028', N'Nguyễn Thị W', '0981234567', 0, N'1919 Đường STU, Quận TUV')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3029', N'Phạm Thị Y', '0909090909', 0, N'2121 Đường XY, Quận ABC')
insert into HuanLuyenVien(MaHLV, TenHLV, SDT, GioiTinh, DiaChi) 
values ('3030', N'Hoàng Văn Z', '0123456780', 1, N'2222 Đường DF, Quận GHI')
select * from HuanLuyenVien
------------------------------------------------------------------------------
--Bảng VĐV
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
values ('4001', N'Nguyễn Văn Toàn', '1998-02-13', 1, N'11 Đường 012, Quận 12', '0345445544', '5004')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
values ('4002', N'Mai Hoàng Bảo Yến', '1989-06-30', 0, N'40 Đường AV, Quận 05', '0905004487', '5001')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
values ('4003', N'Đỗ Thị Minh Thư', '1990-09-09', 0, N'09 Đường TV, Quận 09', '0389561215', '5013')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
values ('4004', N'Huỳnh Thanh Tâm', '1984-04-17', 1, N'67 Đường AC, Quận 07', '0987654123', '5022')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
values ('4005', N'Vũ Văn Long', '1995-01-20', 1, N'22 Đường KH, Quận 10', '0312777409', '5004')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
values ('4006', N'Lê Bá Khánh Duy', '1998-09-14', 1, N'11 Đường NB, Quận 02', '0998674598', '5003')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4007', N'Nguyễn Thanh A', '1999-09-01', 1, N'113 Đường AFC, Quận XYZ', '0908090809', '5023' )
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4008', N'Lý Thị B', '1987-12-01', 0, N'088 Đường DEF, Quận UVW', '0987652521', '5025')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4009', N'Phạm Hồng C', '1989-03-13', 1, N'120 Đường GHI, Quận MNO', '0389747123', '5001')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4010', N'Phạm Thiên D', '1990-08-23', 0, N'824 Đường JKL, Quận PQR', '0543217101', '5015')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4011', N'Trần Văn E', '1981-02-07', 1, N'833 Đường STU, Quận WXY', '0612125987', '5019')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4012', N'Trương Thị F', '1982-07-21', 0, N'555 Đường VWX, Quận YZA', '0987563215', '5012')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4013', N'Đặng Chí G', '1997-04-29', 1, N'613 Đường YZA, Quận BCD', '0918271296', '5005')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4014', N'Đỗ Thị H', '1997-11-18', 0, N'153 Đường CDE, Quận EFG', '0567319051', '5020')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4015', N'Trần Quốc I', '1992-08-26', 1, N'167 Đường GHI, Quận HIJ', '0812326354', '5022')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4016', N'Phan Thị K', '1991-01-20', 0, N'107 Đường JKL, Quận KLM', '0367854412', '5017')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4017', N'Đào Văn L', '1996-04-21', 1, N'088 Đường MNO, Quận NOP', '0123628149', '5008')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4018', N'Hoàng Thanh M', '1998-06-22', 1, N'623 Đường PQR, Quận QRS', '0988884312', '5006')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4019', N'Trịnh Văn N', '1999-05-02', 1, N'136 Đường STU, Quận TUV', '0610721987', '5013')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4020', N'Lê Thị O', '1999-09-18', 0, N'1141 Đường VWX, Quận WXY', '0897973565', '5011')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4021', N'Võ Thị P', '1988-10-08', 0, N'204 Đường JKL, Quận MNO', '0984832189', '5024')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4022', N'Phạm Thị Q', '1982-04-30', 0, N'402 Đường HPI, Quận MVE', '0231238671', '5030')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4023', N'Mai Thanh S', '1997-10-12', 1, N'276 Đường TYE, Quận TUO', '0988960721', '5014')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4024', N'Vũ Phước T', '1990-09-21', 1, N'450 Đường ASC, Quận IUQ', '0912532122', '5023')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4025', N'Lê Bảo R', '1983-06-19', 0, N'2033, Đường OPL, Quận MNO', '0469732171', '5016')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4026', N'Phạm Nhật U', '1987-03-09', 1, N'744 Đường JKL, Quận MUI', '0984709671', '5004')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4027', N'Võ Ngọc V', '1980-02-29', 0, N'98 Đường ABC, Quận SRT', '0984122521', '5010')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4028', N'Huỳnh Mạnh X', '1995-01-09', 1, N'173 Đường OPQ, Quận VOX', '0987890361', '5023')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4029', N'Lâm Thanh P', '1992-11-25', 1, N'28 Đường UTN, Quận MNO', '0903816931', '5012')
insert into VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES ('4030', N'Trần Ngọc W', '1985-10-05', 0, N'44 Đường JKL, Quận ERW', '0984727544', '5017')
select * from VanDongVien
-------------------------------------------------------
--Bảng DoiThiDau
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5001', N'Đội thi Đồng Tháp', 'dongthap@gmail.com', 8, 5, '3007')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5002', N'Đội thi Cần Thơ', 'cantho@gmail.com', 10, 3, '3004')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5003', N'Đội thi Sài Gòn', 'tphcm@gmail.com', 8, 4, '3021')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5004', N'Đội thi Phú Yên', 'phuyen@gmail.com', 7, 0, '3013')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5005', N'Đội thi Hà Nội', 'hanoi@gmail.com', 11, 7, '3022')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5006', N'Đội thi Nha Trang', 'nhatrang@gmail.com', 14, 4, '3006')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5007', N'Đội thi HX', 'hx@gmail.com', 14, 6, '3025')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5008', N'Đội thi UU', 'uu@gmail.com', 13, 7, '3016')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5009', N'Đội thi RT', 'rt@gmail.com', 14, 10, '3005')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5010', N'Đội thi YU','yu@gmail.com', 11, 5, '3024')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5011', N'Đội thi JT', 'jt@gmail.com', 10, 0, '3014')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5012', N'Đội thi AY', 'ay@gmail.com', 14, 1, '3011')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5013', N'Đội thi MF', 'mf@gmail.com', 14, 8, '3018')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5014', N'Đội thi ER', 'er@gmail.com', 12, 9, '3017')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5015',N'Đội thi YT', 'yt@gmail.com', 10, 0, '3029')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5016', N'Đội thi UY', 'uy@gmail.com', 14, 4, '3030')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5017', N'Đội thi SH', 'sh@gmail.com', 10, 4, '3012')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5018', N'Đội thi ND', 'nd@gmail.com', 12, 5, '3020')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5019', N'Đội thi CM', 'cm@gmail.com', 14, 5, '3009')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5020', N'Đội thi TY', 'ty@gmail.com', 11, 7, '3023')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5021', N'Đội thi HT', 'ht@gmail.com', 15, 4, '3015')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5022', N'Đội thi DT', 'dt@gmail.com', 12, 5, '3001')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5023', N'Đội thi BG', 'bg@gmail.com', 6, 3, '3027')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5024', N'Đội thi VT', 'vt@gmail.com', 14, 9, '3008')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5025', N'Đội thi BC', 'bc@gmail.com', 12, 4, '3010')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5026', N'Đội thi AB', 'ab@gmail.com', 13, 8, '3028')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5027', N'Đội thi MN', 'mn@gmail.com', 14, 2, '3002')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5028', N'Đội thi NT', 'nt@gmail.com', 9, 4, '3003')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5029', N'Đội thi EU', 'eu@gmail.com', 10, 1, '3019')
insert into DoiThiDau (MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values ('5030', N'Đội thi XY', 'xy@gmail.com', 14, 4, '3026')
select * from DoiThiDau
---------------------------------------------------------
--Bảng MonTheThao
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7001', N'Thể dục thể hình', N'Môn cải thiện sức khoẻ và hình dáng cơ thể')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7002', N'Đua xe moto', N'Môn thể thao tốc độ cao')
 insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7003', N'Quần vợt', N'Môn sử dụng vợt để đánh bóng')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7004', N'Đấu vật', N'Môn thể thao đối kháng')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7005', N'Bóng ném', N'Môn sử dụng bóng để ném vào mục tiêu')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7006', N'Bắn cung', N'Môn sử dụng cung để bắn các mũi tên vào mục tiêu')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7007', N'Judo', N'Môn võ thuật tiếng Nhật sử dụng kỹ thuật chiến đấu')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7008', N'Đua xe đạp', N'Môn thể thao địa hình')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7009', N'Kickboxing', N'Môn võ thuật đối kháng, kết hợp đấm và đá')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7010', N'Boxing', N'Môn võ thuật đối kháng, sử dụng đấm')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7011', N'Bóng rổ', N'Môn sử dụng bóng để ném vào rổ')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7012', N'Bơi lội', N'Môn thể thao dưới nước')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7013', N'Bóng bàn', N'Môn sử dụng bóng để đánh trên bàn')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7014', N'Cờ vua', N'Môn thể thao tri thức')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7015', N'Leo núi', N'Môn thể thao mạo hiểm')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7016', N'Marathon', N'Môn thể thao sử dụng tốc độ của đôi chân')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7017', N'Đấu kiếm', N'Môn võ thuật sử dụng kiếm')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7018', N'Bóng đá', N'Môn thể thao sử dụng lực sút bóng')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7019', N'Cầu lông', N'Môn sử dụng vợt để đánh cầu')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7020', N'Golf', N'Môn thể thao đưa bóng vào lỗ')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7021', N'Bóng chuyền', N'Môn thể thao đánh bóng qua lưới')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7022', N'Cờ tướng', N'Môn thể thao tri thức')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7023', N'Taekwondo', N'Môn thể thao võ thuật của Hàn Quốc')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7024', N'Bóng chày', N'Môn thể thao đánh bóng')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7025', N'Đua thuyền', N'Môn thể thao đồng đội trên nước')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7026', N'Karate', N'Môn thể thao võ thuật của Nhật Bản')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7027', N'Wushu', N'Môn thể thao võ thuật của Trung Quốc')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7028', N'Muay Thái', N'Môn thể thao võ thuật')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7029', N'Rugby', N'Môn thể thao sử dụng trí óc')
insert into MonTheThao(MaMon,TenMon,MoTa)
values ('7030', N'Aikido', N'Môn võ thuật của Nhật Bản')
select * from MonTheThao
------------------------------------------------------------------
--Bảng NoiDungThiDau 
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6001', N'Vòng bảng chung kết', '2024-03-22', N'Nhà thi đấu Phú Thọ, TP.HCM', N'Lịch thi đấu có thể thay đổi', '7001')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6002', N'Vòng Bán kết cấp Thành phố', '2024-06-15', N'Nhà thi đấu Quân khu 7', N'Lịch thi đấu có thể thay đổi', '7009')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6003', N'Vòng đấu loại trừ', '2024-11-06', N'Sân vận động Tràng An, Ninh Bình', N'Lịch thi đấu có thể thay đổi', '7010')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6004', N'Vòng Chung kết toàn quốc', '2024-05-10', N'Sân vận động Quốc gia Mỹ Đình', N'Lịch thi đấu có thể thay đổi', '7030')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6005', N'Vòng chung kết', '2024-07-06', N'Nhà văn hoá sinh viên', N'Lịch thi có thể thay đổi', '7029')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6006', N'Vòng đấu trực tiếp lần 1', '2024-06-01', N'Nhà thi đấu Hà Nội', N'Lịch thi có thể thay đổi', '7027')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6007', N'Vòng loại trực tiếp lần 2', '2024-07-13', N'Sân vận động Quốc gia, Hồ Chí Minh', N'Lịch thi có thể thay đổi', '7017')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6008', N'Vòng bán kết lần 1', '2024-06-24', N'Sân vận động Vũng Tàu City, Bà Rịa - Vũng Tàu', N'Lịch thi có thể thay đổi', '7024')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6009', N'Vòng loại trực tiếp lần 1', '2024-01-21', N'Nhà văn hoá thành phố Đà Lạt, Lâm Đồng', N'Lịch thi có thể thay đổi', '7008')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6010', N'Vòng chung kết lần 1', '2024-10-04', N'Trung tâm văn hoá Hà Nội', N'Lịch thi có thể thay đổi', '7002')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6011', N'Vòng loại trực tiếp lần 1', '2024-09-11', N'Sân vận động Bình Định, Bình Định', N'Lịch thi có thể thay đổ', '7005')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6012', N'Vòng bán kết 1', '2024-09-21', N'Nhà thi đấu Phan Đình Phùng, TP.HCM', N'Lịch thi có thể thay đổi', '7019')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6013', N'Vòng loại trực tiếp', '2024-07-28', N'Sân vận động Vũng Tàu, Bà Rịa - Vũng Tàu', N'Lịch thi có thể thay đổi', '7007')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6014', N'Vòng thi đấu quyết định', '2024-04-13', N'Khu vực Hồ Gươm, Hà Nội', N'Lịch thi có thể thay đổi', '7026')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6015', N'Vòng loại trực tiếp lần 1', '2024-03-14', N'Trung tâm văn hóa Hồ Chí Minh, TP.HCM', N'Lịch thi có thể thay đổi', '7022')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6016', N'Vòng loại trực tiếp lần 1', '2024-02-24', N'Sân vận động Đại học Quốc gia Hà Nội', N'Lịch thi có thể thay đổi', '7021')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6017', N'Vòng loại trực tiếp lần 1', '2024-08-21', N'Sân golf Vinpearl, Nha Trang, Khánh Hòa', N'Lịch thi có thể thay đổi', '7020')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6018', N'Hội thi trực tiếp', '2024-11-03', N'Hạ Long, Quảng Ninh', N'Lịch thi có thể thay đổi', '7028')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6019', N'Vòng loại trực tiếp lần 1', '2024-02-25', N'Thị trấn Sapa, Lào Cai', N'Lịch thi có thể thay đổi', '7015')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6020', N'Vòng đấu trực tiếp lần 1', '2024-12-24', N'Cung điện Hoàng Gia, Huế', N'Lịch thi có thể thay đổi', '7004')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6021', N'Vòng loại trực tiếp lần 1', '2024-06-24', N'Sân vận động quốc gia Mỹ Đình', N'Lịch thi có thể thay đổi', '7018')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6022', N'Vòng chung kết lần 1', '2024-04-13', N'Khu vực Hồ Gươm, Hà Nội', N'Lịch thi có thể thay đổi', '7016')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6023', N'Vòng đấu trực tiếp lần 1', '2024-07-21', N'Bãi biển Dương Đông, Phú Quốc, Kiên Giang', N'Lịch thi có thể thay đổi', '7025')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6024', N'Vòng loại trực tiếp lần 4', '2024-03-06', N'Sân vận động Lạch Tray, Hải Phòng', N'Lịch thi có thể thay đổi', '7003')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6025', N'Vòng loại trực tiếp lần 2', '2024-12-05', N'Sân Đại học Thể dục thể thao Đà Nẵng', N'Lịch thi có thể thay đổi', '7011')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6026', N'Vòng loại trực tiếp lần 1', '2024-03-09', N'Sân vận động Hội An, Quảng Nam', N'Lịch thi có thể thay đổi', '7013')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6027', N'Vòng loại trực tiếp lần 3', '2024-09-01', N'Sân vận động quân khu 7', N'Lịch thi có thể thay đổi', '7023')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6028', N'Vòng bán kết lần 1', '2024-10-12', N'Trung tâm văn hoá Hà Nội', N'Lịch thi có thể thay đổi', '7014')
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6029', N'Vòng loại trực tiếp lần 3', '2024-04-05', N'Biển Phan Thiết, Bình Thuận', N'Đại hội không thi đấu 800m tự do nam và 1500m tự do nữ', '7012') 
insert into NoiDungThiDau (MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values ('6030', N'Vòng chung kết trực tiếp lần 1', '2024-07-20', N'Trung tâm TDTT quận Gò Vấp', N'Lịch thi có thể thay đổi', '7006')
select * from NoiDungThiDau
--------------------------------------------------------------
INSERT INTO NguoiDung (MaKh, TenKh, taiKhoan, matKhau, SDT, DiaChi, GioiTinh, vaiTro)
VALUES (8001, N'Phan Tuan Minh', 'minh', '$2a$10$cRxxj5bEkdoOdxGbU3VRGuYozJ.6H5JAS6Vd5ADrR5tf5Wde5qNVK', '0909678411', N'Quận 01, TP.HCM', 0, 'admin'),
       (8002, N'Trần Hồng Thanh', 'tran.thanh', 'password123', '0671345124', N'Quận 09, TP.HCM', 1, 'user'),
       (8003, N'Phạm Chí Hải', 'pham.hai', 'password123', '0878565133', N'Quận Bình Tân, TP.HCM', 1, 'user'),
       (8004, N'Phạm Minh Phương', 'pham.phuong', 'password123', '0263435142', N'Quận 04, TP.HCM', 0, 'user'),
       (8005, N'Lâm Quốc Huy', 'lam.huy', 'password123', '0467393309', N'Quận Phú Nhuận, TP.HCM', 1, 'user'),
       (8006, N'Phan Như Ý', 'phan.y', 'password123', '0987849678', N'Quận 12, TP.HCM', 0, 'user'),
       (8007, N'Mai Lâm A', 'mai.a', 'password123', '0121167678', N'Quận Bình Thạnh, TP.HCM', 1, 'user'),
       (8008, N'Đào Ngọc B', 'dao.b', 'password123', '0987872645', N'Quận 11, TP.HCM', 0, 'user'),
       (8009, N'Trần Hữu C', 'tran.c', 'password123', '078787696', N'Quận 08, TP.HCM', 1, 'user'),
       (8010, N'Đặng Quốc D', 'dang.d', 'password123', '0911245678', N'Quận 09, TP.HCM', 1, 'user'),
       (8011, N'Phan Thảo E', 'phan.e', 'password123', '0545119678', N'Quận 11, TP.HCM', 0, 'user'),
       (8012, N'Huỳnh Thị F', 'huynh.f', 'password123', '0931116788', N'Quận 10, TP.HCM', 0, 'user'),
       (8013, N'Trịnh Chí G', 'trinh.g', 'password123', '0781889678', N'Quận 05, TP.HCM', 1, 'user'),
       (8014, N'Mai Gia H', 'mai.h', 'password123', '0987145611', N'Quận 02, TP.HCM', 0, 'user'),
       (8015, N'Phan Bảo K', 'phan.k', 'password123', '0987612378', N'Quận 11, TP.HCM', 1, 'user'),
       (8016, N'Đào Giang L', 'dao.l', 'password123', '0234511078', N'Quận Bình Tân, TP.HCM', 0, 'user'),
       (8017, N'Lê Ngọc M', 'le.m', 'password123', '0451287468', N'Quận 03, TP.HCM', 0, 'user'),
       (8018, N'Trần Thanh N', 'tran.n', 'password123', '0528909678', N'Quận Phú Nhuận, TP.HCM', 1, 'user'),
       (8019, N'Lâm Xuân O', 'lam.o', 'password123', '0982224512', N'Quận 11, TP.HCM', 1, 'user'),
       (8020, N'Phạm Diệu P', 'pham.p', 'password123', '0886145678', N'Quận 07, TP.HCM', 0, 'user'),
       (8021, N'Lê Quỳnh Q', 'le.q', 'password123', '0551099678', N'Quận Bình Thạnh, TP.HCM', 0, 'user'),
       (8022, N'Trần Gia R', 'tran.r', 'password123', '0756549678', N'Quận 11, TP.HCM', 1, 'user'),
       (8023, N'Bùi Quang S', 'bui.s', 'password123', '0909239678', N'Quận 01, TP.HCM', 1, 'user'),
       (8024, N'Mai Như T', 'mai.t', 'password123', '0232109678', N'Quận Tân Phú, TP.HCM', 0, 'user'),
       (8025, N'Hà Anh U', 'ha.u', 'password123', '0120909678', N'Quận 06, TP.HCM', 1, 'user'),
       (8026, N'Đỗ Nhật V', 'do.v', 'password123', '0563098678', N'Quận 08, TP.HCM', 1, 'user'),
       (8027, N'Thái Như W', 'thai.w', 'password123', '0411819678', N'Quận Tân Bình, TP.HCM', 0, 'user'),
       (8028, N'Lê Thị Z', 'le.z', 'password123', '0660723678', N'Quận 11, TP.HCM', 0, 'user'),
       (8029, N'Trần Quang X', 'tran.x', 'password123', '0767788996', N'Quận 07, TP.HCM', 1, 'user'),
       (8030, N'Huỳnh Quế A', 'huynh.a', 'password123', '0122689698', N'Quận 09, TP.HCM', 0, 'user');

-- Select all data from the NguoiDung table
SELECT * FROM NguoiDung;
---------------------------------------------------------------------
--Bảng Ve
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9001', 'VIP', '500.000', '2024-05-01', N'Vé đặc biệt', '2001', '1001', '8004')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9002', 'Cat1', '100.000', '2024-07-15', N'Vé thường', '2006', '1015', '8001')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9003', 'PLatinum', '300.000', '2024-09-26', N'Vé đặc biệt', '2014', '1029', '8023')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9004', 'PLatinum', '400.000', '2024-04-09', N'Vé đặc biệt', '2013', '1008', '8016')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9005', 'Cat2', '100.000', '2024-03-19', N'Vé thường', '2002', '1003', '8009')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9006', 'VIP', '600.000', '2024-05-20', N'Vé đặc biệt', '2005', '1026', '8017')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9007', 'Cat3', '100.000', '2024-12-01', N'Vé thường', '2004', '1002', '8012')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9008', 'PLatinum', '300.000', '2024-06-01', N'Vé đặc biệt', '2022', '1023', '8030')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9009', 'Cat1', '100.000', '2024-08-15', N'Vé thường', '2011', '1006', '8013')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9010', 'VIP', '500.000', '2024-03-05', N'Vé đặc biệt', '2016', '1011', '8019')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9011', 'PLatinum', '300.000', '2024-02-18', N'Vé đặc biệt', '2029', '1020', '8027')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9012', 'Cat3', '100.000', '2024-10-10', N'Vé thường', '2012', '1027', '8018')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9013', 'PLatinum', '300.000', '2024-11-01', N'Vé đặc biệt', '2008', '1013', '8021')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9014', 'Cat2', '100.000', '2024-03-03', N'Vé thường', '2024', '1009', '8011')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9015', 'VIP', '500.000', '2024-05-01', N'Vé đặc biệt', '2015', '1012', '8008')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9016', 'PLatinum', '300.000', '2024-06-29', N'Vé đặc biệt', '2007', '1030', '8003')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9017', 'Cat1', '100.000', '2024-06-20', N'Vé thường', '2009', '1024', '8002')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9018', 'PLatinum', '300.000', '2024-07-25', N'Vé đặc biệt', '2017', '1017', '8007')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9019', 'Cat2', '100.000', '2024-06-12', N'Vé thường', '2019', '1022', '8024')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9020', 'PLatinum', '300.000', '2024-07-03', N'Vé đặc biệt', '2018', '1004', '8014')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9021', 'Cat3', '100.000', '2024-08-20', N'Vé thường', '2020', '1021', '8022')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9022', 'VIP', '500.000', '2024-02-23', N'Vé đặc biệt', '2021', '1016', '8015')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9023', 'PLatinum', '300.000', '2024-01-18', N'Vé đặc biệt', '2023', '1014', '8020')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9024', 'Cat2', '100.000', '2024-09-08', N'Vé thường', '2010', '1019', '8028')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9025', 'PLatinum', '300.000', '2024-07-15', N'Vé đặc biệt', '2025', '1028', '8025')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9026', 'Cat1', '100.000', '2024-01-13', N'Vé thường', '2027', '1025', '8029')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9027', 'PLatinum', '300.000', '2024-03-08', N'Vé đặc biệt', '2030', '1010', '8005')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9028', 'VIP', '500.000', '2024-12-17', N'Vé đặc biệt', '2026', '1018', '8026')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9029', 'Cat2', '100.000', '2024-11-02', N'Vé thường', '2028', '1005', '8006')
Insert into Ve (MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('9030', 'PLatinum', '300.000', '2024-09-15', N'Vé đặc biệt', '2003', '1007', '8010')
select * from Ve
-------------------------------------------
--Bảng ThamGia
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4001', '6005', '2018', 3)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4002', '6028', '2012', 2)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4003','6017', '2011', 1)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4004', '6009', '2023', 2)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4005', '6012', '2003', 0)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4006', '6018', '2008', 2)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4007', '6003', '2028', 3)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4008', '6007', '2007', 1)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4009', '6015', '2030', 2)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4010', '6026', '2016', 0)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4011', '6014', '2013', 2)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4012', '6004', '2001', 1)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4013', '6001', '2002', 3)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4014', '6008', '2009', 1)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4015', '6019', '2021', 2)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4016', '6030', '2006', 3)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4017', '6027', '2020', 1)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4018', '6016', '2029', 2)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4019', '6011', '2010', 3)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4020', '6002', '2019', 0)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4021', '6006', '2005', 2)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4022', '6029', '2015', 1)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4023', '6020', '2026', 3)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4024', '6013', '2017', 2)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4025', '6024', '2024', 1)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4026', '6021', '2022', 3)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4027', '6023', '2025', 3)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4028', '6025', '2004', 2)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4029', '6022', '2027', 3)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values ('4030', '6010', '2014', 1)
select * from ThamGia
