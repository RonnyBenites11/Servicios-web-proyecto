using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace appProyectoDSW.Entity
{
    public class Departamento
    {
        [Column("Cod_Departamento")]
        public int CodDepartamento { get; set; }
        [StringLength(50)]
        [Column("Nombre_Departamento")]
        public string NombreDepartamento { get; set; }        
    }
}