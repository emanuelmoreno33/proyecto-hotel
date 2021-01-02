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
    public class GuestsController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: Guests
        public ActionResult Index()
        {
            var guest = db.Guest.Include(g => g.City).Include(g => g.PlaceOfOrigin1);
            return View(guest.ToList());
        }

        // GET: Guests/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Guest guest = db.Guest.Find(id);
            if (guest == null)
            {
                return HttpNotFound();
            }
            return View(guest);
        }

        // GET: Guests/Create
        public ActionResult Create()
        {
            ViewBag.cityID = new SelectList(db.City.OrderBy(s => s.city1), "cityID", "city1");
            ViewBag.placeOfOrigin = new SelectList(db.PlaceOfOrigin.OrderBy(s => s.country), "placeOfOrigin1", "country");
            return View();
        }

        // POST: Guests/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "guestID,name,lastName,address,DOB,sex,housePhone,cellPhone,email,RFC,placeOfOrigin,cityID")] Guest guest)
        {
            if (ModelState.IsValid)
            {
                db.Guest.Add(guest);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.cityID = new SelectList(db.City.OrderBy(s => s.city1), "cityID", "city1", guest.cityID);
            ViewBag.placeOfOrigin = new SelectList(db.PlaceOfOrigin.OrderBy(s => s.country), "placeOfOrigin1", "country", guest.placeOfOrigin);
            return View(guest);
        }

        // GET: Guests/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Guest guest = db.Guest.Find(id);
            if (guest == null)
            {
                return HttpNotFound();
            }
            ViewBag.cityID = new SelectList(db.City.OrderBy(s => s.city1), "cityID", "city1", guest.cityID);
            ViewBag.placeOfOrigin = new SelectList(db.PlaceOfOrigin.OrderBy(s => s.country), "placeOfOrigin1", "country", guest.placeOfOrigin);
            return View(guest);
        }

        // POST: Guests/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "guestID,name,lastName,address,DOB,sex,housePhone,cellPhone,email,RFC,placeOfOrigin,cityID")] Guest guest)
        {
            if (ModelState.IsValid)
            {
                db.Entry(guest).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.cityID = new SelectList(db.City.OrderBy(s => s.city1), "cityID", "city1", guest.cityID);
            ViewBag.placeOfOrigin = new SelectList(db.PlaceOfOrigin.OrderBy(s => s.country), "placeOfOrigin1", "country", guest.placeOfOrigin);
            return View(guest);
        }

        // GET: Guests/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Guest guest = db.Guest.Find(id);
            if (guest == null)
            {
                return HttpNotFound();
            }
            return View(guest);
        }

        // POST: Guests/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Guest guest = db.Guest.Find(id);
            db.Guest.Remove(guest);
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
