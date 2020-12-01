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
    public class AmenityComplaintsController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: AmenityComplaints
        public ActionResult Index()
        {
            var amenityComplaint = db.AmenityComplaint.Include(a => a.RoomAmenity);
            return View(amenityComplaint.ToList());
        }

        // GET: AmenityComplaints/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AmenityComplaint amenityComplaint = db.AmenityComplaint.Find(id);
            if (amenityComplaint == null)
            {
                return HttpNotFound();
            }
            return View(amenityComplaint);
        }

        // GET: AmenityComplaints/Create
        public ActionResult Create()
        {
            ViewBag.amenityID = new SelectList(db.RoomAmenity, "amenityID", "amenityID");
            return View();
        }

        // POST: AmenityComplaints/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "complaintID,comment,dateComplaint,amenityID")] AmenityComplaint amenityComplaint)
        {
            if (ModelState.IsValid)
            {
                db.AmenityComplaint.Add(amenityComplaint);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.amenityID = new SelectList(db.RoomAmenity, "amenityID", "amenityID", amenityComplaint.amenityID);
            return View(amenityComplaint);
        }

        // GET: AmenityComplaints/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AmenityComplaint amenityComplaint = db.AmenityComplaint.Find(id);
            if (amenityComplaint == null)
            {
                return HttpNotFound();
            }
            ViewBag.amenityID = new SelectList(db.RoomAmenity, "amenityID", "amenityID", amenityComplaint.amenityID);
            return View(amenityComplaint);
        }

        // POST: AmenityComplaints/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "complaintID,comment,dateComplaint,amenityID")] AmenityComplaint amenityComplaint)
        {
            if (ModelState.IsValid)
            {
                db.Entry(amenityComplaint).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.amenityID = new SelectList(db.RoomAmenity, "amenityID", "amenityID", amenityComplaint.amenityID);
            return View(amenityComplaint);
        }

        // GET: AmenityComplaints/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AmenityComplaint amenityComplaint = db.AmenityComplaint.Find(id);
            if (amenityComplaint == null)
            {
                return HttpNotFound();
            }
            return View(amenityComplaint);
        }

        // POST: AmenityComplaints/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AmenityComplaint amenityComplaint = db.AmenityComplaint.Find(id);
            db.AmenityComplaint.Remove(amenityComplaint);
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
