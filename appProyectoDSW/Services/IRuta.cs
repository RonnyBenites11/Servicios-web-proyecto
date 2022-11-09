using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace appProyectoDSW.Services
{
    public interface IRuta<T>
    {
        List<T> RutaListar();
        void RutaInsertar(T r);
        void RutaActualizar(T r);
        void RutaBaja(int codruta);
        T RutaBuscar(int codruta);
    }
}
