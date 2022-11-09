using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using appProyectoDSW.Entity;
using appProyectoDSW.Models;

namespace appProyectoDSW.Controllers
{
    public class RutaController : Controller
    {
        // GET: Ruta
        TerminalTerrestreDAO objTerminal = new TerminalTerrestreDAO();
        TerminalTerrestreDAO objTerminal2 = new TerminalTerrestreDAO();
        RutaDAO objRuta = new RutaDAO();
        
        public ActionResult Index()
        {
            return View(objRuta.RutaListar().ToList());
        }

        public ActionResult Details(int id)
        {
            return View(objRuta.RutaBuscar(id));
        }

        public ActionResult Create()
        {
            ViewBag.terminales1 = new SelectList(
                objTerminal.TerminalTerrestreListar(), "CodTerminal", "NombreTerminal");
            ViewBag.terminales2 = new SelectList(
                objTerminal2.TerminalTerrestreListar(), "CodTerminal", "NombreTerminal");
            return View();
        }

        [HttpPost]
        public ActionResult Create(Ruta reg)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    reg.CodRuta = 0;
                    objRuta.RutaInsertar(reg);
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
            Ruta rut = objRuta.RutaBuscar(id);
            ViewBag.terminales1 = new SelectList(
                objTerminal.TerminalTerrestreListar(), "CodTerminal", "NombreTerminal", rut.CodTerminalOrigen);
            ViewBag.terminales2 = new SelectList(
                objTerminal2.TerminalTerrestreListar(), "CodTerminal", "NombreTerminal", rut.CodTerminalDestino);
            return View(objRuta.RutaBuscar(id));
        }

        [HttpPost]
        public ActionResult Edit(Ruta reg)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    objRuta.RutaActualizar(reg);
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
            Ruta rut = objRuta.RutaBuscar(id);
            if (rut == null)
            {
                return HttpNotFound();
            }
            return View(rut);
        }

        //POST: Ruta/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            objRuta.RutaBaja(id);
            return RedirectToAction("Index");
        }
    }
}