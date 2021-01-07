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
    [Authorize]
    public class ReservedFromsController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: ReservedFroms
        public ActionResult Index()
        {
            return View(db.ReservedFrom.ToList());
        }

        // GET: ReservedFroms/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReservedFrom reservedFrom = db.ReservedFrom.Find(id);
            if (reservedFrom == null)
            {
                return HttpNotFound();
            }
            return View(reservedFrom);
        }

        // GET: ReservedFroms/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ReservedFroms/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "reservedFromID,reservationMethod")] ReservedFrom reservedFrom)
        {
            if (ModelState.IsValid)
            {
                db.ReservedFrom.Add(reservedFrom);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(reservedFrom);
        }

        // GET: ReservedFroms/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReservedFrom reservedFrom = db.ReservedFrom.Find(id);
            if (reservedFrom == null)
            {
                return HttpNotFound();
            }
            return View(reservedFrom);
        }

        // POST: ReservedFroms/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "reservedFromID,reservationMethod")] ReservedFrom reservedFrom)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservedFrom).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(reservedFrom);
        }

        // GET: ReservedFroms/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReservedFrom reservedFrom = db.ReservedFrom.Find(id);
            if (reservedFrom == null)
            {
                return HttpNotFound();
            }
            return View(reservedFrom);
        }

        // POST: ReservedFroms/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ReservedFrom reservedFrom = db.ReservedFrom.Find(id);
            db.ReservedFrom.Remove(reservedFrom);
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
