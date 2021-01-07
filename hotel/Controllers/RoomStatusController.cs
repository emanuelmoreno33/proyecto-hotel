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
    public class RoomStatusController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: RoomStatus
        public ActionResult Index()
        {
            return View(db.RoomStatus.ToList());
        }

        // GET: RoomStatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomStatus roomStatus = db.RoomStatus.Find(id);
            if (roomStatus == null)
            {
                return HttpNotFound();
            }
            return View(roomStatus);
        }

        // GET: RoomStatus/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: RoomStatus/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "roomStatusID,statusName")] RoomStatus roomStatus)
        {
            if (ModelState.IsValid)
            {
                db.RoomStatus.Add(roomStatus);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(roomStatus);
        }

        // GET: RoomStatus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomStatus roomStatus = db.RoomStatus.Find(id);
            if (roomStatus == null)
            {
                return HttpNotFound();
            }
            return View(roomStatus);
        }

        // POST: RoomStatus/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "roomStatusID,statusName")] RoomStatus roomStatus)
        {
            if (ModelState.IsValid)
            {
                db.Entry(roomStatus).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(roomStatus);
        }

        // GET: RoomStatus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RoomStatus roomStatus = db.RoomStatus.Find(id);
            if (roomStatus == null)
            {
                return HttpNotFound();
            }
            return View(roomStatus);
        }

        // POST: RoomStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RoomStatus roomStatus = db.RoomStatus.Find(id);
            db.RoomStatus.Remove(roomStatus);
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
