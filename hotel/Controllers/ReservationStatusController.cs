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
    public class ReservationStatusController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: ReservationStatus
        public ActionResult Index()
        {
            return View(db.ReservationStatus.ToList());
        }

        // GET: ReservationStatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReservationStatus reservationStatus = db.ReservationStatus.Find(id);
            if (reservationStatus == null)
            {
                return HttpNotFound();
            }
            return View(reservationStatus);
        }

        // GET: ReservationStatus/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ReservationStatus/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "reservationStatusID,status")] ReservationStatus reservationStatus)
        {
            if (ModelState.IsValid)
            {
                db.ReservationStatus.Add(reservationStatus);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(reservationStatus);
        }

        // GET: ReservationStatus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReservationStatus reservationStatus = db.ReservationStatus.Find(id);
            if (reservationStatus == null)
            {
                return HttpNotFound();
            }
            return View(reservationStatus);
        }

        // POST: ReservationStatus/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "reservationStatusID,status")] ReservationStatus reservationStatus)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservationStatus).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(reservationStatus);
        }

        // GET: ReservationStatus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReservationStatus reservationStatus = db.ReservationStatus.Find(id);
            if (reservationStatus == null)
            {
                return HttpNotFound();
            }
            return View(reservationStatus);
        }

        // POST: ReservationStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ReservationStatus reservationStatus = db.ReservationStatus.Find(id);
            db.ReservationStatus.Remove(reservationStatus);
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
