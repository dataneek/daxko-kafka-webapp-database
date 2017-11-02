namespace SeedApp
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using Bogus;
    using Bogus.DataSets;
    using Microsoft.EntityFrameworkCore;
    using Microsoft.Extensions.Configuration;
    using Models;
    using System.Threading;

    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length == 0)
            {
                BuildInitialData();
            }
            else if (args.Length == 1 && args[0] == "--stream-checkins")
            {
                StreamCheckIns();
            }
            else
            {
                Console.Error.WriteLine("Invalid options.  --stream-checkins to simulate streaming checkins with existing data.  No parameters to build initial seed data.");
            }
        }

        static void BuildInitialData()
        {
            var connectionString = GetConnectionString();
            
            var members = GenerateRandomMembers(500);
            var locations = GenerateRandomLocations(20);
            var locationCheckins = GenerateRandomLocationCheckins(200, members, locations);

            var optionsBuilder = new DbContextOptionsBuilder<AppDbContext>();
            optionsBuilder.UseSqlServer(connectionString);

            using (var context = new AppDbContext(optionsBuilder.Options))
            {
                foreach (var member in members)
                    context.Members.Add(member);

                foreach (var location in locations)
                    context.Locations.Add(location);

                foreach (var t in locationCheckins)
                    context.LocationCheckins.Add(t);

                context.SaveChanges();
            }    
        }

        // Simulate streaming of checkins with existing members and locations
        static void StreamCheckIns()
        {
            var connectionString = GetConnectionString();
            
            var optionsBuilder = new DbContextOptionsBuilder<AppDbContext>();
            optionsBuilder.UseSqlServer(connectionString);

            using (var context = new AppDbContext(optionsBuilder.Options))
            {
                var members = context.Members.ToList();
                var locations = context.Locations.ToList();

                while (true)
                {
                    var locationCheckins = GenerateRandomLocationCheckins(new Random().Next(1, 2), members, locations);

                    foreach (var t in locationCheckins)
                        context.LocationCheckins.Add(t);

                    context.SaveChanges();

                    Thread.Sleep(new Random().Next(1000, 3500));

                    Console.WriteLine("Check In {0}", DateTime.Now);
                }
            }
        }

        static string GetConnectionString()
        {
            var configuration =
                new ConfigurationBuilder()
                    .SetBasePath(Directory.GetCurrentDirectory())
                    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                    .Build();

            return configuration.GetConnectionString("Default");
        }

        static Member[] GenerateRandomMembers(int numberToGenerate)
        {
            return
                Enumerable.Range(0, numberToGenerate)
                    .Select(t =>
                    {
                        var gender = (t % 2) == 0 ? Name.Gender.Male : Name.Gender.Female;

                        return
                            new Faker<Member>()
                                .RuleFor(r => r.FirstName, s => s.Name.FirstName(gender))
                                .RuleFor(r => r.LastName, s => s.Name.LastName(gender))
                                .RuleFor(r => r.Email, (s, e) => s.Internet.Email(e.FirstName, e.LastName))
                                .RuleFor(r => r.Phone, s => s.Phone.PhoneNumber())
                                .RuleFor(r => r.Birthdate, s => s.Person.DateOfBirth)
                                .RuleFor(r => r.Gender, (Gender)gender)
                                .Generate();
                    })
                    .ToArray();
        }

        static Location[] GenerateRandomLocations(int numberToGenerate)
        {
            string[] suffixes = new[] { "YMCA", "Community Center" };

            return
                Enumerable.Range(0, numberToGenerate)
                    .Select(t =>
                    {
                        return
                            new Faker<Location>()
                                 .RuleFor(r => r.LocationName, s => s.Address.City() + " " + s.PickRandom(suffixes))
                                 .Generate();
                    })
                    .ToArray();
        }

        static LocationCheckin[] GenerateRandomLocationCheckins(int numberToGenerate, IEnumerable<Member> members, IEnumerable<Location> locations)
        {
            var random = new Randomizer();
            return
                Enumerable.Range(0, numberToGenerate)
                    .Select(t =>
                    {
                        return
                            new Faker<LocationCheckin>()
                                .RuleFor(r => r.Member, s => s.PickRandom(members))
                                .RuleFor(r => r.Location, s => s.PickRandom(locations))
                                .RuleFor(r => r.CheckinCompleted, s => s.Date.Between(DateTime.Now.AddYears(-1), DateTime.Now))
                                .Generate();
                    })
                    .ToArray();
        }
    }
}