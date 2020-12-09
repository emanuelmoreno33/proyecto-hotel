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
    public class RoomPackagesController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: RoomPackages
        public ActionResult Index()
        {
            var roomPackage = db.RoomPackage.Include(r => r.RoomType);
            return View(roomPackage.ToList());
        }

        // GET: RoomPackages/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomPackage roomPackage = db.RoomPackage.Find(id);
            if (roomPackage == null)
            {
                return HttpNotFound();
            }
            return View(roomPackage);
        }

        // GET: RoomPackages/Create
        public ActionResult Create()
        {
            ViewBag.roomTypeID = new SelectList(db.RoomType, "roomTypeID", "typeName");
            return View();
        }

        // POST: RoomPackages/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "roomPackageID,namePackage,price,roomTypeID,frequency")] RoomPackage roomPackage)
        {
            if (ModelState.IsValid)
            {
                db.RoomPackage.Add(roomPackage);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.roomTypeID = new SelectList(db.RoomType, "roomTypeID", "typeName", roomPackage.roomTypeID);
            return View(roomPackage);
        }

        // GET: RoomPackages/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomPackage roomPackage = db.RoomPackage.Find(id);
            if (roomPackage == null)
            {
                return HttpNotFound();
            }
            ViewBag.roomTypeID = new SelectList(db.RoomType, "roomTypeID", "typeName", roomPackage.roomTypeID);
            return View(roomPackage);
        }

        // POST: RoomPackages/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "roomPackageID,namePackage,price,roomTypeID,frequency")] RoomPackage roomPackage)
        {
            if (ModelState.IsValid)
            {
                db.Entry(roomPackage).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.roomTypeID = new SelectList(db.RoomType, "roomTypeID", "typeName", roomPackage.roomTypeID);
            return View(roomPackage);
        }

        // GET: RoomPackages/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomPackage roomPackage = db.RoomPackage.Find(id);
            if (roomPackage == null)
            {
                return HttpNotFound();
            }
            return View(roomPackage);
        }

        // POST: RoomPackages/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RoomPackage roomPackage = db.RoomPackage.Find(id);
            db.RoomPackage.Remove(roomPackage);
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
