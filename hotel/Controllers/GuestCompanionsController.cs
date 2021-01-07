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
    public class GuestCompanionsController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: GuestCompanions
        public ActionResult Index()
        {
            var guestCompanion = db.GuestCompanion.Include(g => g.Reservation);
            return View(guestCompanion.ToList());
        }

        // GET: GuestCompanions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GuestCompanion guestCompanion = db.GuestCompanion.Find(id);
            if (guestCompanion == null)
            {
                return HttpNotFound();
            }
            return View(guestCompanion);
        }

        // GET: GuestCompanions/Create
        public ActionResult Create()
        {
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID");
            return View();
        }

        // POST: GuestCompanions/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "companionID,name,lastName,DOB,email,reservationID")] GuestCompanion guestCompanion)
        {
            if (ModelState.IsValid)
            {
                db.GuestCompanion.Add(guestCompanion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID", guestCompanion.reservationID);
            return View(guestCompanion);
        }

        // GET: GuestCompanions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GuestCompanion guestCompanion = db.GuestCompanion.Find(id);
            if (guestCompanion == null)
            {
                return HttpNotFound();
            }
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID", guestCompanion.reservationID);
            return View(guestCompanion);
        }

        // POST: GuestCompanions/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "companionID,name,lastName,DOB,email,reservationID")] GuestCompanion guestCompanion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(guestCompanion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID", guestCompanion.reservationID);
            return View(guestCompanion);
        }

        // GET: GuestCompanions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GuestCompanion guestCompanion = db.GuestCompanion.Find(id);
            if (guestCompanion == null)
            {
                return HttpNotFound();
            }
            return View(guestCompanion);
        }

        // POST: GuestCompanions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            GuestCompanion guestCompanion = db.GuestCompanion.Find(id);
            db.GuestCompanion.Remove(guestCompanion);
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
