using System;
using System.Configuration;
using System.Linq;
using System.Reflection;
using DbUp;

namespace DbUpDeployer
{
    class Program
    {
        static int Main(string[] args)
        {
            var connectionString = args.FirstOrDefault()
                ?? ConfigurationManager.ConnectionStrings["DbUpExample"].ConnectionString
                ?? "Server=(LocalDB)\v11.0; Database=DbUpExample; Trusted_connection=true";

            Console.WriteLine("connectionString={0}", connectionString);

            EnsureDatabase.For.SqlDatabase(connectionString);

            var upgrader =
                DeployChanges.To
                    .SqlDatabase(connectionString)
                    .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly())
                    .LogToConsole()
                    .Build();
            Console.WriteLine("about to upgrade");
            var result = upgrader.PerformUpgrade();

            if (!result.Successful)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(result.Error);
                Console.ResetColor();
#if DEBUG
                Console.ReadLine();
#endif
                return -1;
            }

            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Success!");
            Console.ResetColor();
            return 0;
        }
    }
}
