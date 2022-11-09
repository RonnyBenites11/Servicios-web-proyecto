using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appProyectoDSW.Entity
{
    public class Viaje
    {
        [Display(Name = "Codigo")]
        [Column("Cod_Viaje")]
        public int CodViaje { get; set; }

        [Display(Name = "Fecha Hora Partida")]
        [Column("Fecha_Hora_Partida")]
        public DateTime FechaHoraPartida { get; set; }

        [Display(Name = "Fecha Hora Llegada")]
        [Column("Fecha_Hora_Llegada")]
        public DateTime FechaHoraLlegada { get; set; }

        [Display(Name = "Ruta")]
        [Column("Cod_Ruta")]
        public int CodRuta { get; set; }

        [Display(Name = "Ruta")]
        public string Alias { get; set; }

        [Display(Name = "Bus")]
        [Column("Cod_Bus")]
        public int CodBus { get; set; }

        [Display(Name = "Bus")]
        public string Registro { get; set; }
    }
}