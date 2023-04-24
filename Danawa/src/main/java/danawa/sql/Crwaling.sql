	
create table MallInfo(
	modelnum varchar(200) ,
	link varchar(1000) ,
	logo varchar(1000) ,
	price int(20) ,
	shipping varchar(1000),
	mallname varchar(1000)
);


	create table NoteBookInfo(
	subject varchar(200),
	screeninch varchar(20), 
	weight varchar(20),
	company varchar(30), 
	price int(15), 
	img varchar(1000),
	memory varchar(30),
	usb varchar(20),
	purpose varchar(20), 
	thickness varchar(20),
	allinfo varchar(1000)
);

create table danawa_mem(
	memIdx int auto_increment,
	memId varchar(20) not null,
	memPassword varchar(20) not null,
	memName varchar(20) not null,
	memNickName varchar(20) not null,
	memPhone varchar(30) not null,
	memProfile varchar(50),
	primary key(memIdx)
);

create table danawa_mypage(
	memIdx int,
	myNoteBook varchar(100),
	myNoteBookImg varchar(1000),	
	foreign key (memIdx)
	references danawa_mem(memIdx)
);

create table danawa_reWrite(
	boGroup int,
	reNickName varchar(20),
	reContent varchar(500),
	reSequence int default 0,
	reLevel int default 0,
	foreign key (boGroup)
	references danawa_board(boIdx)
);
create table danawa_board(
	boIdx int ,
	boGroup int default 0,
	memId varchar(20) not null,
	boTitle varchar(50) not null,
	boContent varchar(3000) ,
	boCount int default 0 ,
	boNickName varchar(20),
	boPassword varchar(50),
	boDate datetime default now(),
	boGood int default 0,		
	boSequence int default 0,
	boLevel int default 0,
	
	primary key(boIdx,boGroup)	
);

create table goodNickName(
	boIdx int ,
	goNickName varchar(20),
	goCount int default 0,
	foreign key (boIdx) 
	references danawa_board(boIdx)
);
