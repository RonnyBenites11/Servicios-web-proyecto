using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace appProyectoDSW.Services
{
    public interface IBus<T>
    {
        List<T> BusListar();
        void BusInsertar(T b);
        void BusActualizar(T b);
        void BusBaja(int codbus);
        T BusBuscar(int codbus);
    }
}
