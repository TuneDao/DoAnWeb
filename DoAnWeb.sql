use master

create database DoAnWeb
GO
USE DoAnWeb
GO
create table KHACHHANG
(
MaKH int identity(1,1),
HoTenKH nvarchar(30),
DiaChiKH nvarchar(50),
DienThoaiKH varchar(20),
TenDN varchar(30) unique,
MatKhau varchar(30),
NgaySinh smalldatetime,
GioiTinh bit default 1,
Email varchar(50) unique,
DaDuyet bit default 0,
constraint PK_KHACHHANG primary key(MaKH)
)
GO
create table DONDATHANG
(
SoDH int identity(1,1),
MaKH int,
NgayDH smalldatetime,
TriGia money check(TriGia>0),
DaGiao bit default 0,
NgayGiaoHang smalldatetime,
TenNguoiNhan nvarchar(50),
DiaChiNhan nvarchar(50),
DienThoaiNhan varchar(20),
HTThanhToan bit default 0,
HTGiaoHang bit default 0,
constraint PK_DONDATHANG primary key(SoDH)
)
GO
create table CTDONHANG
(
SoDH int,
MaPhim int,
SoLuong int check(SoLuong >0),
DongGia decimal(9,2) check (DongGia >=0),
ThanhTien as SoLuong*DongGia,
Constraint PK_CTDONHANG primary key(SoDH,MaPhim)
)
GO
Create table PHIM
(
MaPhim int identity(1,1),
TenPhim nvarchar(100),
DongGia money check (DongGia>=0),
MoTa ntext,
HinhMinhHoa varchar(50),
MaTL int,
NgayCapNhat smalldatetime,
SoLuongBan int check(SoLuongBan>0),
SoLanXem int default 0,
constraint PK_PHIM primary key(MaPhim)
)
GO
create table DAODIEN
(
MaDD int identity(1,1),
TenDD nvarchar(50),
DiaChiDD nvarchar(50),
DienThoaiDD varchar(20),
constraint PK_DAODIEN primary key(MaDD)
)
GO
create table VIETPHIM
(
MaDD int,
MaPhim int,
VaiTro nvarchar(50),
constraint PK_VIETPHIM primary key (MaDD,MaPhim)
)
GO
create table THELOAI
(
MaTL int identity(1,1),
TenTL nvarchar(50),
constraint PK_THELOAI primary key(MaTL)
)
GO

alter table PHIM add constraint FK_PHIM_THELOAI foreign key (MaTL)references THELOAI(MaTL)
alter table VIETPHIM add constraint FK_VIETPHIM_DAODIEN foreign key(MaDD)references DAODIEN(MaDD)
alter table VIETPHIM add constraint FK_VIETPHIM_PHIM foreign key(MaPhim) references PHIM(MaPhim)
alter table DONDATHANG add constraint FK_DONDATHANG_KHACHHANG foreign key(MaKH) references KHACHHANG(MaKH)
alter table CTDONHANG add constraint FK_CTDONHANG_DONDATHANG foreign key (SoDH) references DONDATHANG(SoDH)
alter table CTDONHANG add constraint FK_CTDONHANG_PHIM foreign key(SoDH) references PHIM(MaPhim)
GO






