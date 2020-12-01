using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using hotel.Models;

namespace hotel.Controllers
{
    public class BonificationsController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: Bonifications
        public ActionResult Index()
        {
            var bonification = db.Bonification.Include(b => b.Employee).Include(b => b.TypeOfBonification);
            return View(bonification.ToList());
        }

        // GET: Bonifications/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bonification bonification = db.Bonification.Find(id);
            if (bonification == null)
            {
                return HttpNotFound();
            }
            return View(bonification);
        }

        // GET: Bonifications/Create
        public ActionResult Create()
        {
            ViewBag.employeeID = new SelectList(db.Employee, "employeeID", "name");
            ViewBag.typeOfBonificationID = new SelectList(db.TypeOfBonification, "typeOfBonificationID", "typeOfBonificationID");
            return View();
        }

        // POST: Bonifications/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "bonificationID,employeeID,typeOfBonificationID")] Bonification bonification)
        {
            if (ModelState.IsValid)
            {
                db.Bonification.Add(bonification);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.employeeID = new SelectList(db.Employee, "employeeID", "name", bonification.employeeID);
            ViewBag.typeOfBonificationID = new SelectList(db.TypeOfBonification, "typeOfBonificationID", "typeOfBonificationID", bonification.typeOfBonificationID);
            return View(bonification);
        }

        // GET: Bonifications/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bonification bonification = db.Bonification.Find(id);
            if (bonification == null)
            {
                return HttpNotFound();
            }
            ViewBag.employeeID = new SelectList(db.Employee, "employeeID", "name", bonification.employeeID);
            ViewBag.typeOfBonificationID = new SelectList(db.TypeOfBonification, "typeOfBonificationID", "typeOfBonificationID", bonification.typeOfBonificationID);
            return View(bonification);
        }

        // POST: Bonifications/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "bonificationID,employeeID,typeOfBonificationID")] Bonification bonification)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bonification).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.employeeID = new SelectList(db.Employee, "employeeID", "name", bonification.employeeID);
            ViewBag.typeOfBonificationID = new SelectList(db.TypeOfBonification, "typeOfBonificationID", "typeOfBonificationID", bonification.typeOfBonificationID);
            return View(bonification);
        }

        // GET: Bonifications/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bonification bonification = db.Bonification.Find(id);
            if (bonification == null)
            {
                return HttpNotFound();
            }
            return View(bonification);
        }

        // POST: Bonifications/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Bonification bonification = db.Bonification.Find(id);
            db.Bonification.Remove(bonification);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
