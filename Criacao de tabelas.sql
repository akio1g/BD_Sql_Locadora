create table Cliente (
	num_cadastro int not null primary key,
	nome varchar(70) not null,
	logradouro varchar(150) not null,
	num int not null check(num>0),
	cep char(8) null check(len(cep) = 8)
)
create table Estrela (
	id int not null primary key,
	nome varchar(50) not null
)

create table Filme (
	id int not null primary key,
	titulo varchar(40) not null,
	ano int null check(ano<=2021)
)

create table DVD (
	num int not null primary key,
	data_fabricacao date not null check(data_fabricacao < getdate()),
	filmeId int not null,
	constraint fk_filmeId foreign key (filmeId) references Filme (id)
)

create table Filme_Estrela (
	FilmeId int not null,
	EstrelaId int not null,
	constraint fk_filmeId_filmeEstrela foreign key (FilmeId) references Filme (id),
	constraint fk_estrelaId foreign key (EstrelaId) references Estrela (id)
)

create table Locacao (
	DVDnum int not null,
	Clientenum_cadastro int not null,
	data_locacao date not null primary key default(getdate()),
	data_devolucao date not null check(datediff(day,data_locacao,data_devolucao)>0),
	valor decimal(7,2) not null check (valor>0),
	constraint fk_dvdnum foreign key (DVDnum) references DVD (num),
	constraint fk_clientenum_cadastro foreign key (Clientenum_cadastro) references Cliente (num_cadastro)
)