using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace appProyectoDSW.DataBase
{
    public class dbAcceso
    {
        public static SqlConnection ConectaDB()
        {
            SqlConnection cn = new SqlConnection(
                ConfigurationManager.ConnectionStrings["Base"].ConnectionString);
            return cn;
        }
    }
}