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
    public class RoomAmenitiesController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: RoomAmenities
        public ActionResult Index()
        {
            var roomAmenity = db.RoomAmenity.Include(r => r.Reservation).Include(r => r.Service);
            return View(roomAmenity.ToList());
        }

        // GET: RoomAmenities/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomAmenity roomAmenity = db.RoomAmenity.Find(id);
            if (roomAmenity == null)
            {
                return HttpNotFound();
            }
            return View(roomAmenity);
        }

        // GET: RoomAmenities/Create
        public ActionResult Create()
        {
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID");
            ViewBag.serviceID = new SelectList(db.Service, "serviceID", "name");
            return View();
        }

        // POST: RoomAmenities/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "amenityID,reservationID,serviceID,date")] RoomAmenity roomAmenity)
        {
            if (ModelState.IsValid)
            {
                db.RoomAmenity.Add(roomAmenity);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID", roomAmenity.reservationID);
            ViewBag.serviceID = new SelectList(db.Service, "serviceID", "name", roomAmenity.serviceID);
            return View(roomAmenity);
        }

        // GET: RoomAmenities/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomAmenity roomAmenity = db.RoomAmenity.Find(id);
            if (roomAmenity == null)
            {
                return HttpNotFound();
            }
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID", roomAmenity.reservationID);
            ViewBag.serviceID = new SelectList(db.Service, "serviceID", "name", roomAmenity.serviceID);
            return View(roomAmenity);
        }

        // POST: RoomAmenities/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "amenityID,reservationID,serviceID,date")] RoomAmenity roomAmenity)
        {
            if (ModelState.IsValid)
            {
                db.Entry(roomAmenity).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID", roomAmenity.reservationID);
            ViewBag.serviceID = new SelectList(db.Service, "serviceID", "name", roomAmenity.serviceID);
            return View(roomAmenity);
        }

        // GET: RoomAmenities/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomAmenity roomAmenity = db.RoomAmenity.Find(id);
            if (roomAmenity == null)
            {
                return HttpNotFound();
            }
            return View(roomAmenity);
        }

        // POST: RoomAmenities/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RoomAmenity roomAmenity = db.RoomAmenity.Find(id);
            db.RoomAmenity.Remove(roomAmenity);
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
