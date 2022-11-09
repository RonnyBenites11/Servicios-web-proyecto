using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appProyectoDSW.Entity
{
    public class Ruta
    {
        [Display(Name = "Codigo")]
        [Column("Cod_Ruta")]
        public int CodRuta { get; set; }
        [StringLength(100)]
        [Display(Name = "Alias Ruta")]
        [Column("Alias_Ruta")]
        public string AliasRuta { get; set; }
        [Display(Name = "Tiempo Promedio")]
        [Column("Tiempo_Promedio_Ruta")]
        public int TiempoPromedioRuta { get; set; }
        [Display(Name = "Terminal Origen")]
        [Column("Cod_Terminal_Origen")]
        public int CodTerminalOrigen { get; set; }
        [Display(Name = "Terminal Origen")]
        public string TerminalOrigen { get; set; }
        [Display(Name = "Terminal Destino")]
        [Column("Cod_Terminal_Destino")]
        public int CodTerminalDestino { get; set; }
        [Display(Name = "Terminal Destino")]
        public string TerminalDestino { get; set; }
        [Display(Name = "Distancia (Km)")]
        public double DistanciaKm { get; set; }
    }
}