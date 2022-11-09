using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace appProyectoDSW.Services
{
    public interface ITerminalTerrestre<T>
    {
        List<T> TerminalTerrestreListar();
        void TerminalTerrestreInsertar(T tt);
        void TerminalTerrestreActualizar(T tt);
        void TerminalTerrestreBaja(int codterminal);
        T TerminalTerrestreBuscar(int codterminal);
    }
}
