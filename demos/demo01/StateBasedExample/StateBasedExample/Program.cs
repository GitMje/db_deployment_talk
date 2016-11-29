using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace StateBasedExample
{
    public class Program
    {
        static void Main(string[] args)
        {
            var people = GetPeople();
            foreach (var person in people)
            {
                Console.WriteLine("FirstName = {person.FirstName}");
            }
        }

        // Really basic method to access some data in the db.
        public static List<Person> GetPeople()
        {
            var result = new List<Person>();

            using (var connection = new SqlConnection("user id=xxx;" +
                       "password=xxx;server=xxx;" +
                       "Trusted_Connection=yes;" +
                       "database=xxx; " +
                       "connection timeout=30"))
            {
                connection.Open();
                string sql = "SELECT [FirstName],[LastName],[Age] FROM dbo.Person;";
                using (var command = new SqlCommand(sql, connection))
                {
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var person = new Person
                            {
                                FirstName = reader["FirstName"].ToString(),
                                LastName = reader["LastName"].ToString(),
                                Age = Convert.ToInt32(reader["Age"])
                            };

                            result.Add(person);
                        }
                    }
                }
            }

            return result;
        }
    }
}
