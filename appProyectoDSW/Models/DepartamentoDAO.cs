using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using appProyectoDSW.Entity;
using appProyectoDSW.Services;

using appProyectoDSW.DataBase;
using System.Data.SqlClient;
using System.Data;

namespace appProyectoDSW.Models
{
    public class DepartamentoDAO : IDepartamento<Departamento>
    {
        public List<Departamento> DepartamentoListar()
        {
            List<Departamento> lista = new List<Departamento>();
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_DepartamentoListar", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Departamento reg = new Departamento()
                    {
                        CodDepartamento = Convert.ToInt32(dr[0]),
                        NombreDepartamento = dr[1].ToString()
                    };
                    lista.Add(reg);
                }
                dr.Close();
                cn.Close();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return lista;
        }
    }
}