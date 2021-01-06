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
    public class ReservationComplaintsController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: ReservationComplaints
        public ActionResult Index()
        {
            var reservationComplaint = db.ReservationComplaint.Include(r => r.Departament).Include(r => r.Reservation);
            return View(reservationComplaint.ToList());
        }

        // GET: ReservationComplaints/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReservationComplaint reservationComplaint = db.ReservationComplaint.Find(id);
            if (reservationComplaint == null)
            {
                return HttpNotFound();
            }
            return View(reservationComplaint);
        }

        // GET: ReservationComplaints/Create
        public ActionResult Create()
        {
            ViewBag.departamentID = new SelectList(db.Departament, "departamentID", "type");
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID");
            return View();
        }

        // POST: ReservationComplaints/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "reservationID,comment,departamentID")] ReservationComplaint reservationComplaint)
        {
            if (ModelState.IsValid)
            {
                reservationComplaint.dateComplaint = DateTime.Now;
                db.ReservationComplaint.Add(reservationComplaint);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.departamentID = new SelectList(db.Departament, "departamentID", "type", reservationComplaint.departamentID);
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID", reservationComplaint.reservationID);
            return View(reservationComplaint);
        }

        // GET: ReservationComplaints/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReservationComplaint reservationComplaint = db.ReservationComplaint.Find(id);
            if (reservationComplaint == null)
            {
                return HttpNotFound();
            }
            ViewBag.departamentID = new SelectList(db.Departament, "departamentID", "type", reservationComplaint.departamentID);
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID", reservationComplaint.reservationID);
            return View(reservationComplaint);
        }

        // POST: ReservationComplaints/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "complaintID,reservationID,comment,dateComplaint,departamentID")] ReservationComplaint reservationComplaint)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservationComplaint).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.departamentID = new SelectList(db.Departament, "departamentID", "type", reservationComplaint.departamentID);
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID", reservationComplaint.reservationID);
            return View(reservationComplaint);
        }

        // GET: ReservationComplaints/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReservationComplaint reservationComplaint = db.ReservationComplaint.Find(id);
            if (reservationComplaint == null)
            {
                return HttpNotFound();
            }
            return View(reservationComplaint);
        }

        // POST: ReservationComplaints/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ReservationComplaint reservationComplaint = db.ReservationComplaint.Find(id);
            db.ReservationComplaint.Remove(reservationComplaint);
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
