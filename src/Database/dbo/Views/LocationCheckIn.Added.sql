create view [LocationCheckIn.Added]
as

select Id = ci.LocationCheckinId, ci.LocationId, ci.MemberId, ci.Created, l.LocationName, m.FirstName, m.LastName, m.Email, m.Birthdate, m.Phone from LocationCheckIn ci
	join Location l on l.LocationId = ci.LocationId
	join Member m on m.MemberId = ci.MemberId