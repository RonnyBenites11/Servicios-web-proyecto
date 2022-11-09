using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace appProyectoDSW.Services
{
    public interface IViaje<T>
    {
        List<T> ViajeListar();
        void ViajeInsertar(T v);
        void ViajeActualizar(T v);
        void ViajeBaja(int codviaje);
        T ViajeBuscar(int codviaje);
    }
}
