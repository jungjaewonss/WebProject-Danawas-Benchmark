select * from goodNickName;
select * from danawa_Board;
select * from danawa_reWrite;
select * from danawa_myPage;
select * from notebookinfo;
select * from danawa_mem;


drop table mallinfo;
select  distinct subject ,  from notebookInfo where subject = '레노버 아이디어패드 Slim3-15IAU7 5D WIN11 16GB램 (SSD 256GB)';


delete  from danawa_mem where memId='mem1';
insert into danawa_mem (memIdx,memId,memPassword,memName,memNickName,memPhone) 
values(0, 'admin', 1, '관리자','관리자','010-8241-2333');


select count(*) from notebookinfo where	subject like concat('%','LG','%') or
											company like concat('%','LG','%');	
select * from danawa_board where memId = 13 order by boidx desc;	

delete from danawa_myPage; 
delete from danawa_board;
delete from danawa_reWrite;
delete from goodNickName;

delete  from danawa_myPage where memIdx is null ;

alter table danawa_mypage drop myNoteBookLink;
			select Max(reSequence) from danawa_reWrite where boGroup = 2;
select count(reSequence) from danawa_reWrite where boGroup = 2;



alter table danawa_mypage add myNoteBookDate datetime default now();

drop table danawa_mem;
drop table danawa_mypage



select distinct link from mallinfo where modelnum = '레노버 아이디어패드 Slim3-15IAU7 5D WIN11 16GB램 (SSD 256GB)';

select * from mallinfo;

drop table danawa_board;
SELECT * FROM DANAWA_BOARD;



SHOW INDEXES IN danawa_board;

select boGood from danawa_board where boIdx = 1;
select b.* , g.goCount from danawa_board b, goodNickName g where b.boIdx = g.boIdx and b.boIdx = 1;
select boGood from danawa_board where boIdx = 1;			
select * from goodnickname;
select * from danawa_board;
select boGood from danawa_board boIdx = 1;











select * from danawa_board;
show table status;

select boGood from danawa_Board where boIdx=8;



drop table goodNickName;
drop table danawa_Board;


select b.* , g.goNickName , g.goCount from danawa_board b, goodNickName g 
		where b.boIdx = g.boIdx;
		



select boGood from danawa_board where memId=12;

drop table danawa_board;

alter table danawa_Board modify boGood int default 0;


select * from danawa_board where boIdx = 9;

select count(*) from danawa_Board;
select * from danawa_board order by bIdx desc;	
select * from danawa_board;

alter table danawa_mem add memNickName varchar(20) AFTER memName;

delete from danawa_board where bidx > 100;

	select count(*)+1 from danawa_Board;
select * from danawa_mem;

select * from goodNickName;
		select count(*) from GoodNickName where boIdx = 5 and goNickName = 13;

select b.* , g.goNickName , g.goCount from danawa_board b, goodNickName g 
		where b.boIdx = g.boIdx and b.boIdx = 3;

		select b.* , g.goNickName , g.goCount from danawa_board b, goodNickName g where b.boIdx=g.boIdx;
		
		select b.* , g.goNickName , g.goCount from danawa_board b, goodNickName g 
		where  b.boIdx = 7;
		
		
		
			select b.* , g.goNickName , g.goCount from danawa_board b, goodNickName g 
		where b.boIdx = g.boIdx and b.boIdx = 13 and g.goNickName = 11;
		
		
		select b.* , g.goNickName , g.goCount from danawa_board b, goodNickName g 
		where b.boIdx = g.boIdx and b.boIdx = 4 and g.goNickName = 15;
		
		select b.* , g.goNickName , g.goCount from danawa_board b, goodNickName g where b.boIdx = g.boIdx ;
		select * from danawa_board where boIdx = 3;

		select * from goodnickname;
		select * from danawa_Board;

		select * from GoodNickName
		where boIdx = 1 and goNickName = 12;
		
		

	select b.* , g.goNickName , g.goCount from danawa_board b, goodNickName g
		where b.boIdx = g.boIdx 
	 	order by b.boIdx desc limit 0,5;
	 	
	 	
	 	select b.* , g.goNickName , g.goCount from danawa_board b, goodNickName g 
		where b.boIdx = g.boIdx 
		order by b.boIdx desc limit 0, 5;	