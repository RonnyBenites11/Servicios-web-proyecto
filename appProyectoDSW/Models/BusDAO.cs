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
    public class BusDAO : IBus<Bus>
    {
        public void BusActualizar(Bus b)
        {
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_BusActualizar", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodBus", b.CodBus);
            cmd.Parameters.AddWithValue("@registro", b.Registro);
            cmd.Parameters.AddWithValue("@cantidadAsientos", b.CantidadAsientos);
            cmd.Parameters.AddWithValue("@marca", b.Marca);
            cmd.Parameters.AddWithValue("@modelo", b.Modelo);
            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                cn.Close();
            }
        }

        public void BusBaja(int codbus)
        {
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_BusBaja", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodBus", codbus);
            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                cn.Close();
            }
        }

        public Bus BusBuscar(int codbus)
        {
            Bus regbus= null;
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_BusDetalle", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodBus", codbus);
            try
            {
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    regbus = new Bus()
                    {
                        CodBus = Convert.ToInt32(dr[0]),
                        Registro = dr[1].ToString(),
                        CantidadAsientos = Convert.ToInt32(dr[2]),
                        Marca = dr[3].ToString(),
                        Modelo = dr[4].ToString()
                    };
                }
                dr.Close();
                cn.Close();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                cn.Close();
            }
            return regbus;
        }

        public void BusInsertar(Bus b)
        {
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_BusInsertar", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@registro", b.Registro);
            cmd.Parameters.AddWithValue("@cantidadAsientos", b.CantidadAsientos);
            cmd.Parameters.AddWithValue("@marca", b.Marca);
            cmd.Parameters.AddWithValue("@modelo", b.Modelo);
            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                cn.Close();
            }
        }

        public List<Bus> BusListar()
        {
            List<Bus> lista = new List<Bus>();
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_BusListar", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Bus reg = new Bus()
                    {
                        CodBus = Convert.ToInt32(dr[0]),
                        Registro = dr[1].ToString(),
                        CantidadAsientos = Convert.ToInt32(dr[2]),
                        Marca = dr[3].ToString(),
                        Modelo = dr[4].ToString()
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