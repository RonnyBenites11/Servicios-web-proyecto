using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace appProyectoDSW.Services
{
    public interface IDepartamento<T>
    {
        List<T> DepartamentoListar();
    }
}
