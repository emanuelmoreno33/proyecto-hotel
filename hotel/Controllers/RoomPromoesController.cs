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
    public class RoomPromoesController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: RoomPromoes
        public ActionResult Index()
        {
            var roomPromo = db.RoomPromo.Include(r => r.Promo).Include(r => r.RoomType);
            return View(roomPromo.ToList());
        }

        // GET: RoomPromoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomPromo roomPromo = db.RoomPromo.Find(id);
            if (roomPromo == null)
            {
                return HttpNotFound();
            }
            return View(roomPromo);
        }

        // GET: RoomPromoes/Create
        public ActionResult Create()
        {
            ViewBag.promoID = new SelectList(db.Promo, "promoID", "promoName");
            ViewBag.roomTypeID = new SelectList(db.RoomType, "roomTypeID", "typeName");
            return View();
        }

        // POST: RoomPromoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "roomPromoID,promoID,roomTypeID,discount")] RoomPromo roomPromo)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.RoomPromo.Add(roomPromo);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                catch(Exception)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.Conflict);
                }
            }

            ViewBag.promoID = new SelectList(db.Promo, "promoID", "promoName", roomPromo.promoID);
            ViewBag.roomTypeID = new SelectList(db.RoomType, "roomTypeID", "typeName", roomPromo.roomTypeID);
            return View(roomPromo);
        }

        // GET: RoomPromoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomPromo roomPromo = db.RoomPromo.Find(id);
            if (roomPromo == null)
            {
                return HttpNotFound();
            }
            ViewBag.promoID = new SelectList(db.Promo, "promoID", "promoName", roomPromo.promoID);
            ViewBag.roomTypeID = new SelectList(db.RoomType, "roomTypeID", "typeName", roomPromo.roomTypeID);
            return View(roomPromo);
        }

        // POST: RoomPromoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "roomPromoID,promoID,roomTypeID,discount")] RoomPromo roomPromo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(roomPromo).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.promoID = new SelectList(db.Promo, "promoID", "promoName", roomPromo.promoID);
            ViewBag.roomTypeID = new SelectList(db.RoomType, "roomTypeID", "typeName", roomPromo.roomTypeID);
            return View(roomPromo);
        }

        // GET: RoomPromoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomPromo roomPromo = db.RoomPromo.Find(id);
            if (roomPromo == null)
            {
                return HttpNotFound();
            }
            return View(roomPromo);
        }

        // POST: RoomPromoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RoomPromo roomPromo = db.RoomPromo.Find(id);
            db.RoomPromo.Remove(roomPromo);
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
