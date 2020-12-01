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
    public class PlaceOfOriginsController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: PlaceOfOrigins
        public ActionResult Index()
        {
            return View(db.PlaceOfOrigin.ToList());
        }

        // GET: PlaceOfOrigins/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlaceOfOrigin placeOfOrigin = db.PlaceOfOrigin.Find(id);
            if (placeOfOrigin == null)
            {
                return HttpNotFound();
            }
            return View(placeOfOrigin);
        }

        // GET: PlaceOfOrigins/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PlaceOfOrigins/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "placeOfOrigin1,country")] PlaceOfOrigin placeOfOrigin)
        {
            if (ModelState.IsValid)
            {
                db.PlaceOfOrigin.Add(placeOfOrigin);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(placeOfOrigin);
        }

        // GET: PlaceOfOrigins/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlaceOfOrigin placeOfOrigin = db.PlaceOfOrigin.Find(id);
            if (placeOfOrigin == null)
            {
                return HttpNotFound();
            }
            return View(placeOfOrigin);
        }

        // POST: PlaceOfOrigins/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "placeOfOrigin1,country")] PlaceOfOrigin placeOfOrigin)
        {
            if (ModelState.IsValid)
            {
                db.Entry(placeOfOrigin).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(placeOfOrigin);
        }

        // GET: PlaceOfOrigins/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlaceOfOrigin placeOfOrigin = db.PlaceOfOrigin.Find(id);
            if (placeOfOrigin == null)
            {
                return HttpNotFound();
            }
            return View(placeOfOrigin);
        }

        // POST: PlaceOfOrigins/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            PlaceOfOrigin placeOfOrigin = db.PlaceOfOrigin.Find(id);
            db.PlaceOfOrigin.Remove(placeOfOrigin);
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
