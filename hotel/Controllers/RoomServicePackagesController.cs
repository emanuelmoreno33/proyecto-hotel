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
    public class RoomServicePackagesController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: RoomServicePackages
        public ActionResult Index()
        {
            var roomServicePackage = db.RoomServicePackage.Include(r => r.RoomPackage).Include(r => r.Service);
            return View(roomServicePackage.ToList());
        }

        // GET: RoomServicePackages/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomServicePackage roomServicePackage = db.RoomServicePackage.Find(id);
            if (roomServicePackage == null)
            {
                return HttpNotFound();
            }
            return View(roomServicePackage);
        }

        // GET: RoomServicePackages/Create
        public ActionResult Create()
        {
            ViewBag.roomPackageID = new SelectList(db.RoomPackage, "roomPackageID", "namePackage");
            ViewBag.serviceID = new SelectList(db.Service, "serviceID", "name");
            return View();
        }

        // POST: RoomServicePackages/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "roomServicePackageID,roomPackageID,serviceID")] RoomServicePackage roomServicePackage)
        {
            if (ModelState.IsValid)
            {
                db.RoomServicePackage.Add(roomServicePackage);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.roomPackageID = new SelectList(db.RoomPackage, "roomPackageID", "namePackage", roomServicePackage.roomPackageID);
            ViewBag.serviceID = new SelectList(db.Service, "serviceID", "name", roomServicePackage.serviceID);
            return View(roomServicePackage);
        }

        // GET: RoomServicePackages/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomServicePackage roomServicePackage = db.RoomServicePackage.Find(id);
            if (roomServicePackage == null)
            {
                return HttpNotFound();
            }
            ViewBag.roomPackageID = new SelectList(db.RoomPackage, "roomPackageID", "namePackage", roomServicePackage.roomPackageID);
            ViewBag.serviceID = new SelectList(db.Service, "serviceID", "name", roomServicePackage.serviceID);
            return View(roomServicePackage);
        }

        // POST: RoomServicePackages/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "roomServicePackageID,roomPackageID,serviceID")] RoomServicePackage roomServicePackage)
        {
            if (ModelState.IsValid)
            {
                db.Entry(roomServicePackage).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.roomPackageID = new SelectList(db.RoomPackage, "roomPackageID", "namePackage", roomServicePackage.roomPackageID);
            ViewBag.serviceID = new SelectList(db.Service, "serviceID", "name", roomServicePackage.serviceID);
            return View(roomServicePackage);
        }

        // GET: RoomServicePackages/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomServicePackage roomServicePackage = db.RoomServicePackage.Find(id);
            if (roomServicePackage == null)
            {
                return HttpNotFound();
            }
            return View(roomServicePackage);
        }

        // POST: RoomServicePackages/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RoomServicePackage roomServicePackage = db.RoomServicePackage.Find(id);
            db.RoomServicePackage.Remove(roomServicePackage);
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
