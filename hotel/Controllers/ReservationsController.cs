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
    public class ReservationsController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: Reservations
        public ActionResult Index()
        {
            var reservation = db.Reservation.Include(r => r.Employee).Include(r => r.Guest).Include(r => r.ReservationStatus).Include(r => r.ReservedFrom).Include(r => r.Room).Include(r => r.ReservationComplaint).Include(r => r.RoomPackage).Include(r => r.RoomPromo);
            return View(reservation.ToList());
        }

        // GET: Reservations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservation.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        // GET: Reservations/Create
        public ActionResult Create()
        {
            ViewBag.employeeID = new SelectList(db.Employee, "employeeID", "name");
            ViewBag.guestID = new SelectList(db.Guest, "guestID", "name");
            ViewBag.reservationStatusID = new SelectList(db.ReservationStatus, "reservationStatusID", "status");
            ViewBag.reservedFromID = new SelectList(db.ReservedFrom, "reservedFromID", "reservationMethod");
            ViewBag.roomID = new SelectList(db.Room, "roomID", "roomID");
            ViewBag.reservationID = new SelectList(db.ReservationComplaint, "reservationID", "comment");
            ViewBag.roomPackageID = new SelectList(db.RoomPackage, "roomPackageID", "namePackage");
            ViewBag.roomPromoID = new SelectList(db.RoomPromo, "roomPromoID", "roomPromoID");
            return View();
        }

        // POST: Reservations/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "reservationID,guestID,roomID,startDate,endDate,reservationStatusID,reservedFromID,employeeID,roomPackageID,roomPromoID")] Reservation reservation)
        {
            if (ModelState.IsValid)
            {
                db.Reservation.Add(reservation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.employeeID = new SelectList(db.Employee, "employeeID", "name", reservation.employeeID);
            ViewBag.guestID = new SelectList(db.Guest, "guestID", "name", reservation.guestID);
            ViewBag.reservationStatusID = new SelectList(db.ReservationStatus, "reservationStatusID", "status", reservation.reservationStatusID);
            ViewBag.reservedFromID = new SelectList(db.ReservedFrom, "reservedFromID", "reservationMethod", reservation.reservedFromID);
            ViewBag.roomID = new SelectList(db.Room, "roomID", "roomID", reservation.roomID);
            ViewBag.reservationID = new SelectList(db.ReservationComplaint, "reservationID", "comment", reservation.reservationID);
            ViewBag.roomPackageID = new SelectList(db.RoomPackage, "roomPackageID", "namePackage", reservation.roomPackageID);
            ViewBag.roomPromoID = new SelectList(db.RoomPromo, "roomPromoID", "roomPromoID", reservation.roomPromoID);
            return View(reservation);
        }

        // GET: Reservations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservation.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            ViewBag.employeeID = new SelectList(db.Employee, "employeeID", "name", reservation.employeeID);
            ViewBag.guestID = new SelectList(db.Guest, "guestID", "name", reservation.guestID);
            ViewBag.reservationStatusID = new SelectList(db.ReservationStatus, "reservationStatusID", "status", reservation.reservationStatusID);
            ViewBag.reservedFromID = new SelectList(db.ReservedFrom, "reservedFromID", "reservationMethod", reservation.reservedFromID);
            ViewBag.roomID = new SelectList(db.Room, "roomID", "roomID", reservation.roomID);
            ViewBag.reservationID = new SelectList(db.ReservationComplaint, "reservationID", "comment", reservation.reservationID);
            ViewBag.roomPackageID = new SelectList(db.RoomPackage, "roomPackageID", "namePackage", reservation.roomPackageID);
            ViewBag.roomPromoID = new SelectList(db.RoomPromo, "roomPromoID", "roomPromoID", reservation.roomPromoID);
            return View(reservation);
        }

        // POST: Reservations/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "reservationID,guestID,roomID,startDate,endDate,reservationStatusID,reservedFromID,employeeID,roomPackageID,roomPromoID")] Reservation reservation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.employeeID = new SelectList(db.Employee, "employeeID", "name", reservation.employeeID);
            ViewBag.guestID = new SelectList(db.Guest, "guestID", "name", reservation.guestID);
            ViewBag.reservationStatusID = new SelectList(db.ReservationStatus, "reservationStatusID", "status", reservation.reservationStatusID);
            ViewBag.reservedFromID = new SelectList(db.ReservedFrom, "reservedFromID", "reservationMethod", reservation.reservedFromID);
            ViewBag.roomID = new SelectList(db.Room, "roomID", "roomID", reservation.roomID);
            ViewBag.reservationID = new SelectList(db.ReservationComplaint, "reservationID", "comment", reservation.reservationID);
            ViewBag.roomPackageID = new SelectList(db.RoomPackage, "roomPackageID", "namePackage", reservation.roomPackageID);
            ViewBag.roomPromoID = new SelectList(db.RoomPromo, "roomPromoID", "roomPromoID", reservation.roomPromoID);
            return View(reservation);
        }

        // GET: Reservations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservation.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        // POST: Reservations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Reservation reservation = db.Reservation.Find(id);
            db.Reservation.Remove(reservation);
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
