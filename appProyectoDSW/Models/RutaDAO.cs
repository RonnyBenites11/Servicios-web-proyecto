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
    public class RutaDAO : IRuta<Ruta>
    {
        public void RutaActualizar(Ruta r)
        {
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_RutaActualizar", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodRuta", r.CodRuta);
            cmd.Parameters.AddWithValue("@aliasRuta", r.AliasRuta);
            cmd.Parameters.AddWithValue("@tiempoPromedioRuta", r.TiempoPromedioRuta);
            cmd.Parameters.AddWithValue("@codTerminalOrigen", r.CodTerminalOrigen);
            cmd.Parameters.AddWithValue("@codTerminalDestino", r.CodTerminalDestino);
            cmd.Parameters.AddWithValue("@distanciaKm", r.DistanciaKm);
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

        public void RutaBaja(int codruta)
        {
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_RutaBaja", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodRuta", codruta);
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

        public Ruta RutaBuscar(int codruta)
        {
            Ruta regruta = null;
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_RutaDetalle", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodRuta", codruta);
            try
            {
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    regruta = new Ruta()
                    {
                        CodRuta = Convert.ToInt32(dr[0]),
                        AliasRuta = dr[1].ToString(),
                        TiempoPromedioRuta = Convert.ToInt32(dr[2]),
                        CodTerminalOrigen = Convert.ToInt32(dr[3]),
                        TerminalOrigen = dr[4].ToString(),
                        CodTerminalDestino = Convert.ToInt32(dr[5]),
                        TerminalDestino = dr[6].ToString(),
                        DistanciaKm = Convert.ToInt32(dr[7])
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
            return regruta;
        }

        public void RutaInsertar(Ruta r)
        {
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_RutaInsertar", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@aliasRuta", r.AliasRuta);
            cmd.Parameters.AddWithValue("@tiempoPromedioRuta", r.TiempoPromedioRuta);
            cmd.Parameters.AddWithValue("@codTerminalOrigen", r.CodTerminalOrigen);
            cmd.Parameters.AddWithValue("@codTerminalDestino", r.CodTerminalDestino);
            cmd.Parameters.AddWithValue("@distanciaKm", r.DistanciaKm);
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

        public List<Ruta> RutaListar()
        {
            List<Ruta> lista = new List<Ruta>();
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_RutaListar", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Ruta reg = new Ruta()
                    {
                        CodRuta = Convert.ToInt32(dr[0]),
                        AliasRuta = dr[1].ToString(),
                        TiempoPromedioRuta = Convert.ToInt32(dr[2]),
                        CodTerminalOrigen = Convert.ToInt32(dr[3]),
                        TerminalOrigen = dr[4].ToString(),
                        CodTerminalDestino = Convert.ToInt32(dr[5]),
                        TerminalDestino = dr[6].ToString(),
                        DistanciaKm = Convert.ToInt32(dr[7])
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