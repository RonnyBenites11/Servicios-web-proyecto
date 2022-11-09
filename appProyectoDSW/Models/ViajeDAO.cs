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
    public class ViajeDAO : IViaje<Viaje>
    {
        public void ViajeActualizar(Viaje v)
        {
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_ViajeActualizar", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodViaje", v.CodViaje);
            cmd.Parameters.AddWithValue("@fechaHoraPartida", v.FechaHoraPartida);
            cmd.Parameters.AddWithValue("@fechaHoraLlegada", v.FechaHoraLlegada);
            cmd.Parameters.AddWithValue("@codRuta", v.CodRuta);
            cmd.Parameters.AddWithValue("@codBus", v.CodBus);
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

        public void ViajeBaja(int codviaje)
        {
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_ViajeBaja", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodViaje", codviaje);
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

        public Viaje ViajeBuscar(int codviaje)
        {
            Viaje regViaje = null;
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_ViajeDetalle", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodViaje", codviaje);
            try
            {
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    regViaje = new Viaje()
                    {
                        CodViaje = Convert.ToInt32(dr[0]),
                        FechaHoraPartida = Convert.ToDateTime(dr[1]),
                        FechaHoraLlegada = Convert.ToDateTime(dr[2]),
                        CodRuta = Convert.ToInt32(dr[3]),
                        Alias = dr[4].ToString(),
                        CodBus = Convert.ToInt32(dr[5]),
                        Registro = dr[6].ToString()
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
            return regViaje;
        }

        public void ViajeInsertar(Viaje v)
        {
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_ViajeInsertar", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fechaHoraPartida", v.FechaHoraPartida);
            cmd.Parameters.AddWithValue("@fechaHoraLlegada", v.FechaHoraLlegada);
            cmd.Parameters.AddWithValue("@codRuta", v.CodRuta);
            cmd.Parameters.AddWithValue("@codBus", v.CodBus);
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

        public List<Viaje> ViajeListar()
        {
            List<Viaje> lista = new List<Viaje>();
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_ViajeListar", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Viaje reg = new Viaje()
                    {
                        CodViaje = Convert.ToInt32(dr[0]),
                        FechaHoraPartida = Convert.ToDateTime(dr[1]),
                        FechaHoraLlegada = Convert.ToDateTime(dr[2]),
                        CodRuta = Convert.ToInt32(dr[3]),
                        Alias = dr[4].ToString(),
                        CodBus = Convert.ToInt32(dr[5]),
                        Registro = dr[6].ToString()
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