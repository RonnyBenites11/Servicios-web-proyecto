using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appProyectoDSW.Entity
{
    public class TerminalTerrestre
    {
        [Column("Cod_Terminal")]
        public int CodTerminal { get; set; }
        [StringLength(100, ErrorMessage ="Longitud Maxima 100 caracteres")]
        [Column("Nombre_Terminal")]
        public string NombreTerminal { get; set; }
        [Column("Cod_Departamento")]
        public int CodDepartamento { get; set; }
        public string NomDepartamento { get; set; }
    }
}