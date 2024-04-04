
desc employees;

-- 연습문제 1
insert into employees
values (500001, "1990-01-01", "Jamie", "Reyes", "F", "2023-04-01");

insert into employees
values (500002, "1985-02-15", "Alex", "Smith", "M", "2023-04-01"),
    (500003, "1978-07-22", "Maria", "Garcia", "F", "2023-04-02");


-- 연습문제 2
use LibraryManagement;

desc Members;
select * from members;

insert into Members (FirstName, LastName, Email, MembershipDate)
values ("Alice", "Johnson", "alice.johnson@example.com", current_date()),
		("Bob", "Smith", "bob.smith@example.com", current_date());
        
select * from books;

insert into books (title, author, publishedyear, genre)
values ("abc", "author1", "2010", "romance");

desc borrowrecords;
select * from borrowrecords;

insert into borrowrecords(memberid, bookid, borrowdate, returndate)
values (1, 1, "2023-03-01", "2023-03-15");