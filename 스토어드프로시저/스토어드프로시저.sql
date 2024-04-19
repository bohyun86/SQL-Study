SET SQL_SAFE_UPDATES = 0;

delimiter $$
Create procedure userProc1(In userName varchar(10))
begin
	select * from usertbl where name = userName;
end $$
delimiter ;

call userProc1('조관우')

delimiter $$
Create procedure userProc2(
	IN userBirth INT,
    IN userHeight INT
)
begin
	select * from usertbl 
		where birthYear > userBirth and height > userHeight;
end $$
delimiter ;

call userProc2(1960, 178);
select * from usertbl;

drop procedure userProc2;

delimiter $$
Create procedure userProc3(
	IN txtvalue char(10),
    out outvalue INT
)
begin
	insert into testtbl values(null, txtvalue);
	select max(id) into outvalue from testtbl;
end $$
delimiter ;

create table if not exists testtbl(
	id int auto_increment primary key,
    txt char(10)
);

call userProc3 ('테스트값', @myValue);
select concat('현재 입력된 ID 값 ==>', @myValue);
select * from testtbl;

delimiter $$
Create procedure ifelseProc(
	IN userName varchar(10)
)
begin
	declare bYear INT;
    select birthYear into bYear from userTbl
		where name = userName;
	if (bYear >= 1980) Then 
		select '아직 젊군요..';
	else
		select '나이가 지긋하시네요.';
	end if;
end $$
delimiter ;

call ifelseProc('조용필');

delimiter $$
Create procedure caseProc(
	IN userName varchar(10)
)
begin
	declare bYear INT;
    declare tti char(3);
    select birthYear into bYear from userTbl
		where name = username;
	case
		when ( bYear%12 = 0) then	set tti = '원숭이';
        when ( bYear%12 = 1) then	set tti = '닭';
        when ( bYear%12 = 2) then	set tti = '개';
        when ( bYear%12 = 3) then	set tti = '돼지';
        when ( bYear%12 = 4) then	set tti = '쥐';
        when ( bYear%12 = 5) then	set tti = '소';
        when ( bYear%12 = 6) then	set tti = '호랑이';
        when ( bYear%12 = 7) then	set tti = '토끼';
        when ( bYear%12 = 8) then	set tti = '용';
        when ( bYear%12 = 9) then	set tti = '뱀';
        when ( bYear%12 = 10) then	set tti = '말';
        else set tti = '양';
	end case;
    select concat(username, '의 띠 ==>', tti);
end $$
delimiter ;

call caseproc ('김법수');

create table gugutbl (txt varchar(100));

delimiter $$
Create procedure whileProc()
begin
	declare str varchar(100);
    declare i int;
    declare k int;
    set i = 2;
    
    while (i < 10) do
		set str = '';
        set k = 1;
        while (k < 10) do
			set str = concat(str, ' ', i, 'x', k, '=', i*k);
            set k = k + 1;
		end while;
        set i = i + 1;
        insert into guguTBL values(str);
	end while;
end $$
delimiter ;

call whileproc();
select * from gugutbl;

delimiter $$
create procedure errorProc()
begin
	declare i int;
    declare hap int;
    declare savehap int;
    
    declare exit handler for 1264
    begin
		select concat('INT 오버플로 직전의 합계 --> ', saveHap);
        select concat('1+2+3+4+...+',i , '=오버플로');
	end;
    
    set i = 1;
    set hap = 0;
    
    while (true) do
		set savehap = hap;
        set hap = hap + i;
        set i = i + 1;
	end while;
end $$
delimiter ;

call errorproc();

select routine_name, routine_definition from information_schema.routines
	where routine_schema = 'sqldb' and routine_type = 'procedure';

show procedure status where db = 'sqldb';

show create procedure userproc1;

set global log_bin_trust_function_creators = 1;

