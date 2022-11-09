using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appProyectoDSW.Entity
{
    public class Bus
    {
        [Column("Cod_Bus")]
        public int CodBus { get; set; }
        [StringLength(100)]
        public string Registro { get; set; }
        [Column("Cantidad_Asientos")]
        public int CantidadAsientos { get; set; }
        [StringLength(100)]
        public string Marca { get; set; }
        [StringLength(100)]
        public string Modelo { get; set; }
    }
}