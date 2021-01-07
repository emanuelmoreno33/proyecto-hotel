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
    public class RoomsController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: Rooms
        public ActionResult Index()
        {
            var room = db.Room.Include(r => r.RoomStatus).Include(r => r.RoomType);
            return View(room.ToList());
        }

        public ActionResult Roomavailable()
        {
            var room = db.Room.Where(d => d.roomStatusID == 1).GroupBy(s => s.roomTypeID).Select(g => g.Count());
            return View(room.ToList());
        }

        // GET: Rooms/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Room room = db.Room.Find(id);
            if (room == null)
            {
                return HttpNotFound();
            }
            return View(room);
        }

        // GET: Rooms/Create
        public ActionResult Create()
        {
            ViewBag.roomStatusID = new SelectList(db.RoomStatus, "roomStatusID", "statusName");
            ViewBag.roomTypeID = new SelectList(db.RoomType, "roomTypeID", "typeName");
            return View();
        }

        // POST: Rooms/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "roomID,roomNumber,roomTypeID,roomStatusID")] Room room)
        {
            if (ModelState.IsValid)
            {
                db.Room.Add(room);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.roomStatusID = new SelectList(db.RoomStatus, "roomStatusID", "statusName", room.roomStatusID);
            ViewBag.roomTypeID = new SelectList(db.RoomType, "roomTypeID", "typeName", room.roomTypeID);
            return View(room);
        }

        // GET: Rooms/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Room room = db.Room.Find(id);
            if (room == null)
            {
                return HttpNotFound();
            }
            ViewBag.roomStatusID = new SelectList(db.RoomStatus, "roomStatusID", "statusName", room.roomStatusID);
            ViewBag.roomTypeID = new SelectList(db.RoomType, "roomTypeID", "typeName", room.roomTypeID);
            return View(room);
        }

        // POST: Rooms/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "roomID,roomNumber,roomTypeID,roomStatusID")] Room room)
        {
            if (ModelState.IsValid)
            {
                db.Entry(room).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.roomStatusID = new SelectList(db.RoomStatus, "roomStatusID", "statusName", room.roomStatusID);
            ViewBag.roomTypeID = new SelectList(db.RoomType, "roomTypeID", "typeName", room.roomTypeID);
            return View(room);
        }

        // GET: Rooms/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Room room = db.Room.Find(id);
            if (room == null)
            {
                return HttpNotFound();
            }
            return View(room);
        }

        // POST: Rooms/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Room room = db.Room.Find(id);
            db.Room.Remove(room);
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
