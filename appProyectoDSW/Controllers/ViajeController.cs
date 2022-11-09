using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using appProyectoDSW.Entity;
using appProyectoDSW.Models;

namespace appProyectoDSW.Controllers
{
    public class ViajeController : Controller
    {
        // GET: Viaje
        RutaDAO objRuta = new RutaDAO();
        BusDAO objBus = new BusDAO();
        ViajeDAO objViaje = new ViajeDAO();

        public ActionResult Index()
        {
            return View(objViaje.ViajeListar().ToList());
        }

        public ActionResult Details(int id)
        {
            return View(objViaje.ViajeBuscar(id));
        }

        public ActionResult Create()
        {
            ViewBag.rutas = new SelectList(
                objRuta.RutaListar(), "CodRuta", "AliasRuta");
            ViewBag.buses = new SelectList(
                objBus.BusListar(), "CodBus", "Registro");
            return View();
        }

        [HttpPost]
        public ActionResult Create(Viaje reg)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    reg.CodViaje = 0;
                    objViaje.ViajeInsertar(reg);
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
            Viaje via = objViaje.ViajeBuscar(id);
            ViewBag.rutas = new SelectList(
                objRuta.RutaListar(), "CodRuta", "AliasRuta", via.CodRuta);
            ViewBag.buses = new SelectList(
                objBus.BusListar(), "CodBus", "Registro", via.CodBus);
            return View(objViaje.ViajeBuscar(id));
        }

        [HttpPost]
        public ActionResult Edit(Viaje reg)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    objViaje.ViajeActualizar(reg);
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
            Viaje via = objViaje.ViajeBuscar(id);
            if (via == null)
            {
                return HttpNotFound();
            }
            return View(via);
        }

        //POST: Viaje/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            objViaje.ViajeBaja(id);
            return RedirectToAction("Index");
        }
    }
}