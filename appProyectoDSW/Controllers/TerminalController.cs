using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using appProyectoDSW.Entity;
using appProyectoDSW.Models;

namespace appProyectoDSW.Controllers
{
    public class TerminalController : Controller
    {
        // GET: Terminal
        DepartamentoDAO objDepartamento = new DepartamentoDAO();
        TerminalTerrestreDAO objTerminal = new TerminalTerrestreDAO();
        
        public ActionResult Index()
        {
            return View(objTerminal.TerminalTerrestreListar().ToList());
        }

        public ActionResult Details(int id)
        {
            return View(objTerminal.TerminalTerrestreBuscar(id));
        }

        public ActionResult Create()
        {
            ViewBag.departamentos = new SelectList(
                objDepartamento.DepartamentoListar(), "CodDepartamento", "NombreDepartamento");
            return View();
        }

        [HttpPost]
        public ActionResult Create(TerminalTerrestre reg)
        {
            try
            {
                reg.CodTerminal = 1;
                if (ModelState.IsValid)
                {
                    objTerminal.TerminalTerrestreInsertar(reg);
                    return RedirectToAction("Index");
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Edit(int id)
        {
            TerminalTerrestre ter = objTerminal.TerminalTerrestreBuscar(id);
            ViewBag.departamentos = new SelectList(
                objDepartamento.DepartamentoListar(), "CodDepartamento", "NombreDepartamento", ter.CodDepartamento);
            return View(objTerminal.TerminalTerrestreBuscar(id));
        }

        [HttpPost]
        public ActionResult Edit(TerminalTerrestre reg)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    objTerminal.TerminalTerrestreActualizar(reg);
                    return RedirectToAction("Index");
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Delete(int id)
        {
            TerminalTerrestre ter = objTerminal.TerminalTerrestreBuscar(id);
            if (ter == null)
            {
                return HttpNotFound();
            }
            return View(ter);
        }

        //POST: Producto/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            objTerminal.TerminalTerrestreBaja(id);
            return RedirectToAction("Index");
        }
    }
}