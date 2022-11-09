using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using appProyectoDSW.Entity;
using appProyectoDSW.Models;

namespace appProyectoDSW.Controllers
{
    public class BusController : Controller
    {
        // GET: Bus
        BusDAO objBus = new BusDAO();
        
        public ActionResult Index()
        {
            return View(objBus.BusListar().ToList());
        }

        public ActionResult Details(int id)
        {
            return View(objBus.BusBuscar(id));
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Bus reg)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    reg.CodBus = 0;
                    objBus.BusInsertar(reg);
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
            Bus bu = objBus.BusBuscar(id);
            return View(objBus.BusBuscar(id));
        }

        [HttpPost]
        public ActionResult Edit(Bus reg)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    objBus.BusActualizar(reg);
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
            Bus bu = objBus.BusBuscar(id);
            if (bu == null)
            {
                return HttpNotFound();
            }
            return View(bu);
        }

        //POST: Bus/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            objBus.BusBaja(id);
            return RedirectToAction("Index");
        }
    }
}