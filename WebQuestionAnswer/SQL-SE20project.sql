CREATE DATABASE MockProjectSE20

CREATE TABLE tblAccount(
	AccountID int IDENTITY PRIMARY KEY,
	UserName nvarchar(50) NOT NULL,
	Pass nvarchar(50) NOT NULL,
	Email nvarchar(50) Check (Email LIKE '%_@_%_.__%'),
	DisplayName nvarchar(50),
	StartDate datetime DEFAULT GETDATE(),
	BirthDate datetime,
	Location nvarchar(50),
	AboutMe nvarchar(50),
	Career nvarchar(50),
	CompanyName nvarchar(50),
	TotalAnswer int DEFAULT(0),
	TotalQuestion int DEFAULT(0),
	TotalView int DEFAULT(0),
	TotalTag int DEFAULT(0),
	ReputationPoint int DEFAULT(1),
	Img nvarchar(50),
	STT int DEFAULT 1, -- 1 is Normal, 0 is Block, -1 Delete
	LastSeen datetime DEFAULT(GETDATE()),
	LockDate datetime DEFAULT(GETDATE()),
)

CREATE TABLE tblTag(
	TagID int IDENTITY PRIMARY KEY,
	TagName nvarchar(25) UNIQUE,
	TagPoint int DEFAULT 1,
	DescriptionDetails text,
	CreationDate datetime DEFAULT GETDATE(),
	STT int DEFAULT 1, -- 1 is Normal, 0 is Block, -1 Destroy
)

CREATE TABLE tblQuestion(
	QuestionID int IDENTITY PRIMARY KEY,
	AccountID int FOREIGN KEY REFERENCES tblAccount(AccountID),
	Title nvarchar(200),
	QuestionBody nvarchar(MAX),
	EditDate datetime,
	TotalVote int DEFAULT 0,
	TotalAnswer int DEFAULT 0,
	TotalView int DEFAULT 0,
	IsLock int DEFAULT 0, --0 normal,1 xóa
	IsViewed int DEFAULT 0,
	CreationDate datetime DEFAULT GETDATE(),
)

create TABLE tblAnswer(
	AnswerID int IDENTITY PRIMARY KEY,
	AccountID int FOREIGN KEY REFERENCES tblAccount(AccountID),
	QuestionID int FOREIGN KEY REFERENCES tblQuestion(QuestionID),
	AnswerBody nvarchar(MAX),
	TotalVote int DEFAULT 0,
	IsViewed int DEFAULT 0,	
	STT int DEFAULT 1,-- 1 is Normal, 0 is Block, -1 Destroy
	CreationDate datetime DEFAULT GETDATE(),
)

CREATE TABLE tblQuestionTag(
	QuestionID int FOREIGN KEY REFERENCES tblQuestion(QuestionID),
	TagID int FOREIGN KEY REFERENCES tblTag(TagID),
	PRIMARY KEY(QuestionID,TagID),
)

CREATE TABLE tblTagIgnore(
	AccountID int FOREIGN KEY REFERENCES tblAccount(AccountID),
	TagID int FOREIGN KEY REFERENCES tblTag(TagID),
	PRIMARY KEY(AccountID,TagID),
)

CREATE TABLE tblTagFavourite(
	AccountID int FOREIGN KEY REFERENCES tblAccount(AccountID),
	TagID int FOREIGN KEY REFERENCES tblTag(TagID),
	PRIMARY KEY(AccountID,TagID),
)

CREATE TABLE tblMessage(
	MessageID int IDENTITY PRIMARY KEY,
	AccountSendID int FOREIGN KEY REFERENCES tblAccount(AccountID),
	AccountReceiveID int FOREIGN KEY REFERENCES  tblAccount(AccountID),
	Content nvarchar(50),
)

CREATE TABLE tblVoteQuestion(
	AccountID int FOREIGN KEY REFERENCES tblAccount(AccountID),
	QuestionID int FOREIGN KEY REFERENCES tblQuestion(QuestionID),
	Voted int NOT NULL,
	PRIMARY KEY(QuestionID,AccountID),
)

CREATE TABLE tblVoteAnswer(
	AccountID int FOREIGN KEY REFERENCES tblAccount(AccountID),
	AnswerID int FOREIGN KEY REFERENCES tblAnswer(AnswerID),
	Voted int NOT NULL,
	PRIMARY KEY(AnswerID,AccountID),
)
GO

create proc gg
(@name nvarchar(20))
as 
begin
  if( @name is not null and @name<>N'')
     select 1 as 'RETURN'
  else
     select 0 as 'RETURN'
end

exec sp_PostQuestion 1006,N'em không ăn tham',N'không có gì cho ăn mà sao ăn tham',N'java',N'asp',N'',N'',N'gcode'

ALTER PROC sp_PostQuestion(
	@accountID int,
	@title nvarchar(200),
	@questionBody text,
	@tagName1 nvarchar(50),
	@tagName2 nvarchar(50),
	@tagName3 nvarchar(50),
	@tagName4 nvarchar(50),
	@tagName5 nvarchar(50)
)
AS
   BEGIN
      declare @Ispost int =0
	  declare @STT int=0
	  DECLARE @checkTime int, @creationdate datetime, @countQuestion int
	  SELECT @STT=STT FROM tblAccount WHERE AccountID = @accountID
	  if(@STT is not null)
	  begin
		if(@STT=-1 or @STT=0) select @Ispost=-1 --tai khoan bị khoa
		else
		  begin
				SELECT @countQuestion = COUNT(QuestionID) FROM tblQuestion WHERE AccountID = @accountID
				 IF (@countQuestion) > 0
					BEGIN
						SELECT TOP 1 @creationdate = CreationDate
						FROM tblQuestion 
						WHERE AccountID = @accountID 
						ORDER BY CreationDate DESC
						SET @checkTime = DATEDIFF(MINUTE,@creationdate,GETDATE())
						IF(@checkTime < 1)
				           select @Ispost=-2 --khong duoc phep dang neu chua du tren 30 phut
					end
		 end
	  end
      if(@Ispost=0)
			BEGIN
					SET NOCOUNT ON
					declare @err int=0
					BEGIN TRAN tran_createQuestion
						INSERT INTO tblQuestion(AccountID,Title,QuestionBody) VALUES(@accountID,@title,@questionBody)
						select @err=@err+@@ERROR
						if(@@ERROR=0)
							begin
										    
								declare @TagID1 int=0
								declare @TagID2 int=0
								declare @TagID3 int=0
								declare @TagID4 int=0
								declare @TagID5 int=0
								declare @QuestionID int
								declare @countTag int
								select top 1 @QuestionID=QuestionID from tblQuestion where AccountID=@accountID order by (QuestionID) desc
								if(@QuestionID is not null)
								begin
									select @countTag=count(TagID) from tblQuestionTag where QuestionID=@QuestionID
									if(@countTag=0)
									begin
										if(@tagName1 is not null and @tagName1<>N'' and @err=0)
											begin
												select @TagID1=TagID from tblTag where TagName=@tagName1
												if(@TagID1 is not null and @TagID1>0)
													begin
														insert into tblQuestionTag(QuestionID,TagID) values(@QuestionID,@TagID1)
														select @err=@err+@@ERROR
													end
												else
													begin
														insert into tblTag(TagName,DescriptionDetails) values(@TagName1,N'Bạn hãy chỉnh sửa lại thông tin của Tag')
														select @err=@err+@@ERROR
														if(@err=0)
															begin
																select @TagID1=TagID from tblTag where TagName=@tagName1
																if(@TagID1 is not null and @TagID1>0)
																	begin
																		insert into tblQuestionTag(QuestionID,TagID) values(@QuestionID,@TagID1)
																		select @err=@err+@@ERROR
																	end
															end
													end
											end
										if(@tagName2 is not null and @tagName2<>N'' and @err=0)
											begin
												select @TagID2=TagID from tblTag where TagName=@tagName2
												if(@TagID2 is not null and @TagID2>0)
													begin
														insert into tblQuestionTag(QuestionID,TagID) values(@QuestionID,@TagID2)
														select @err=@err+@@ERROR
													end
												else
													begin
														insert into tblTag(TagName,DescriptionDetails) values(@TagName2,N'Bạn hãy chỉnh sửa lại thông tin của Tag')
														select @err=@err+@@ERROR
														if(@err=0)
															begin
																select @TagID2=TagID from tblTag where TagName=@tagName2
																if(@TagID2 is not null and @TagID2>0)
																	begin
																		insert into tblQuestionTag(QuestionID,TagID) values(@QuestionID,@TagID2)
																		select @err=@err+@@ERROR
																	end
															end
													end
											end
										if(@tagName3 is not null and @tagName3<>N'' and @err=0)
										begin
											select @TagID3=TagID from tblTag where TagName=@tagName3
											if(@TagID3 is not null and @TagID3>0)
												begin
													insert into tblQuestionTag(QuestionID,TagID) values(@QuestionID,@TagID3)
													select @err=@err+@@ERROR
												end
											else
													begin
														insert into tblTag(TagName,DescriptionDetails) values(@TagName3,N'Bạn hãy chỉnh sửa lại thông tin của Tag')
														select @err=@err+@@ERROR
														if(@err=0)
															begin
																select @TagID3=TagID from tblTag where TagName=@tagName3
																if(@TagID3 is not null and @TagID3>0)
																	begin
																		insert into tblQuestionTag(QuestionID,TagID) values(@QuestionID,@TagID3)
																		select @err=@err+@@ERROR
																	end
															end
													end
										end
										if(@tagName4 is not null and @tagName4<>N'' and @err=0)
										begin
											select @TagID4=TagID from tblTag where TagName=@tagName4
											if(@TagID4 is not null and @TagID4>0)
												begin
													insert into tblQuestionTag(QuestionID,TagID) values(@QuestionID,@TagID4)
													select @err=@err+@@ERROR
												end
											else
													begin
														insert into tblTag(TagName,DescriptionDetails) values(@TagName4,N'Bạn hãy chỉnh sửa lại thông tin của Tag')
														select @err=@err+@@ERROR
														if(@err=0)
															begin
																select @TagID4=TagID from tblTag where TagName=@tagName4
																if(@TagID4 is not null and @TagID4>0)
																	begin
																		insert into tblQuestionTag(QuestionID,TagID) values(@QuestionID,@TagID4)
																		select @err=@err+@@ERROR
																	end
															end
													end
										end
										if(@tagName5 is not null and @tagName5<>N'' and @err=0)
										begin
											select @TagID5=TagID from tblTag where TagName=@tagName5
											if(@TagID5 is not null and @TagID5>0)
												begin
													insert into tblQuestionTag(QuestionID,TagID) values(@QuestionID,@TagID5)
													select @err=@err+@@ERROR
												end
											else
													begin
														insert into tblTag(TagName,DescriptionDetails) values(@TagName5,N'Bạn hãy chỉnh sửa lại thông tin của Tag')
														select @err=@err+@@ERROR
														if(@err=0)
															begin
																select @TagID5=TagID from tblTag where TagName=@tagName5
																if(@TagID5 is not null and @TagID5>0)
																	begin
																		insert into tblQuestionTag(QuestionID,TagID) values(@QuestionID,@TagID5)
																		select @err=@err+@@ERROR
																	end
															end
													end
										end
									end
									else select @err=@err+1
								end
								else
									select @err=@err+1
							end
						if(@err=0)
						    begin
								commit tran tran_createQuestion
								select 1 as 'RETURN'--thanh cong
							end
						else 
							begin
								rollback tran tran_createQuestion
								select -3 as 'RETURN'----RAISERROR(N'Có lỗi khi cập nhật vào cơ sở dữ liệu',16,1); 
								
							end
							print @err

						SET NOCOUNT OFF
				END
				
	  else if(@Ispost=-1)
	      select -1 as 'RETURN'--RAISERROR(N'Tài khoản đang bị khóa',16,1); 
	  else if(@Ispost=-2)
		select -2 as 'RETURN'--RAISERROR('Sau 30 phút mới đăng được',16,1);
   END
   GO



----------------------------
--------tim kiem bai viet gioi han cho thanh vien và visitor
alter proc searchPostLimit
(@txtSearch nvarchar(250),
@rowStart int,
@rowEnd int,
@IsLock int
)
as
begin
select * from (
select *,ROW_NUMBER() OVER (Order by [RANK] desc) AS RowNumber  from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join
(select [KEY],sum([RANK]) as 'RANK' from 
(
select * from FREETEXTTABLE(tblQuestion,Title,@txtSearch) as tblOut1
union all
select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch) as tblOut2
union all
select QuestionID as 'KEY',sum([RANK]) as 'RANK' 
from tblAnswer inner join 
FREETEXTTABLE(tblAnswer,AnswerBody,@txtSearch) 
as tblOut3
on tblAnswer.AnswerID=tblOut3.[KEY]  
group by QuestionID
) as tblOut4 group by [KEY]) as tblOut5
on tblOutxx.QuestionID=tblOut5.[KEY] ) as tblOut123 where tblOut123.RowNumber between @rowStart  and @rowEnd
end
----------------------------------------
alter proc sp_countSearchPostLimit
(@txtSearch nvarchar(250),
@IsLock int
)
as
begin
select count(QuestionID) as totalRow from (
(select QuestionID from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join
(select [KEY],sum([RANK]) as 'RANK' from 
(
select * from FREETEXTTABLE(tblQuestion,Title,@txtSearch) as tblOut1
union all
select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch) as tblOut2
union all
select QuestionID as 'KEY',sum([RANK]) as 'RANK' 
from tblAnswer inner join 
FREETEXTTABLE(tblAnswer,AnswerBody,@txtSearch) 
as tblOut3
on tblAnswer.AnswerID=tblOut3.[KEY]  
group by QuestionID
) as tblOut4 group by [KEY]) as tblOut5
on tblOutxx.QuestionID=tblOut5.[KEY] ) 
end
-------------------------------------------
----Tim kiem bai viet
alter proc searchPost
(@txtSearch nvarchar(250),
@rowStart int,
@rowEnd int)
as
begin
select * from (
select *,ROW_NUMBER() OVER (Order by [RANK] desc) AS RowNumber  from tblQuestion inner join
(select [KEY],sum([RANK]) as 'RANK' from 
(
select * from FREETEXTTABLE(tblQuestion,Title,@txtSearch) as tblOut1
union all
select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch) as tblOut2
union all
select QuestionID as 'KEY',sum([RANK]) as 'RANK' 
from tblAnswer inner join 
FREETEXTTABLE(tblAnswer,AnswerBody,@txtSearch) 
as tblOut3
on tblAnswer.AnswerID=tblOut3.[KEY]  
group by QuestionID
) as tblOut4 group by [KEY]) as tblOut5
on tblQuestion.QuestionID=tblOut5.[KEY] ) as tblOut123 where tblOut123.RowNumber between @rowStart  and @rowEnd
end
---
exec searchPost 'khong',2,4
-----------------------------count search post
alter proc sp_countSearchPost
(@txtSearch nvarchar(250))
as
begin
select  count([KEY]) as totalRow  from 
(
select [KEY],sum([RANK]) as 'RANK' from 
(
select * from FREETEXTTABLE(tblQuestion,Title,@txtSearch) as tblOut1
union all
select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch) as tblOut2
union all
select QuestionID as 'KEY',sum([RANK]) as 'RANK' 
from tblAnswer inner join 
FREETEXTTABLE(tblAnswer,AnswerBody,@txtSearch) 
as tblOut3
on tblAnswer.AnswerID=tblOut3.[KEY]  
group by QuestionID
) as tblOut4 group by [KEY]) as tblOut5
end
---
exec searchPost 'khong',1,5
exec searchPostLimit 'khong',1,5,-1
exec sp_countSearchPost 'khong'
exec sp_countSearchPostLimit 'khong',-1
-------------------------------gioi han question
---------------limit question
alter proc limitQuestion
(@QuestionID int,@IsLock int)
as
begin
update tblQuestion set IsLock=@IsLock where QuestionID=@QuestionID  --khoa question
end
---------------limit Answer
alter proc limitAnswer
(@AnswerID int,@STT int)
as
begin
update tblAnswer set STT=@STT where AnswerID=@AnswerID
end
--------------
-----------------------------khoa account
alter proc lockAccount
(@accountID int ,@type int)
as
begin
update tblAccount set STT=@type,LockDate=getdate() where AccountID=@accountID
end

------------------

---------------------------khi insert vao bang answer thi tang so cau tra loi cho cau hoi len
alter proc insertAnswer
(
@AccountID int,@QuestionID int,@AnswerBody text
)
as
begin
	declare @err int=0
	begin tran tran_insertAnswer
	insert into tblAnswer(AccountID,QuestionID,AnswerBody) values(@AccountID,@QuestionID,@AnswerBody)
	select @err=@err+@@ERROR
	if(@err=0)
		begin
			update tblQuestion set TotalAnswer=TotalAnswer+1 where QuestionID=@QuestionID
			select @err=@err+@@ERROR
		end
	if(@err=0)
		begin
			commit tran tran_insertAnswer
			select 1 as 'RETURN' --thanh cong
		end
	else
		begin
			rollback tran tran_insertAnswer
			select 0 as 'RETURN' ---loi thuc hien
		end
end


exec voteQuestion 37,1005,1
--------------
alter proc voteQuestion
(@questionID int,@accountID int,@Voted int)--@Voted =1 is up, @Voted=-1 is down
as
begin
	declare @vote int
	declare @IsLock int=0
	declare @AccountIDQuestion int
	select @IsLock=IsLock from tblQuestion where QuestionID=@questionID
	if(@IsLock=0)
	begin
	select @vote=Voted from tblVoteQuestion where QuestionID=@questionID and AccountID=@accountID
	
	select @AccountIDQuestion=AccountID  from tblQuestion where QuestionID=@questionID
	if(@AccountIDQuestion is not null and @accountID<>@AccountIDQuestion)
	begin
		declare @diem int
		declare @STT int
		declare @err int =1
		declare @AccountIDIsVote int
		declare @votePoint int=0
		declare @sumVote int=0
		select @diem=ReputationPoint,@STT=STT from tblAccount where AccountID=@accountID
		if(@diem is not null and  @diem>15 and @STT is not null and @STT=1)
			begin
				set nocount on
				
				if(@vote is not null)
					begin
						if(@vote<>@Voted)
						begin
							begin tran tran_voteQuestion
							select @err=0
							update tblVoteQuestion set Voted=Voted+@Voted where QuestionID=@questionID and AccountID=@accountID
							if(@@ERROR=0)
								begin
									select @AccountIDIsVote=AccountID from tblQuestion where QuestionID=@questionID
									if(@Voted>0) ---vote up
									   begin
											if(@vote<0) select @votePoint=2
											else if(@vote>0) select @votePoint=0
											else select @votePoint=5
									   end
									else
										begin
												if(@vote<0) select @votePoint=0
												else if(@vote>0) select @votePoint=-5
												else select @votePoint=-2
										end
									update tblAccount set ReputationPoint=ReputationPoint+@votePoint where AccountID=@AccountIDIsVote
									if(@@ERROR=0)
									  begin
											select  @sumVote=sum(Voted) from tblVoteQuestion where QuestionID=@questionID
											update tblQuestion set TotalVote=@sumVote where QuestionID=@questionID
									  end
								end
							select @err=@err+@@ERROR
							if(@err=0)
								begin
									commit tran tran_voteQuestion
									select 1 as 'RETURN' --thanh cong
								end
							else 
								begin
									rollback tran tran_voteQuestion
									select -3 as 'RETURN' --co loi trong qua trinh thuc hien
								end
						end
						else select 1 as 'RETURN'----thanh cong
					end
				else
					begin
						select @err=0
						begin tran tran_insertVoteQuestion
						insert into tblVoteQuestion(AccountID,QuestionID,Voted) values(@accountID,@questionID,@Voted)
						if(@@ERROR=0)
							begin
								if(@Voted>0)select @votePoint=5
								else select @votePoint=-2
								select @AccountIDIsVote=AccountID from tblQuestion where QuestionID=@questionID
								update tblAccount set ReputationPoint=ReputationPoint+@votePoint where AccountID=@AccountIDIsVote
								if(@@ERROR=0)
								  begin
										select  @sumVote=sum(Voted) from tblVoteQuestion where QuestionID=@questionID
										update tblQuestion set TotalVote=@sumVote where QuestionID=@questionID
								  end
							end
						select @err=@err+@@ERROR
						if(@err=0)
							begin
								commit tran tran_insertVoteQuestion
								select 1 as 'RETURN' --thanh cong
							end
						else 
							begin
								rollback tran tran_insertVoteQuestion
								select -3 as 'RETURN' --co loi trong qua trinh thuc hien
							end
					end
				set nocount off
			end
		else
			begin
				if(@diem is not null)
					begin
						if(@diem<15)
							select 0 as 'RETURN' --chua du uy tin
						else if(@STT=0 or @STT=-1)
							select -1 as 'RETURN'--tai khoan khong co quyen
					end 
				else 
				  select -2 as 'RETURN'  --tai khoan khong ton tai
			end 
	end
	else
	  select -4 as 'RETURN' --khong the tu vote

end
else select -5 as 'RETURN'--question bị khóa
end
exec voteAnswer 2,1005,-1
-------------------
alter proc voteAnswer
(@AnswerID int,@AccountID int,@Voted int)--@Voted =1 is up, @Voted=-1 is down
as
begin
	declare @vote int 

	select @vote=Voted from tblVoteAnswer where AnswerID=@AnswerID and AccountID=@accountID

	declare @AccountIDAnswer int
	select @AccountIDAnswer=AccountID from tblAnswer where AnswerID=@AnswerID
	if(@AccountIDAnswer is not null and @AccountIDAnswer<>@AccountID)
	begin
		declare @diem int
		declare @STT int
		declare @err int =1
		declare @AccountIDIsVote int
		declare @votePoint int=0
		declare @sumVote int=0
		select @diem=ReputationPoint,@STT=STT from tblAccount where AccountID=@AccountID
		if(@diem is not null and  @diem>=15 and @STT is not null and @STT=1)
			begin
				set nocount on
				if(@vote is not null)
				   begin
					if(@vote<>@Voted )
						begin
						select @err=0
							begin tran tran_voteAnswer
							update tblVoteAnswer set Voted=Voted+@Voted where AnswerID=@AnswerID and AccountID=@AccountID
							if(@@ERROR=0)
								begin
									
									select @sumVote=sum(Voted) from tblVoteAnswer where AnswerID=@AnswerID
									update tblAnswer set TotalVote=@sumVote where AnswerID=@AnswerID
									if(@@ERROR=0)
									begin
										select @AccountIDIsVote=AccountID from tblAnswer where AnswerID=@AnswerID
										if(@Voted>0) ---vote up
										   begin
												if(@vote<0) select @votePoint=2
												else if(@vote>0) select @votePoint=0
												else select @votePoint=10
										   end
										else
											begin
													if(@vote<0) select @votePoint=0
													else if(@vote>0) select @votePoint=-10
													else select @votePoint=-2
											end
										update tblAccount set ReputationPoint=ReputationPoint+@votePoint where AccountID=@AccountIDIsVote
										if(@@ERROR=0) 
											begin
												if(@votePoint=-2)
												   begin
														update tblAccount set ReputationPoint=ReputationPoint-1 where AccountID=@AccountID
												   end
											end
									end
								end
							select @err=@err+@@ERROR
							if(@err=0)
								begin
									commit tran tran_voteAnswer
									select 123 as 'RETURN' --thanh cong
								end
							else 
								begin
									rollback tran tran_voteAnswer
									select -3123 as 'RETURN' --co loi trong qua trinh thuc hien
								end
						end
						else
						select 135 as 'RETURN' --thanh cong
					end
					
				else
					begin
						select @err=0
						begin tran tran_insertVoteAnswer
						insert into tblVoteAnswer(AccountID,AnswerID,Voted) values(@AccountID,@AnswerID,@Voted)
						if(@@ERROR=0)
							begin
								select @sumVote=sum(Voted) from tblVoteAnswer where AnswerID=@AnswerID
								update tblAnswer set TotalVote=@sumVote where AnswerID=@AnswerID
								if(@@ERROR=0)
								begin
									if(@Voted>0)select @votePoint=10
									else select @votePoint=-2
									select @AccountIDIsVote=AccountID from tblAnswer where AnswerID=@AnswerID
									update tblAccount set ReputationPoint=ReputationPoint+@votePoint where AccountID=@AccountIDIsVote
									if(@@ERROR=0)
									  begin
											if(@votePoint<0)
											  begin
												update tblAccount set ReputationPoint=ReputationPoint-1 where AccountID=@AccountID
											 end
									  end
								end
							end
						select @err=@err+@@ERROR
						if(@err=0)
							begin
								commit tran tran_insertVoteAnswer
								select 111 as 'RETURN' --thanh cong
							end
						else 
							begin
								rollback tran tran_insertVoteAnswer
								select -3111 --co loi trong qua trinh thuc hien
							end
					end
				set nocount off
			end
		else
			begin
				if(@diem is not null)
					begin
						if(@diem<15)
							select 0 as 'RETURN' --chua du uy tin
						else if(@STT=0 or @STT=-1)
							select -1 as 'RETURN'--tai khoan khong co quyen
					end 
				else 
				  select -2 as 'RETURN'  --tai khoan khong ton tai
			end 
	end
	else select -4 as 'RETURN' --khong duoc vote chinh minh
end

----------------------- limit Tag
alter proc limitTag
(@TagID int,@STT int)
as
begin
update tblTag set STT=@STT where TagID=@TagID
end
---------------------
-----------------create account thanh cong return 1 that bai 0,-1

alter proc createAccount
(
@UserName nvarchar(50),@Pass nvarchar(50),@Email nvarchar(50)
)
as
begin
	declare @user nvarchar(50)
	declare @mail nvarchar(50)
	select @user=UserName,@mail=Email from tblAccount where UserName=@UserName
	if(@UserName is not null and @UserName<>N'')
	begin
		if(@user=@UserName)
			select -1 as 'RETURN'--trung ten dang nhap
		else if(@mail is not null and @mail=@Email)
			select 0  as 'RETURN'--trung email
		else
		begin
		  select 1 as 'RETURN' --thanh cong
			insert into tblAccount(UserName,Pass,Email) values(@UserName,@Pass,@Email)
			select @@ERROR as 'RETURN'
		end
	end
	else
	    select 2 as 'RETURN'--thong tin khong hop le
end
---------
 exec createAccount N'diep12355',N'123',N'add@gmail.com'
---insert tag
alter proc insertTag
(
@TagName nvarchar(50),@DescriptionDetails nvarchar(50)
)
as
begin
	declare @TagN nvarchar(50)
	select @TagN=TagName from tblTag where TagName=@TagName
	 if(@TagN is not null)
		select 0 as 'RETURN' --that bai
	 else
		begin
			select 1 as 'RETURN' --thanh cong
			insert into tblTag(TagName,DescriptionDetails) values(@TagName,@DescriptionDetails)
			select @@ERROR as 'RETURN'
		end
end
---

-------------get message
alter proc getMessage
(
@AccountID int,@AccountReceiveID int,@RowStart int,@RowEnd int
)
as
begin
if(@RowStart<@RowEnd)
	select top 10 ROW_NUMBER() over(order by MessageID desc) as OrdNumber,* from tblMessage where (AccountSendID=@AccountID and AccountReceiveID=@AccountReceiveID) or (AccountSendID=@AccountReceiveID and AccountReceiveID=@AccountID)
else
	select * from 	(select ROW_NUMBER() over(order by MessageID desc) as OrdNumber,* from tblMessage where (AccountSendID=@AccountID or AccountReceiveID=@AccountID) ) as tblOut where tblOut.OrdNumber between @RowStart and @RowEnd
end
-----insert Message
alter proc insertMessage
(
	@AccountSendID int,
	@AccountReceiveID int ,
	@Content nvarchar(50)
)
as
begin
	declare @err int=1
	declare @SendID int=0
	declare @ReceiveID int=0
	select @SendID=AccountID from tblAccount where AccountID=@AccountSendID
	select @ReceiveID=AccountID from tblAccount where AccountID=@AccountReceiveID
	if(@SendID is not null and @SendID>0)
	  begin
		 if(@ReceiveID is not null and @ReceiveID>0)
		    begin
				if(@SendID!=@ReceiveID)
					begin
						insert into tblMessage(AccountSendID,AccountReceiveID,Content) values(@AccountSendID,@AccountReceiveID,@Content)
						select @err=@@ERROR
					end
			end
	  end
	  if(@err>0)select 0 as 'RETURN' --that bai
	  else select 1 as 'RETURN' --thanh cong
end

exec insertMessage 1,2,N'sfsf'

--------update Question
alter proc updateQuestion
(
	@QuestionID int,
	@AccountID int,
	@Title nvarchar(200),
	@QuestionBody text,@IsLock int
)
as
begin
	declare @accID int=0
	declare @quesID int=0
	SET NOCOUNT ON
	select @accID=AccountID,@quesID=QuestionID from tblQuestion where QuestionID=@QuestionID
	if(@accID is not null and @accID=@AccountID)
	   begin
			
			begin tran tran_updateQuestion
			update tblQuestion set Title=@Title,QuestionBody=@QuestionBody,IsLock=@IsLock,EditDate=GETDATE() where QuestionID=@QuestionID
			if(@@ERROR=0) 
			  begin
					commit tran tran_updateQuestion
					select 1 as 'RETURN'--thanh cong
				end
			else
				begin
					rollback tran tran_updateQuestion
					select -1 as 'RETURN' --giao dich that bai
				end
	   end
	else
		select 0 as 'RETURN' ---that bai
		SET NOCOUNT OFF
end

-----view question
ALTER proc ViewQuestion
(
	@QuestionID int,
	@AccountID int
)
as
begin
	declare @accID int=0
	declare @quesID int=0
	declare @view int=0
	select @accID=AccountID,@quesID=QuestionID,@view=IsViewed from tblQuestion where QuestionID=@QuestionID
	if(@accID is not null and @accID=@AccountID and @view=0)
	   begin
			begin tran tran_viewQuestion
			update tblQuestion set IsViewed=1 where QuestionID=@QuestionID
			if(@@ERROR=0) 
			  begin
					commit tran tran_viewQuestion
					select 1 as 'RETURN'--thanh cong
				end
			else
				begin
					rollback tran tran_viewQuestion
					select -1 as 'RETURN' --giao dich that bai
				end
	   end
	else
		select 0 as 'RETURN' ---that bai
end

----------------
alter proc viewAnswer
(
	@AnswerID int,
	@AccountID int
)
as
begin
	declare @accID int=0
	declare @ansID int=0
	declare @view int=0
	select @accID=AccountID,@ansID=QuestionID,@view=IsViewed from tblAnswer where AnswerID=@AnswerID
	if(@accID is not null and @accID=@AccountID and @view=0)
	   begin
			begin tran tran_viewAnswer
			update tblAnswer set IsViewed=1 where AnswerID=@AnswerID
			if(@@ERROR=0) 
			  begin
					commit tran tran_viewAnswer
					select 1 as 'RETURN'--thanh cong
				end
			else
				begin
					rollback tran tran_viewAnswer
					select -1 as 'RETURN' --giao dich that bai
				end
	   end
	else
		select 0 as 'RETURN' ---that bai
end
----------------
alter proc updateAnswer
(
@AnswerID int,@AccountID int,@AnswerBody nvarchar(200)
)
as
begin
	declare @accID int=0
	declare @ansID int=0
	select @accID=AccountID,@ansID=AnswerID from tblAnswer where AnswerID=@AnswerID
	if(@accID is not null and @accID=@AccountID)
	   begin
			begin tran tran_updateAnswer
			update tblAnswer set AnswerBody=@AnswerBody where AnswerID=@AnswerID
			if(@@ERROR=0) 
			  begin
					commit tran tran_updateAnswer
					select 1 as 'RETURN'--thanh cong
				end
			else
				begin
					rollback tran tran_updateAnswer
					select -1 as 'RETURN' --giao dich that bai
				end
	   end
	else
		select 0 as 'RETURN' ---that bai
end






-----------------update account
alter proc updateAccount
@img nvarchar(50),
@DisplayName nvarchar(50),
@Email nvarchar(50),
@BirthDate datetime,
@Location nvarchar(50),
@AboutMe nvarchar(50),
@Career nvarchar(50),
@CompanyName nvarchar(50),
@AccountID int
as
begin
	declare @image int
	begin tran tran_updateAccount
	if(@img is null or @img='')
	--begin
		--select @image=img from tblAccount where AccountID=@AccountID
		--select @img=@image
	--end
	update [dbo].[tblAccount]
	set  DisplayName=@DisplayName,Email=@Email,BirthDate=@BirthDate,Location=@Location,AboutMe=@AboutMe,
	Career=@Career,CompanyName=@CompanyName
	where AccountID=@AccountID
	else
	update [dbo].[tblAccount]
	set  img =@img,DisplayName=@DisplayName,Email=@Email,BirthDate=@BirthDate,Location=@Location,AboutMe=@AboutMe,
	Career=@Career,CompanyName=@CompanyName
	where AccountID=@AccountID
	if(@@ERROR=0)
	  begin
			commit tran tran_updateAccount
			select 1 as 'RETURN'---thanh cong
	  end
	else
		begin
			rollback tran tran_updateAccount
			select 0 as 'RETURN'--that bai
		end
end


alter proc sp_searchQuestionBody
(
@txtSearch nvarchar(250),@orderby int,@type int,@rowStart int,@rowEnd int)
as
begin
if(@orderby is not null)
	begin
		if(@orderby=0) --xep theo CreationDate
			begin
				if (@type=0)
				select * from (select *,ROW_NUMBER() OVER (Order by CreationDate asc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				else
				select * from (select *,ROW_NUMBER() OVER (Order by CreationDate desc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				
			end
	else if(@orderby=1) -- TotalVote
	begin
		if (@type=0)
				select * from (select *,ROW_NUMBER() OVER (Order by TotalVote asc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				else
				select * from (select *,ROW_NUMBER() OVER (Order by TotalVote desc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				
		end
		else if(@orderby=2)-- TotalAnswer
			begin
					if (@type=0)
						select * from (select *,ROW_NUMBER() OVER (Order by TotalAnswer asc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						else
						select * from (select *,ROW_NUMBER() OVER (Order by TotalAnswer desc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						
			end
		else if(@orderby=3)-- TotalView
			begin
					if (@type=0)
						select * from (select *,ROW_NUMBER() OVER (Order by TotalView asc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						else
						select * from (select *,ROW_NUMBER() OVER (Order by TotalView desc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						
			end
		else if(@orderby=5)--rank
			begin
					if (@type=0)
						select * from (select *,ROW_NUMBER() OVER (Order by [rank] asc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						else
						select * from (select *,ROW_NUMBER() OVER (Order by [rank] desc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						
			end
		end 
	end

exec sp_searchQuestionBody 'khong',0,1,1,5
----------------------------search question body limit for user
exec sp_searchQuestionBodyLimit 'khong',0,1,1,3,0
---------------
alter proc sp_searchQuestionBodyLimit
(
@txtSearch nvarchar(250),@orderby int,@type int,@rowStart int,@rowEnd int,@IsLock int)
as
begin
if(@orderby is not null)
	begin
		if(@orderby=0) --xep theo CreationDate
			begin
				if (@type=0)
				select * from (select *,ROW_NUMBER() OVER (Order by CreationDate asc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				else
				select * from (select *,ROW_NUMBER() OVER (Order by CreationDate desc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				
			end
	else if(@orderby=1) -- TotalVote
	begin
		if (@type=0)
				select * from (select *,ROW_NUMBER() OVER (Order by TotalVote asc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				else
				select * from (select *,ROW_NUMBER() OVER (Order by TotalVote desc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				
		end
		else if(@orderby=2)-- TotalAnswer
			begin
					if (@type=0)
						select * from (select *,ROW_NUMBER() OVER (Order by TotalAnswer asc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						else
						select * from (select *,ROW_NUMBER() OVER (Order by TotalAnswer desc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						
			end
		else if(@orderby=3)-- TotalView
			begin
					if (@type=0)
						select * from (select *,ROW_NUMBER() OVER (Order by TotalView asc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						else
						select * from (select *,ROW_NUMBER() OVER (Order by TotalView desc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						
			end
		else if(@orderby=5)--rank
			begin
					if (@type=0)
						select * from (select *,ROW_NUMBER() OVER (Order by [rank] asc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						else
						select * from (select *,ROW_NUMBER() OVER (Order by [rank] desc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						
			end
		end 
	end
---------------------------------------
alter proc sp_searchQuestionTitle
(
@title nvarchar(200),@orderby int,@type int,@rowStart int,@rowEnd int)
as
begin

if(@orderby is not null)
	begin
		if(@orderby=0) --xep theo CreationDate
			begin
				if (@type=0)
				select * from (select *,ROW_NUMBER() OVER (Order by CreationDate asc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				else
				select * from (select *,ROW_NUMBER() OVER (Order by CreationDate desc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				
			end
	else if(@orderby=1) -- TotalVote
	begin
		if (@type=0)
				select * from (select *,ROW_NUMBER() OVER (Order by TotalVote asc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				else
				select * from (select *,ROW_NUMBER() OVER (Order by TotalVote desc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				
		end
		else if(@orderby=2)-- TotalAnswer
			begin
					if (@type=0)
						select * from (select *,ROW_NUMBER() OVER (Order by TotalAnswer asc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						else
						select * from (select *,ROW_NUMBER() OVER (Order by TotalAnswer desc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						
			end
		else if(@orderby=3)-- TotalView
			begin
					if (@type=0)
						select * from (select *,ROW_NUMBER() OVER (Order by TotalView asc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						else
						select * from (select *,ROW_NUMBER() OVER (Order by TotalView desc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						
			end
		else if(@orderby=5)--rank
			begin
					if (@type=0)
						select * from (select *,ROW_NUMBER() OVER (Order by [rank] asc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						else
						select * from (select *,ROW_NUMBER() OVER (Order by [rank] desc) AS RowNumber from tblQuestion inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						
			end
		end 

end



exec sp_searchQuestionTitle 'khong',0,1,1,5
----------------------------------------------------search tile limit
alter proc sp_searchQuestionTitleLimit
(
@title nvarchar(200),@orderby int,@type int,@rowStart int,@rowEnd int,@IsLock int)
as
begin
---(select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID)
if(@orderby is not null)
	begin
		if(@orderby=0) --xep theo CreationDate
			begin
				if (@type=0)
				select * from (select *,ROW_NUMBER() OVER (Order by CreationDate asc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				else
				select * from (select *,ROW_NUMBER() OVER (Order by CreationDate desc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				
			end
	else if(@orderby=1) -- TotalVote
	begin
		if (@type=0)
				select * from (select *,ROW_NUMBER() OVER (Order by TotalVote asc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				else
				select * from (select *,ROW_NUMBER() OVER (Order by TotalVote desc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
				
		end
		else if(@orderby=2)-- TotalAnswer
			begin
					if (@type=0)
						select * from (select *,ROW_NUMBER() OVER (Order by TotalAnswer asc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						else
						select * from (select *,ROW_NUMBER() OVER (Order by TotalAnswer desc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						
			end
		else if(@orderby=3)-- TotalView
			begin
					if (@type=0)
						select * from (select *,ROW_NUMBER() OVER (Order by TotalView asc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						else
						select * from (select *,ROW_NUMBER() OVER (Order by TotalView desc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						
			end
		else if(@orderby=5)--rank
			begin
					if (@type=0)
						select * from (select *,ROW_NUMBER() OVER (Order by [rank] asc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						else
						select * from (select *,ROW_NUMBER() OVER (Order by [rank] desc) AS RowNumber from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID) as tblOut1 where tblOut1.RowNumber between @rowStart and @rowEnd
						
			end
		end 

end
----------------count search question title limit
alter proc sp_countSearchQuestionTitleLimit
(
@title nvarchar(200),@IsLock int)
as
begin
select count([KEY]) as 'totalRow' from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join (select * from FREETEXTTABLE(tblQuestion,Title,@title)) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID
end
---
exec sp_countSearchQuestionTitleLimit 'khong',0
------------------------------------
alter proc sp_countSearchQuestionTitle
(
@title nvarchar(200))
as
begin
select count(tblOut.[KEY]) as 'totalRow' from FREETEXTTABLE(tblQuestion,Title,@title) as tblOut
end
--
alter proc sp_countsearchQuestionBody
(
@txtSearch nvarchar(250))
as
begin
select count(tblOut.[KEY]) as 'totalRow' from FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch) as tblOut
end

exec sp_countsearchQuestionBody N'khong'
----------------------
alter proc sp_countsearchQuestionBodyLimit
(
@txtSearch nvarchar(250),@IsLock int)
as
begin
--
select count([KEY]) as 'totalRow' from (select * from tblQuestion where IsLock<>@IsLock) as tblOutxx inner join FREETEXTTABLE(tblQuestion,QuestionBody,@txtSearch) as tblOut on tblOut.[KEY]=tblOutxx.QuestionID
end
--------------------
exec sp_countsearchQuestionBodyLimit N'khong',0
--------
alter function dbo.SplitString 
    (
        @str nvarchar(130), 
        @separator char(1)
    )
    returns table
    AS
    return (
        with tokens(p, a, b) AS (
            select 
                1, 
                1, 
                charindex(@separator, @str)
            union all
            select
                p + 1, 
                b + 1, 
                charindex(@separator, @str, b + 1)
            from tokens
            where b > 0
        )
        select
            p ROW,
            substring(
                @str, 
                a, 
                case when b > 0 then b-a ELSE 4000 end) 
            AS S
        from tokens
      )
    GO

	select * from tblTag where TagName in (select S from dbo.SplitString(N'java,con,hi',','))

create proc sp_searchTag
(
@tag1 nvarchar(25),
@tag2 nvarchar(25),
@tag3 nvarchar(25),
@tag4 nvarchar(25),
@tag5 nvarchar(25)
)

as
begin
		select * from tblTag where TagName in (@tag1,@tag2,@tag3,@tag4,@tag5)
end

alter function func_searchTagName
(
@tag1 nvarchar(25),
@tag2 nvarchar(25),
@tag3 nvarchar(25),
@tag4 nvarchar(25),
@tag5 nvarchar(25)
)
returns table
as return (select TagID from tblTag where TagName in (@tag1,@tag2,@tag3,@tag4,@tag5))
--------------------------tim kiem gioi han danh cho nguoi dung khong phai admin
alter function func_searchTagNameLimit
(
@tag1 nvarchar(25),
@tag2 nvarchar(25),
@tag3 nvarchar(25),
@tag4 nvarchar(25),
@tag5 nvarchar(25),
@STT int
)
returns table
as return (select TagID from tblTag where STT=@STT and TagName in (@tag1,@tag2,@tag3,@tag4,@tag5))
-------------------------
  
alter function func_searchTagNameQuestion
(
@tag1 nvarchar(25),
@tag2 nvarchar(25),
@tag3 nvarchar(25),
@tag4 nvarchar(25),
@tag5 nvarchar(25)
)
returns table
as return (select QuestionID as ID,count(tblQuestionTag.TagID) as [COUNT] from tblQuestionTag inner join (select TagID from tblTag where  TagName in (@tag1,@tag2,@tag3,@tag4,@tag5)) as tblOut on  tblQuestionTag.TagID=tblOut.TagID group by QuestionID)
--------------------------------------tim kiem gioi han danh cho nguoi dung
alter function func_searchTagNameQuestionLimit
(
@tag1 nvarchar(25),
@tag2 nvarchar(25),
@tag3 nvarchar(25),
@tag4 nvarchar(25),
@tag5 nvarchar(25),
@STT int
)
returns table
as return (select QuestionID as ID,count(tblQuestionTag.TagID) as [COUNT] from tblQuestionTag inner join (select TagID from tblTag where STT<>@STT and TagName in (@tag1,@tag2,@tag3,@tag4,@tag5)) as tblOut on  tblQuestionTag.TagID=tblOut.TagID group by QuestionID)
--------------------------------------
alter proc sp_countSearchTagNameQuestionLimit
(
@tag1 nvarchar(25),
@tag2 nvarchar(25),
@tag3 nvarchar(25),
@tag4 nvarchar(25),
@tag5 nvarchar(25),
@IsLock int,
@STT int
)
as
begin
select count(QuestionID) as totalRow from func_searchTagNameQuestionLimit(@tag1,@tag2,@tag3,@tag4,@tag5,@STT) as tblOut inner join (select QuestionID from tblQuestion where IsLock<>@IsLock) as tblOutxx on tblOut.ID=tblOutxx.QuestionID
end
----
select * from func_searchTagNameQuestionLimit('java','php','','','',1)
exec sp_countSearchTagNameQuestionLimit 'java','php','','','',0,1
-------------------------------
alter proc sp_countSearchTag
(
@tag1 nvarchar(25),
@tag2 nvarchar(25),
@tag3 nvarchar(25),
@tag4 nvarchar(25),
@tag5 nvarchar(25)
)
as
begin
select count(ID) as totalRow from func_searchTagNameQuestion(@tag1,@tag2,@tag3,@tag4,@tag5) as tblOut inner join tblQuestion on tblOut.ID=tblQuestion.QuestionID
end

select * from (select *,ROW_NUMBER() over(order by COUNT) as RowNumber from func_searchTagNameQuestion('java','php','','','') as tblOut inner join tblQuestion on tblOut.ID=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber  between 1 and 2

select QuestionID,count(tblQuestionTag.TagID) as [ROW] from tblQuestionTag inner join (select * from func_searchTagName('java','asp','','','')) as tblOut on tblQuestionTag.TagID=tblOut.TagID group by QuestionID

select * from func_searchTagNameQuestion('java','php','','','')

select * from tblTag where TagName in ('java','php')

select * from tblQuestionTag
select * from tblTag
select * from (
select *,ROW_NUMBER() OVER (Order by AccountID) AS RowNumber 
from tblAccount where ) as tblOut where tblOut.RowNumber between 2 and 3


