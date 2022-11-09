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
    public class TerminalTerrestreDAO : ITerminalTerrestre<TerminalTerrestre>
    {
        public void TerminalTerrestreActualizar(TerminalTerrestre tt)
        {
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_TerminalActualizar", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodTerminal", tt.CodTerminal);
            cmd.Parameters.AddWithValue("@nombreTerminal", tt.NombreTerminal);
            cmd.Parameters.AddWithValue("@codDepartamento", tt.CodDepartamento);
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

        public void TerminalTerrestreBaja(int codterminal)
        {
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_TerminalBaja", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodTerminal", codterminal);
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

        public TerminalTerrestre TerminalTerrestreBuscar(int codterminal)
        {
            TerminalTerrestre regterminal = null;
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_TerminalDetalle", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodTerminal", codterminal);
            try
            {
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    regterminal = new TerminalTerrestre()
                    {
                        CodTerminal = Convert.ToInt32(dr[0]),
                        NombreTerminal = dr[1].ToString(),
                        CodDepartamento = Convert.ToInt32(dr[2]),
                        NomDepartamento = dr[3].ToString()
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
            return regterminal;
        }

        public void TerminalTerrestreInsertar(TerminalTerrestre tt)
        {
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_TerminalInsertar", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nombreTerminal", tt.NombreTerminal);
            cmd.Parameters.AddWithValue("@codDepartamento", tt.CodDepartamento);
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

        public List<TerminalTerrestre> TerminalTerrestreListar()
        {
            List<TerminalTerrestre> lista = new List<TerminalTerrestre>();
            SqlConnection cn = dbAcceso.ConectaDB();
            SqlCommand cmd = new SqlCommand("Sp_TerminalListar", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    TerminalTerrestre reg = new TerminalTerrestre()
                    {
                        CodTerminal = Convert.ToInt32(dr[0]),
                        NombreTerminal = dr[1].ToString(),
                        CodDepartamento = Convert.ToInt32(dr[2]),
                        NomDepartamento = dr[3].ToString()
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