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
    public class ReservationReviewsController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: ReservationReviews
        public ActionResult Index()
        {
            var reservationReview = db.ReservationReview.Include(r => r.Departament).Include(r => r.Reservation);
            return View(reservationReview.ToList());
        }

        // GET: ReservationReviews/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReservationReview reservationReview = db.ReservationReview.Find(id);
            if (reservationReview == null)
            {
                return HttpNotFound();
            }
            return View(reservationReview);
        }

        // GET: ReservationReviews/Create
        public ActionResult Create()
        {
            ViewBag.departamentID = new SelectList(db.Departament, "departamentID", "type");
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID");
            return View();
        }

        // POST: ReservationReviews/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "reviewID,reviewRoom,reservationID,departamentID")] ReservationReview reservationReview)
        {
            if (ModelState.IsValid)
            {
                reservationReview.dateReview = DateTime.Now;
                db.ReservationReview.Add(reservationReview);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.departamentID = new SelectList(db.Departament, "departamentID", "type", reservationReview.departamentID);
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID", reservationReview.reservationID);
            return View(reservationReview);
        }

        // GET: ReservationReviews/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReservationReview reservationReview = db.ReservationReview.Find(id);
            if (reservationReview == null)
            {
                return HttpNotFound();
            }
            ViewBag.departamentID = new SelectList(db.Departament, "departamentID", "type", reservationReview.departamentID);
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID", reservationReview.reservationID);
            return View(reservationReview);
        }

        // POST: ReservationReviews/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "reviewID,reviewRoom,dateReview,reservationID,departamentID")] ReservationReview reservationReview)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservationReview).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.departamentID = new SelectList(db.Departament, "departamentID", "type", reservationReview.departamentID);
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID", reservationReview.reservationID);
            return View(reservationReview);
        }

        // GET: ReservationReviews/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReservationReview reservationReview = db.ReservationReview.Find(id);
            if (reservationReview == null)
            {
                return HttpNotFound();
            }
            return View(reservationReview);
        }

        // POST: ReservationReviews/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ReservationReview reservationReview = db.ReservationReview.Find(id);
            db.ReservationReview.Remove(reservationReview);
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
