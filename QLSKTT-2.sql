CREATE DATABASE QLSKTT
Go
USE QLSKTT
GO
--Tạo các bảng
CREATE TABLE BanToChuc
(
    MaBTC INT identity(1,1) PRIMARY KEY,
    TenBTC NVARCHAR(50) NOT NULL,
    TinhThanh NVARCHAR(255) NOT NULL
)
	
Select * from SuKienTheThao

Select * from Ve join SuKienTheThao on SuKienTheThao.MaSuKien = Ve.MaSuKien

CREATE TABLE SuKienTheThao
(
    MaSuKien INT identity(1,1) PRIMARY KEY,
    MaBTC INT,
    TenSuKien NVARCHAR(50) NOT NULL,
    NgBatDau SMALLDATETIME NOT NULL,
    NgKetThuc SMALLDATETIME NOT NULL,
    DiaDiem NVARCHAR(255) NOT NULL,
    CONSTRAINT FK_SKTT_BTC FOREIGN KEY (MaBTC) REFERENCES BanToChuc(MaBTC)
)

CREATE TABLE HuanLuyenVien
(   
    MaHLV INT identity(1,1) PRIMARY KEY,
    TenHLV NVARCHAR(50) NOT NULL,
    SDT NVARCHAR(20) NOT NULL,
    DiaChi NVARCHAR(255) NOT NULL,
    GioiTinh INT NOT NULL
)

CREATE TABLE DoiThiDau
(
    MaDoi INT identity(1,1) PRIMARY KEY,
    MaHLV INT,
    TenDoi NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) NOT NULL UNIQUE,
    SoLuongVDV INT NOT NULL,
    SoLuongHuyChuong INT NOT NULL,
    CONSTRAINT FK_DTD_HLV FOREIGN KEY (MaHLV) REFERENCES HuanLuyenVien(MaHLV)
)

CREATE TABLE VanDongVien
(   
    MaVDV INT identity(1,1) PRIMARY KEY,
    MaDoi INT,
    HoTen NVARCHAR(50) NOT NULL, 
    NgSinh DATE NOT NULL,
    GioiTinh INT NOT NULL,
    DiaChi NVARCHAR(255) NOT NULL,
    SDT VARCHAR(20) NOT NULL,
    CONSTRAINT FK_VDV_DTD FOREIGN KEY (MaDoi) REFERENCES DoiThiDau(MaDoi)
)

CREATE TABLE MonTheThao
(
    MaMon INT identity(1,1) PRIMARY KEY,
    TenMon NVARCHAR(50) NOT NULL,
    MoTa NVARCHAR(255) NOT NULL
)

CREATE TABLE NoiDungThiDau
(
    MaND INT identity(1,1) PRIMARY KEY,
    MaMon INT,
    TenND NVARCHAR(50) NOT NULL,
    ThoiGian SMALLDATETIME NOT NULL,
    DiaDiemThi NVARCHAR(255) NOT NULL,
    GhiChu NVARCHAR(255),
    CONSTRAINT FK_NDTD_MTT FOREIGN KEY (MaMon) REFERENCES MonTheThao(MaMon)
)

CREATE TABLE NguoiDung
(
    MaKh INT identity(1,1) PRIMARY KEY,
    TenKh NVARCHAR(50) NOT NULL,
	taiKhoan VARCHAR(255),
	matKhau VARCHAR(255),
    SDT NVARCHAR(20) NOT NULL,
    DiaChi NVARCHAR(255) NOT NULL,
    GioiTinh INT NOT NULL,
	vaiTro VARCHAR(255)
)

CREATE TABLE Ve
(  
    MaVe INT identity(1,1) PRIMARY KEY,
    MaBTC INT,
    MaKH INT,
	MaSuKien INT,
    LoaiVe NVARCHAR(50) NOT NULL,
    GiaVe MONEY NOT NULL,
    NgayMua SMALLDATETIME NOT NULL,
    GhiChu NVARCHAR(255),
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

--Thêm dữ liệu
--Bảng BanToChuc
insert into BanToChuc (TenBTC, TinhThanh)
values (N'Ban tổ chức A', N'Hà Nội')
insert into BanToChuc (TenBTC, TinhThanh)
values (N'Ban tổ chức B', N'Hồ Chí Minh')
insert into BanToChuc (TenBTC, TinhThanh)
values (N'Ban tổ chức C', N'Đà Nẵng')
insert into BanToChuc (TenBTC, TinhThanh)
values (N'Ban tổ chức D', N'Hải Phòng')
insert into BanToChuc (TenBTC, TinhThanh)
values (N'Ban tổ chức E', N'Cần Thơ')
select * from BanToChuc
------------------------------------------------------------------------------
--Bảng SuKien 
insert into SuKienTheThao (TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values (N'Giải vô địch Aikido 2024', '2024-05-09', '2024-05-10', N'Sân vận động Quốc gia Mỹ Đình', 1)
insert into SuKienTheThao (TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values (N'Giải vô địch thể dục thể hình TP.HCM', '2024-03-21','2024-03-23', N'Nhà thi đấu Phú Thọ, TP.HCM', 2)
insert into SuKienTheThao (TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values (N'Giải vô địch Cầu lông Việt Nam 2024', '2024-09-20','2024-09-25', N'Nhà thi đấu Phan Đình Phùng, TP.HCM', 3)
insert into SuKienTheThao (TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values (N'Giải Bóng rổ Sinh viên toàn quốc 2023', '2024-12-04', '2024-12-09', N'Sân Đại học Thể dục thể thao Đà Nẵng', 1)
insert into SuKienTheThao (TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values (N'Giải Wushu toàn quốc', '2024-05-31', '2024-06-02', N'Nhà thi đấu Hà Nội', 2)
insert into SuKienTheThao (TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values (N'Giải vô địch Bắn cung trẻ quốc gia', '2024-07-17', '2024-07-27', N'Trung tâm TDTT quận Gò Vấp', 4)
insert into SuKienTheThao (TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values (N'Giải đấu kiếm Vietnam', '2024-07-01', '2024-07-14', N'Sân vận động Quốc gia, Hồ Chí Minh', 5)
insert into SuKienTheThao (TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values (N'Muay Thái Hạ Long Heritage', '2024-11-03', '2024-11-04', N'Hạ Long, Quảng Ninh', 4)
insert into SuKienTheThao (TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values (N'Giải bóng chày Vũng Tàu', '2024-06-23', '2024-06-25', N'Sân vận động Vũng Tàu City, Bà Rịa - Vũng Tàu', 3)
insert into SuKienTheThao (TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values (N'Giải bóng ném Bình Định', '2024-09-10', '2024-09-15', N'Sân vận động Bình Định, Bình Định', 5)
insert into SuKienTheThao (TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values (N'Giải golf Nha Trang Masters', '2024-08-20', '2024-08-25', N'Sân golf Vinpearl, Nha Trang, Khánh Hòa', 3)
insert into SuKienTheThao (TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC)
values (N'Giải đấu cờ vua Đà Nẵng Challenge', '2024-10-11', '2024-10-12', N'Trung tâm văn hoá Đà Nẵng', 2)
select * from SuKienTheThao
-----------------------------------------------------
--Bảng HLV
insert into HuanLuyenVien(TenHLV, SDT, GioiTinh, DiaChi)
values (N'Đỗ Văn Thành', '0982994234', 1, N'77 Đường AB, Quận Thủ Đức')
insert into HuanLuyenVien(TenHLV, SDT, GioiTinh, DiaChi)
values (N'Phạm Ngọc Anh', '0356526743', 0, N'41 Đường XY, Quận 05')
insert into HuanLuyenVien(TenHLV, SDT, GioiTinh, DiaChi)
values (N'Bùi Chí Công', '0887987675', 1, N'12 Đường UV, Quận 01')
insert into HuanLuyenVien(TenHLV, SDT, GioiTinh, DiaChi)
values (N'Trần Gia Lâm', '0909519769', 1, N'34 Đường KN, Quận 08')
insert into HuanLuyenVien(TenHLV, SDT, GioiTinh, DiaChi)
values (N'Lê Thị Vy', '0398457432', 0, N'22 Đường BG, Quận 11')
insert into HuanLuyenVien(TenHLV, SDT, GioiTinh, DiaChi)
values (N'Đặng Hữu Nhân', '0675866567', 1, N'71 Đường JK, Quận 03')
insert into HuanLuyenVien(TenHLV, SDT, GioiTinh, DiaChi) 
values (N'Nguyễn Văn A', '0123456789', 1, N'123 Đường ABC, Quận XYZ')
insert into HuanLuyenVien(TenHLV, SDT, GioiTinh, DiaChi) 
values (N'Trần Thị B', '0987654321', 0, N'456 Đường DEF, Quận UVW')
insert into HuanLuyenVien(TenHLV, SDT, GioiTinh, DiaChi) 
values (N'Lê Văn C', '0369847123', 1, N'789 Đường GHI, Quận MNO')
insert into HuanLuyenVien(TenHLV, SDT, GioiTinh, DiaChi) 
values (N'Phạm Thị D', '0543217896', 0, N'101 Đường JKL, Quận PQR')
insert into HuanLuyenVien(TenHLV, SDT, GioiTinh, DiaChi) 
values (N'Hoàng Văn E', '0632145987', 1, N'202 Đường STU, Quận WXY')
insert into HuanLuyenVien(TenHLV, SDT, GioiTinh, DiaChi) 
values (N'Vũ Thị F', '0874963215', 0, N'303 Đường VWX, Quận YZA')
insert into HuanLuyenVien(TenHLV, SDT, GioiTinh, DiaChi) 
values (N'Đặng Văn G', '0918273645', 1, N'404 Đường YZA, Quận BCD')
insert into HuanLuyenVien(TenHLV, SDT, GioiTinh, DiaChi) 
values (N'Nguyễn Thị H', '0567348291', 0, N'505 Đường CDE, Quận EG')
insert into HuanLuyenVien(TenHLV, SDT, GioiTinh, DiaChi) 
values (N'Trần Văn I', '0981726354', 1, N'606 Đường GHI, Quận HIJ')
select * from HuanLuyenVien
-------------------------------------------------------
--Bảng DoiThiDau
insert into DoiThiDau (TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values (N'Đội thi Đồng Tháp', 'dongthap@gmail.com', 8, 5, 1)
insert into DoiThiDau (TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values (N'Đội thi Cần Thơ', 'cantho@gmail.com', 10, 3, 2)
insert into DoiThiDau (TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values (N'Đội thi Sài Gòn', 'tphcm@gmail.com', 8, 4, 3)
insert into DoiThiDau (TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values (N'Đội thi Phú Yên', 'phuyen@gmail.com', 7, 0, 1)
insert into DoiThiDau (TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values (N'Đội thi Hà Nội', 'hanoi@gmail.com', 11, 7, 2)
insert into DoiThiDau (TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values (N'Đội thi Nha Trang', 'nhatrang@gmail.com', 14, 4, 3)
insert into DoiThiDau (TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values (N'Đội thi HX', 'hx@gmail.com', 14, 6, 4)
insert into DoiThiDau (TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values (N'Đội thi UU', 'uu@gmail.com', 13, 7, 6)
insert into DoiThiDau (TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values (N'Đội thi RT', 'rt@gmail.com', 14, 10, 6)
insert into DoiThiDau (TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values (N'Đội thi YU','yu@gmail.com', 11, 5, 7)
insert into DoiThiDau (TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV)
values (N'Đội thi JT', 'jt@gmail.com', 10, 0, 7)
select * from DoiThiDau
------------------------------------------------------------------------------
--Bảng VĐV
insert into VanDongVien (HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
values (N'Nguyễn Văn Toàn', '1998-02-13', 1, N'11 Đường 012, Quận 12', '0345445544', 1)
insert into VanDongVien (HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
values (N'Mai Hoàng Bảo Yến', '1989-06-30', 0, N'40 Đường AV, Quận 05', '0905004487', 2)
insert into VanDongVien (HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
values (N'Đỗ Thị Minh Thư', '1990-09-09', 0, N'09 Đường TV, Quận 09', '0389561215', 3)
insert into VanDongVien (HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
values (N'Huỳnh Thanh Tâm', '1984-04-17', 1, N'67 Đường AC, Quận 07', '0987654123', 4)
insert into VanDongVien (HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
values (N'Vũ Văn Long', '1995-01-20', 1, N'22 Đường KH, Quận 10', '0312777409', 5)
insert into VanDongVien (HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
values (N'Lê Bá Khánh Duy', '1998-09-14', 1, N'11 Đường NB, Quận 02', '0998674598', 1)
insert into VanDongVien (HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES (N'Nguyễn Thanh A', '1999-09-01', 1, N'113 Đường AFC, Quận XYZ', '0908090809', 2)
insert into VanDongVien (HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES (N'Lý Thị B', '1987-12-01', 0, N'088 Đường DEF, Quận UVW', '0987652521', 3)
insert into VanDongVien (HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES (N'Phạm Hồng C', '1989-03-13', 1, N'120 Đường GHI, Quận MNO', '0389747123', 4)
insert into VanDongVien (HoTen, NgSinh, GioiTinh, DiaChi,SDT, MaDoi)
VALUES (N'Phạm Thiên D', '1990-08-23', 0, N'824 Đường JKL, Quận PQR', '0543217101', 5)
select * from VanDongVien
---------------------------------------------------------
--Bảng MonTheThao
insert into MonTheThao(TenMon,MoTa)
values (N'Thể dục thể hình', N'Môn cải thiện sức khoẻ và hình dáng cơ thể')
insert into MonTheThao(TenMon,MoTa)
values (N'Đua xe moto', N'Môn thể thao tốc độ cao')
 insert into MonTheThao(TenMon,MoTa)
values (N'Quần vợt', N'Môn sử dụng vợt để đánh bóng')
insert into MonTheThao(TenMon,MoTa)
values (N'Đấu vật', N'Môn thể thao đối kháng')
insert into MonTheThao(TenMon,MoTa)
values (N'Bóng ném', N'Môn sử dụng bóng để ném vào mục tiêu')
insert into MonTheThao(TenMon,MoTa)
values (N'Bắn cung', N'Môn sử dụng cung để bắn các mũi tên vào mục tiêu')
insert into MonTheThao(TenMon,MoTa)
values (N'Judo', N'Môn võ thuật tiếng Nhật sử dụng kỹ thuật chiến đấu')
insert into MonTheThao(TenMon,MoTa)
values (N'Đua xe đạp', N'Môn thể thao địa hình')
insert into MonTheThao(TenMon,MoTa)
values (N'Kickboxing', N'Môn võ thuật đối kháng, kết hợp đấm và đá')
insert into MonTheThao(TenMon,MoTa)
values (N'Boxing', N'Môn võ thuật đối kháng, sử dụng đấm')
insert into MonTheThao(TenMon,MoTa)
values (N'Bóng rổ', N'Môn sử dụng bóng để ném vào rổ')
insert into MonTheThao(TenMon,MoTa)
values (N'Bơi lội', N'Môn thể thao dưới nước')
insert into MonTheThao(TenMon,MoTa)
values (N'Bóng bàn', N'Môn sử dụng bóng để đánh trên bàn')
insert into MonTheThao(TenMon,MoTa)
values (N'Cờ vua', N'Môn thể thao tri thức')
insert into MonTheThao(TenMon,MoTa)
values (N'Leo núi', N'Môn thể thao mạo hiểm')
insert into MonTheThao(TenMon,MoTa)
values (N'Marathon', N'Môn thể thao sử dụng tốc độ của đôi chân')
insert into MonTheThao(TenMon,MoTa)
values (N'Đấu kiếm', N'Môn võ thuật sử dụng kiếm')
insert into MonTheThao(TenMon,MoTa)
values (N'Bóng đá', N'Môn thể thao sử dụng lực sút bóng')
insert into MonTheThao(TenMon,MoTa)
values (N'Cầu lông', N'Môn sử dụng vợt để đánh cầu')
insert into MonTheThao(TenMon,MoTa)
values (N'Golf', N'Môn thể thao đưa bóng vào lỗ')
select * from MonTheThao
------------------------------------------------------------------
--Bảng NoiDungThiDau 
insert into NoiDungThiDau (TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values (N'Vòng bảng chung kết', '2024-03-22', N'Nhà thi đấu Phú Thọ, TP.HCM', N'Lịch thi đấu có thể thay đổi', 1)
insert into NoiDungThiDau (TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values (N'Vòng Bán kết cấp Thành phố', '2024-06-15', N'Nhà thi đấu Quân khu 7', N'Lịch thi đấu có thể thay đổi', 2)
insert into NoiDungThiDau (TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values (N'Vòng đấu loại trừ', '2024-11-06', N'Sân vận động Tràng An, Ninh Bình', N'Lịch thi đấu có thể thay đổi', 3)
insert into NoiDungThiDau (TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values (N'Vòng Chung kết toàn quốc', '2024-05-10', N'Sân vận động Quốc gia Mỹ Đình', N'Lịch thi đấu có thể thay đổi', 4)
insert into NoiDungThiDau (TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values (N'Vòng chung kết', '2024-07-06', N'Nhà văn hoá sinh viên', N'Lịch thi có thể thay đổi', 5)
insert into NoiDungThiDau (TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values (N'Vòng đấu trực tiếp lần 1', '2024-06-01', N'Nhà thi đấu Hà Nội', N'Lịch thi có thể thay đổi', 1)
insert into NoiDungThiDau (TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values (N'Vòng loại trực tiếp lần 2', '2024-07-13', N'Sân vận động Quốc gia, Hồ Chí Minh', N'Lịch thi có thể thay đổi', 2)
insert into NoiDungThiDau (TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values (N'Vòng bán kết lần 1', '2024-06-24', N'Sân vận động Vũng Tàu City, Bà Rịa - Vũng Tàu', N'Lịch thi có thể thay đổi', 3)
insert into NoiDungThiDau (TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values (N'Vòng loại trực tiếp lần 1', '2024-01-21', N'Nhà văn hoá thành phố Đà Lạt, Lâm Đồng', N'Lịch thi có thể thay đổi', 4)
insert into NoiDungThiDau (TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values (N'Vòng chung kết lần 1', '2024-10-04', N'Trung tâm văn hoá Hà Nội', N'Lịch thi có thể thay đổi', 5)
insert into NoiDungThiDau (TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values (N'Vòng loại trực tiếp lần 1', '2024-09-11', N'Sân vận động Bình Định, Bình Định', N'Lịch thi có thể thay đổ', 1)
insert into NoiDungThiDau (TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values (N'Vòng bán kết 1', '2024-09-21', N'Nhà thi đấu Phan Đình Phùng, TP.HCM', N'Lịch thi có thể thay đổi', 2)
insert into NoiDungThiDau (TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values (N'Vòng loại trực tiếp', '2024-07-28', N'Sân vận động Vũng Tàu, Bà Rịa - Vũng Tàu', N'Lịch thi có thể thay đổi', 3)
insert into NoiDungThiDau (TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values (N'Vòng thi đấu quyết định', '2024-04-13', N'Khu vực Hồ Gươm, Hà Nội', N'Lịch thi có thể thay đổi', 4)
insert into NoiDungThiDau (TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon)
values (N'Vòng loại trực tiếp lần 1', '2024-03-14', N'Trung tâm văn hóa Hồ Chí Minh, TP.HCM', N'Lịch thi có thể thay đổi', 5)
select * from NoiDungThiDau
--------------------------------------------------------------
--Bảng NguoiDung
INSERT INTO NguoiDung (TenKh, taiKhoan, matKhau, SDT, DiaChi, GioiTinh, vaiTro)
VALUES (N'Phan Tuan Minh', 'minh', '$2a$10$cRxxj5bEkdoOdxGbU3VRGuYozJ.6H5JAS6Vd5ADrR5tf5Wde5qNVK', '0909678411', N'Quận 01, TP.HCM', 1, 'admin')
INSERT INTO NguoiDung (TenKh, taiKhoan, matKhau, SDT, DiaChi, GioiTinh, vaiTro)
VALUES (N'Trần Hồng Thanh', 'user1', '$2a$10$cRxxj5bEkdoOdxGbU3VRGuYozJ.6H5JAS6Vd5ADrR5tf5Wde5qNVK', '0671345124', N'Quận 09, TP.HCM', 1, 'user')
INSERT INTO NguoiDung (TenKh, taiKhoan, matKhau, SDT, DiaChi, GioiTinh, vaiTro)
VALUES (N'Phạm Chí Hải', 'user2', '$2a$10$cRxxj5bEkdoOdxGbU3VRGuYozJ.6H5JAS6Vd5ADrR5tf5Wde5qNVK', '0878565133', N'Quận Bình Tân, TP.HCM', 0, 'user')
INSERT INTO NguoiDung (TenKh, taiKhoan, matKhau, SDT, DiaChi, GioiTinh, vaiTro)
VALUES (N'Phạm Minh Phương', 'user3', '$2a$10$cRxxj5bEkdoOdxGbU3VRGuYozJ.6H5JAS6Vd5ADrR5tf5Wde5qNVK', '0263435142', N'Quận 04, TP.HCM', 0, 'user')
INSERT INTO NguoiDung (TenKh, taiKhoan, matKhau, SDT, DiaChi, GioiTinh, vaiTro)
VALUES (N'Lâm Quốc Huy', 'user4', '$2a$10$cRxxj5bEkdoOdxGbU3VRGuYozJ.6H5JAS6Vd5ADrR5tf5Wde5qNVK', '0467393309', N'Quận Phú Nhuận, TP.HCM', 1, 'user')
INSERT INTO NguoiDung (TenKh, taiKhoan, matKhau, SDT, DiaChi, GioiTinh, vaiTro)
VALUES (N'Phan Như Ý', 'user5', '$2a$10$cRxxj5bEkdoOdxGbU3VRGuYozJ.6H5JAS6Vd5ADrR5tf5Wde5qNVK', '0987849678', N'Quận 12, TP.HCM', 0, 'user')
select * from NguoiDung
---------------------------------------------------------------------
--Bảng Ve
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('VIP', '500.000', '2024-05-01', N'Vé đặc biệt', 1, 2, 2)
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('Cat1', '100.000', '2024-07-15', N'Vé thường', 1, 2, 3)
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('PLatinum', '300.000', '2024-09-26', N'Vé đặc biệt', 2, 3, 1)
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('PLatinum', '400.000', '2024-04-09', N'Vé đặc biệt', 3, 2, 2)
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('Cat2', '100.000', '2024-03-19', N'Vé thường', 2, 3, 2)
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('VIP', '100.000', '2024-03-19', N'Vé thường', 4, 5, 4)
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('VIP', '200.000', '2024-12-01', N'Vé đặc biệt', 5, 4, 3)
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('Cat1', '150.000', '2024-12-25', N'Vé thường', 6, 1, 5)
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('Cat1', '150.000', '2023-12-25', N'Vé thường', 5, 1, 5)
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('Cat1', '150.000', '2023-06-15', N'Vé thường', 6, 1, 5)
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('Cat1', '150.000', '2023-08-18', N'Vé thường', 7, 3, 5)
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('Cat1', '150.000', '2023-08-18', N'Vé thường', 8, 3, 5)
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('Cat1', '150.000', '2023-08-18', N'Vé thường', 9, 3, 5)
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('Cat1', '150.000', '2023-08-18', N'Vé thường', 10, 3, 5)
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('Cat1', '150.000', '2023-08-18', N'Vé thường', 11, 3, 5)
Insert into Ve (LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh)
Values ('Cat1', '150.000', '2023-08-18', N'Vé thường', 12, 4, 5)
-------------------------------------------
--Bảng ThamGia
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values (1, 2, 3, 3)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values (3, 2, 3, 2)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values (2, 1, 3, 1)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values (1, 3, 1, 2)
Insert into ThamGia (MaVDV, MaND, MaSuKien, HuyChuong)
Values (3, 3, 3, 0)
select * from ThamGia
-----------------------------------------------------
--Xử lý thông tin

--Stored procedure

--Thêm một vận động viên
go
CREATE PROCEDURE VanDongVien_Add(
	@MaVDV INT,
	@HoTen VARCHAR(50),
	@NgSinh DATE,
	@GioiTinh INT,
	@DiaChi VARCHAR(255),
	@SDT VARCHAR(20),
	@MaDoi INT
)
AS
BEGIN
DECLARE @MaVDV_Exist INT;
DECLARE @MaDoi_Exist INT;
  SELECT @MaVDV_Exist = COUNT(*)
  FROM VanDongVien
  WHERE MaVDV = @MaVDV;
  IF (@MaVDV_Exist > 0)
  BEGIN
    RAISERROR('MaVDV da ton tai', 16, 1);
    RETURN;
  END;
  SELECT @MaDoi_Exist = COUNT(*)
  FROM VanDongVien, DoiThiDau
  WHERE DoiThiDau.MaDoi = @MaDoi;
  IF (@MaDoi_Exist > 0)
  BEGIN
    RAISERROR('MaDoi da ton tai', 16, 1);
    RETURN;
  END;
INSERT INTO VanDongVien (MaVDV, HoTen, NgSinh, GioiTinh, DiaChi, SDT, MaDoi)
VALUES (@MaVDV, @HoTen, @NgSinh, @GioiTinh, @DiaChi, @SDT, @MaDoi);
END
GO

--Lấy và hiển thị thông tin người dùng 
CREATE PROCEDURE KhachHang_GetList 
as
BEGIN
	SELECT MaKh, TenKh, taiKhoan, matKhau, SDT, DiaChi, GioiTinh, vaitro
	FROM NguoiDung;
END
GO

--Lấy tất cả các vé mà một khách hàng cụ thể đã mua từ bảng vé
CREATE PROCEDURE GetVeByKhachHang (
    @MaKH INT
)
AS
BEGIN
    SELECT * 
    FROM Ve
    WHERE MaKh = @MaKH
END
GO

--Tính tổng tiền vé đã mua của một khách hàng ứng với 1 sự kiện thể thao cụ thể
create procedure KhachHang_TotalPurchase (
	@MaKH int,
	@ToTalPrice money output, @MaSK int output 
)
as
begin
    if not exists (select 1 from NguoiDung where MaKh = @MaKH)
    begin
        print N'Mã khách hàng không tồn tại!'
		rollback transaction
    end
    set @TotalPrice = 0;
    select @TotalPrice = SUM(GiaVe) from Ve
    where MaKh = @MaKH
	select @MaSK = SukienTheThao.MaSuKien from Ve, SuKienTheThao 
	where SuKienTheThao.MaSuKien=Ve.MaSuKien and MaKh = @MaKH
	PRINT N'Tiền vé đã mua là ' + CAST(@TotalPrice AS NVARCHAR(MAX)); 
	PRINT N'Mã sự kiện là ' + CAST(@MaSK AS NVARCHAR(MAX)); 
end

--Cập nhật địa điểm của một sự kiện thể thao cụ thể trong bảng ‘Sukienthethao’
go
CREATE PROCEDURE UpdateSuKienDiaDiem (
    @MaSuKien INT,
    @DiaDiem VARCHAR(255)
)
AS
BEGIN
    UPDATE SuKienTheThao
    SET DiaDiem = @DiaDiem
    WHERE MaSuKien = @MaSuKien
END
GO

--Cập nhật thông tin của huấn luyện viên trong bảng
CREATE PROCEDURE UpdateHuanLuyenVien (
    @MaHLV INT,
    @TenHLV VARCHAR(50),
    @SDT VARCHAR(20),
    @DiaChi VARCHAR(255),
    @GioiTinh INT
)
AS
BEGIN
    UPDATE HuanLuyenVien
    SET TenHLV = @TenHLV,
        SDT = @SDT,
        DiaChi = @DiaChi,
        GioiTinh = @GioiTinh
    WHERE MaHLV = @MaHLV
END
GO

--Lấy thông tin vé
CREATE PROCEDURE SP_GetListVe (
    @MaVe INT
)
AS
BEGIN
    SELECT MaVe, LoaiVe, GiaVe, NgayMua, GhiChu, MaSuKien, MaBTC, MaKh
    FROM Ve
    WHERE MaVe = @MaVe;
END

--Lấy thông tin của sự kiện thể thao
go
CREATE PROCEDURE SP_GetListSuKienTheThao (
    @MaSuKien INT
)
AS
BEGIN
    SELECT MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem, MaBTC
    FROM SuKienTheThao
    WHERE MaSuKien = @MaSuKien;
END

--Lấy thông tin của vận động viên
go
CREATE PROCEDURE SP_GetListVDV (
	@MaVDV INT
)
AS
BEGIN
    SELECT MaVDV, HoTen, NgSinh, GioiTinh, DiaChi, SDT, MaDoi
    FROM VanDongVien
    WHERE MaVDV = @MaVDV;
END

--Lấy thông tin của huấn luyện viên
go
CREATE PROCEDURE SP_GetListHLV (
    @MaHLV INT
)
AS
BEGIN
    SELECT MaHLV, TenHLV, SDT, GioiTinh, DiaChi
    FROM HuanLuyenVien
    WHERE MaHLV = @MaHLV;
END

--Lấy thông tin của đội thi đấu
go
CREATE PROCEDURE SP_GetListDoiThiDau (
    @MaDoi INT
)
AS
BEGIN
    SELECT MaDoi, TenDoi, Email, SoLuongVDV, SoLuongHuyChuong, MaHLV
    FROM DoiThiDau
    WHERE MaDoi = @MaDoi;
END

--Lấy thông tin nội dung thi đấu
go
CREATE PROCEDURE SP_GetlistND
AS
BEGIN
    SELECT MaND, TenND, ThoiGian, DiaDiemThi, GhiChu, MaMon
    FROM NoiDungThiDau;
END

--Lấy thông tin của môn thể thao
go
CREATE PROCEDURE SP_GetListMonThethao (
    @MaMon INT
)
AS
BEGIN
    SELECT MaMon, TenMon, MoTa
    FROM MonTheThao
    WHERE MaMon = @MaMon;
END

--Trigger

--Thêm 1 vé đảm bảo ngày mua vé phải sớm hơn ngày bắt đầu sự kiện đó.
go
create trigger TR_TicketPurchaseDate_INS
on Ve
after insert
as
begin
    declare @MaVe int, @MaSuKien int
    select @MaVe = MaVe, @MaSuKien = MaSuKien from inserted 
    if exists(select * from SuKienTheThao, Ve where SuKienTheThao.MaSuKien=Ve.MaSuKien and 
	                      MaVe=@MaVe and SuKienTheThao.MaSuKien=@MaSuKien and NgayMua > NgBatDau)
    begin
        print N'Ngày mua vé phải sớm hơn ngày bắt đầu sự kiện!'
        rollback transaction
    end
	else
	begin
		print 'OK'
	end
end

--Cập nhật số lượng vận động viên trong đội thi đấu khi thêm vận động viên
go
CREATE TRIGGER TR_SoLuongVDV_INS
ON DoiThiDau
AFTER INSERT 
AS
BEGIN
  UPDATE DoiThiDau
  SET SoLuongVDV = SoLuongVDV + 1
  WHERE MaDoi IN (SELECT MaDoi FROM INSERTED);
END

--Cập nhật thông tin đội thi đấu khi cập nhật huấn luyện viên
go
CREATE TRIGGER TR_HLV_UPD
ON HuanLuyenVien
AFTER UPDATE
AS
BEGIN
    UPDATE DoiThiDau
    SET MaHLV = inserted.MaHLV
    FROM DoiThiDau
    INNER JOIN inserted ON DoiThiDau.MaHLV = inserted.MaHLV
END
GO

--Không cho phép xóa đội thi đấu nếu đội thi đấu còn vận động viên
CREATE TRIGGER TR_DoiThiDau_DEL
ON DoiThiDau
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM VanDongVien WHERE MaDoi = (SELECT MaDoi FROM deleted))
    BEGIN
        RAISERROR ('Không thể xóa đội thi đấu vì đội thi đấu còn vận động viên.', 16, 1);
    END
    ELSE
    BEGIN
        DELETE FROM DoiThiDau WHERE MaDoi = (SELECT MaDoi FROM deleted);
    END
END
GO

--Function

--Tính số lượng vé được mua trong 1 tháng
go
create function VE_CountByMonth
(	
	@Month int,
	@Year int
)
returns int
as
begin
	declare @NgayBD date, @NgayKT date, @SoLuongVe int

	set @NgayBD = DATEFROMPARTS(@Year, @Month, 1)
	set @NgayKT = DATEADD(day, -1, DATEADD(month, 1, @NgayBD))

	select @SoLuongVe = count(*) from Ve where NgayMua>=@NgayBD and NgayMua<=@NgayKT
	return @SoLuongVe
end

--Tìm kiếm và trả về danh sách các vận động viên thông qua mã môn thể thao
go
CREATE FUNCTION FN_GetVDVBySport (@sport_id INT)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM VanDongVien
    WHERE MaVDV IN (
        SELECT MaVDV
        FROM ThamGia, NoiDungThiDau
        WHERE ThamGia.MaND = NoiDungThiDau.MaND and MaMon = @sport_id
)
)
GO

--Trả về danh sách các sự kiện thể thao diễn ra trong khoảng thời gian cụ thể
CREATE FUNCTION FN_GetSuKienByNgay (@NgayBatDau DATE, @NgayKetThuc DATE)
RETURNS TABLE
AS
RETURN
(
    SELECT MaSuKien, TenSuKien, NgBatDau, NgKetThuc, DiaDiem
    FROM SuKienTheThao
    WHERE NgBatDau >= @NgayBatDau AND NgKetThuc <= @NgayKetThuc
)
GO

--Cursor

--Tổng số lượng người tham dự cho mỗi sự kiện thể thao
go
create procedure KhachHang_TotalCount (
    @MaSuKien int
)
as
begin
    declare @TongSLNguoiThamGia int;
    set @TongSLNguoiThamGia = 0;
    declare @IDKhachHang int;
    declare @SoNguoiTG int;
    declare participant_cursor cursor for
		select MaKh from Ve
		where MaSuKien = @MaSuKien;
    open participant_cursor;
    fetch next from participant_cursor into @IDKhachHang;
    while @@FETCH_STATUS = 0
    begin
        set @SoNguoiTG = (
            select COUNT(*) from Ve
            where MaKh = @IDKhachHang
        );
        set @TongSLNguoiThamGia = @TongSLNguoiThamGia + @SoNguoiTG;
        fetch next from participant_cursor into @IDKhachHang;
    end
    close participant_cursor;
    deallocate participant_cursor;
    select @TongSLNguoiThamGia AS TotalAttendees;
end

--Cập nhật số lượng vận động viên trong bảng ‘DoiThiDau’
go
CREATE PROCEDURE CUR_UpdateSoLuongVDV
AS
BEGIN
    DECLARE @MaDoi INT, @SoLuongVDV INT;

    DECLARE cur_VDV CURSOR FOR
    SELECT MaDoi, COUNT(MaVDV)
    FROM VanDongVien
    GROUP BY MaDoi;
    OPEN cur_VDV;
    FETCH NEXT FROM cur_VDV INTO @MaDoi, @SoLuongVDV;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        UPDATE DoiThiDau
        SET SoLuongVDV = @SoLuongVDV
        WHERE MaDoi = @MaDoi;
        FETCH NEXT FROM cur_VDV INTO @MaDoi, @SoLuongVDV;
    END
    CLOSE cur_VDV;
    DEALLOCATE cur_VDV;
END
GO

--Tăng giá vé lên một phần trăm cụ thể trong bảng ‘Ve’
CREATE PROCEDURE CUR_UpdateGiaVe
    @PhanTramTang FLOAT
AS
BEGIN
    DECLARE @MaVe INT, @GiaVeCu MONEY, @GiaVeMoi MONEY;
    DECLARE cur_GiaVe CURSOR FOR
    SELECT MaVe, GiaVe
    FROM Ve;
    OPEN cur_GiaVe;
    FETCH NEXT FROM cur_GiaVe INTO @MaVe, @GiaVeCu;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @GiaVeMoi = @GiaVeCu * (1 + @PhanTramTang / 100);
        UPDATE Ve
        SET GiaVe = @GiaVeMoi
        WHERE MaVe = @MaVe;
        FETCH NEXT FROM cur_GiaVe INTO @MaVe, @GiaVeCu;
    END
    CLOSE cur_GiaVe;
    DEALLOCATE cur_GiaVe;
END
GO

--Phân quyền
--A.Tạo các role
CREATE ROLE [Manager_role]
--DROP ROLE [Manager_role]

CREATE ROLE [Employee_role]
--DROP ROLE [Employee_role]

CREATE ROLE [Customer_role]
--DROP ROLE [Customer_role]

--B.Phân quyền cho role

--1.Phân quyền cho [Manager_role]

--phân quyền trên các table
GRANT SELECT ON [dbo].[NguoiDung] TO [Manager_role]
GRANT SELECT, INSERT, UPDATE ON [dbo].[BanToChuc] TO [Manager_role]
GRANT SELECT, INSERT, UPDATE ON [dbo].[VanDongVien] TO [Manager_role]
GRANT SELECT, INSERT, UPDATE ON [dbo].[DoiThiDau] TO [Manager_role]
GRANT SELECT, INSERT, UPDATE ON [dbo].[Ve] TO [Manager_role]
GRANT SELECT, INSERT, UPDATE ON [dbo].[HuanLuyenVien] TO [Manager_role]
GRANT SELECT, INSERT, DELETE, UPDATE ON [dbo].[SuKienTheThao] TO [Manager_role]
GRANT SELECT, INSERT, DELETE, UPDATE ON [dbo].[MonTheThao] TO [Manager_role]
GRANT SELECT, INSERT, DELETE, UPDATE ON [dbo].[NoiDungThiDau] TO [Manager_role]
GRANT SELECT, INSERT ON [dbo].[ThamGia] TO [Manager_role]

--phân quyền trên các procedure
GRANT EXECUTE ON [dbo].[VanDongVien_Add] TO [Manager_role]
GRANT EXECUTE ON [dbo].[KhachHang_GetList] TO [Manager_role]
GRANT EXECUTE ON [dbo].[GetVeByKhachHang] TO [Manager_role]
GRANT EXECUTE ON [dbo].[KhachHang_TotalPurchase ] TO [Manager_role]
GRANT EXECUTE ON [dbo].[UpdateSuKienDiaDiem] TO [Manager_role]
GRANT EXECUTE ON [dbo].[UpdateHuanLuyenVien] TO [Manager_role]
GRANT EXECUTE ON [dbo].[KhachHang_TotalCount] TO [Manager_role]
GRANT EXECUTE ON [dbo].[CUR_UpdateSoLuongVDV] TO [Manager_role]
GRANT EXECUTE ON [dbo].[CUR_UpdateGiaVe] TO [Manager_role]
GRANT EXECUTE ON [dbo].[SP_GetListVe] TO [Manager_role]
GRANT EXECUTE ON [dbo].[SP_GetListSuKienTheThao] TO [Manager_role]
GRANT EXECUTE ON [dbo].[SP_GetListVDV] TO [Manager_role]
GRANT EXECUTE ON [dbo].[SP_GetListHLV] TO [Manager_role]
GRANT EXECUTE ON [dbo].[SP_GetListDoiThiDau] TO [Manager_role]
GRANT EXECUTE ON [dbo].[SP_GetListND] TO [Manager_role]
GRANT EXECUTE ON [dbo].[SP_GetListMonThethao] TO [Manager_role]

--phân quyền trên các function
GRANT EXECUTE ON [dbo].[VE_CountByMonth] TO [Manager_role]
GRANT EXECUTE ON [dbo].[FN_GetVDVBySport] TO [Manager_role]
GRANT EXECUTE ON [dbo].[FN_GetSuKienByNgay] TO [Manager_role]

--2.Phân quyền cho [Employee_role]

--quyền trên các table
GRANT SELECT ON [dbo].[NguoiDung] TO [Employee_role]
GRANT SELECT, INSERT, UPDATE ON [dbo].[BanToChuc] TO [Employee_role]
GRANT SELECT, INSERT, UPDATE ON [dbo].[VanDongVien] TO [Employee_role]
GRANT SELECT, INSERT, UPDATE ON [dbo].[DoiThiDau] TO [Employee_role]
GRANT SELECT, INSERT, UPDATE ON [dbo].[Ve] TO [Employee_role]
GRANT SELECT, INSERT, UPDATE ON [dbo].[HuanLuyenVien] TO [Employee_role]
GRANT SELECT, INSERT, DELETE, UPDATE ON [dbo].[SuKienTheThao] TO [Employee_role]
GRANT SELECT, INSERT, DELETE, UPDATE ON [dbo].[MonTheThao] TO [Employee_role]
GRANT SELECT, INSERT, DELETE, UPDATE ON [dbo].[NoiDungThiDau] TO [Employee_role]
GRANT SELECT, INSERT ON [dbo].[ThamGia] TO [Employee_role]

--quyền thực thi procedure

GRANT EXECUTE ON [dbo].[VanDongVien_Add] TO [Employee_role]
GRANT EXECUTE ON [dbo].[KhachHang_GetList] TO [Employee_role]
GRANT EXECUTE ON [dbo].[GetVeByKhachHang] TO [Employee_role]
GRANT EXECUTE ON [dbo].[KhachHang_TotalPurchase ] TO [Employee_role]
GRANT EXECUTE ON [dbo].[UpdateSuKienDiaDiem] TO [Employee_role]
GRANT EXECUTE ON [dbo].[UpdateHuanLuyenVien] TO [Employee_role]
GRANT EXECUTE ON [dbo].[KhachHang_TotalCount] TO [Employee_role]
GRANT EXECUTE ON [dbo].[CUR_UpdateSoLuongVDV] TO [Employee_role]
GRANT EXECUTE ON [dbo].[CUR_UpdateGiaVe] TO [Employee_role]
GRANT EXECUTE ON [dbo].[SP_GetListVe] TO [Employee_role]
GRANT EXECUTE ON [dbo].[SP_GetListSuKienTheThao] TO [Employee_role]
GRANT EXECUTE ON [dbo].[SP_GetListVDV] TO [Employee_role]
GRANT EXECUTE ON [dbo].[SP_GetListHLV] TO [Employee_role]
GRANT EXECUTE ON [dbo].[SP_GetListDoiThiDau] TO [Employee_role]
GRANT EXECUTE ON [dbo].[SP_GetListND] TO [Employee_role]
GRANT EXECUTE ON [dbo].[SP_GetListMonThethao] TO [Employee_role]

--quyền thực thi function
GRANT EXECUTE ON [dbo].[VE_CountByMonth] TO [Employee_role]
GRANT EXECUTE ON [dbo].[FN_GetVDVBySport] TO [Employee_role]
GRANT EXECUTE ON [dbo].[FN_GetSuKienByNgay] TO [Employee_role]

--3.Phân quyền cho [Customer_role]

--quyền trên các table
GRANT SELECT ON [dbo].[SuKienTheThao] TO [Customer_role]
GRANT SELECT ON [dbo].[VanDongVien] TO [Customer_role]
GRANT SELECT ON [dbo].[DoiThiDau] TO [Customer_role]
GRANT SELECT ON [dbo].[MonTheThao] TO [Customer_role]
GRANT SELECT ON [dbo].[NoiDungThiDau] TO [Customer_role]
GRANT SELECT, INSERT, DELETE, UPDATE ON [dbo].[Ve] TO [Customer_role]
GRANT SELECT, INSERT, DELETE, UPDATE ON [dbo].[NguoiDung] TO [Customer_role]
GRANT SELECT ON [dbo].[HuanLuyenVien] TO [Customer_role]

--quyền thực thi procedure
GRANT EXECUTE ON [dbo].[KhachHang_GetList] TO [Customer_role]
GRANT EXECUTE ON [dbo].[GetVeByKhachHang] TO [Customer_role]
GRANT EXECUTE ON [dbo].[KhachHang_TotalPurchase ] TO [Customer_role]
GRANT EXECUTE ON [dbo].[SP_GetListVe] TO [Customer_role]
GRANT EXECUTE ON [dbo].[SP_GetListSuKienTheThao] TO [Customer_role]
GRANT EXECUTE ON [dbo].[SP_GetListVDV] TO [Customer_role]
GRANT EXECUTE ON [dbo].[SP_GetListHLV] TO [Customer_role]
GRANT EXECUTE ON [dbo].[SP_GetListDoiThiDau] TO [Customer_role]
GRANT EXECUTE ON [dbo].[SP_GetListND] TO [Customer_role]
GRANT EXECUTE ON [dbo].[SP_GetListMonThethao] TO [Customer_role]

--C. Tạo một số User

--user Manager_A cho tài khoản login Manager_1
CREATE LOGIN Manager_1 WITH PASSWORD = '123456'
CREATE USER Manager_A FOR LOGIN Manager_1

--user Employee_A cho tài khoản login Employee_1
CREATE LOGIN Employee_1 WITH PASSWORD = '98765'
CREATE USER Employee_A FOR LOGIN Employee_1

--user Customer_A cho tài khoản login Customer_1
CREATE LOGIN Customer_1 WITH PASSWORD = '123456'
CREATE USER Customer_A FOR LOGIN Customer_1

--D. Gán quyền cho user tương ứng

ALTER ROLE [Manager_role] ADD MEMBER Manager_A
ALTER ROLE [Employee_role] ADD MEMBER Employee_A
ALTER ROLE [Customer_role] ADD MEMBER Customer_A