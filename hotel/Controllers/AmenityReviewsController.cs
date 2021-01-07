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
    public class AmenityReviewsController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: AmenityReviews
        public ActionResult Index()
        {
            var amenityReview = db.AmenityReview.Include(a => a.RoomAmenity);
            return View(amenityReview.ToList());
        }

        // GET: AmenityReviews/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AmenityReview amenityReview = db.AmenityReview.Find(id);
            if (amenityReview == null)
            {
                return HttpNotFound();
            }
            return View(amenityReview);
        }

        // GET: AmenityReviews/Create
        public ActionResult Create()
        {
            ViewBag.amenityID = new SelectList(db.RoomAmenity, "amenityID", "amenityID");
            return View();
        }

        // POST: AmenityReviews/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "reviewID,reviewAmenity,amenityID")] AmenityReview amenityReview)
        {
            if (ModelState.IsValid)
            {
                amenityReview.dataReview = DateTime.Now;
                db.AmenityReview.Add(amenityReview);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.amenityID = new SelectList(db.RoomAmenity, "amenityID", "amenityID", amenityReview.amenityID);
            return View(amenityReview);
        }

        // GET: AmenityReviews/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AmenityReview amenityReview = db.AmenityReview.Find(id);
            if (amenityReview == null)
            {
                return HttpNotFound();
            }
            ViewBag.amenityID = new SelectList(db.RoomAmenity, "amenityID", "amenityID", amenityReview.amenityID);
            return View(amenityReview);
        }

        // POST: AmenityReviews/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "reviewID,reviewAmenity,dataReview,amenityID")] AmenityReview amenityReview)
        {
            if (ModelState.IsValid)
            {
                db.Entry(amenityReview).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.amenityID = new SelectList(db.RoomAmenity, "amenityID", "amenityID", amenityReview.amenityID);
            return View(amenityReview);
        }

        // GET: AmenityReviews/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AmenityReview amenityReview = db.AmenityReview.Find(id);
            if (amenityReview == null)
            {
                return HttpNotFound();
            }
            return View(amenityReview);
        }

        // POST: AmenityReviews/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AmenityReview amenityReview = db.AmenityReview.Find(id);
            db.AmenityReview.Remove(amenityReview);
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
