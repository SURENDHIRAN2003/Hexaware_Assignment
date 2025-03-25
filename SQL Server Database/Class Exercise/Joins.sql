Use TestDB
Select *	from  Trainees
Select * from Skill
Select * from Trainees inner join Skill on Skill.Id=Trainees.Id
Select * from Trainees left join Skill on Skill.Id=Trainees.Id
Select * from Trainees right join Skill on Skill.Id=Trainees.Id
where Skill.Id is null