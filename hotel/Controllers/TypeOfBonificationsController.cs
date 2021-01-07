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
    public class TypeOfBonificationsController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: TypeOfBonifications
        public ActionResult Index()
        {
            return View(db.TypeOfBonification.ToList());
        }

        // GET: TypeOfBonifications/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TypeOfBonification typeOfBonification = db.TypeOfBonification.Find(id);
            if (typeOfBonification == null)
            {
                return HttpNotFound();
            }
            return View(typeOfBonification);
        }

        // GET: TypeOfBonifications/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TypeOfBonifications/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "typeOfBonificationID,daysLodging,bonus")] TypeOfBonification typeOfBonification)
        {
            if (ModelState.IsValid)
            {
                db.TypeOfBonification.Add(typeOfBonification);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(typeOfBonification);
        }

        // GET: TypeOfBonifications/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TypeOfBonification typeOfBonification = db.TypeOfBonification.Find(id);
            if (typeOfBonification == null)
            {
                return HttpNotFound();
            }
            return View(typeOfBonification);
        }

        // POST: TypeOfBonifications/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "typeOfBonificationID,daysLodging,bonus")] TypeOfBonification typeOfBonification)
        {
            if (ModelState.IsValid)
            {
                db.Entry(typeOfBonification).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(typeOfBonification);
        }

        // GET: TypeOfBonifications/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TypeOfBonification typeOfBonification = db.TypeOfBonification.Find(id);
            if (typeOfBonification == null)
            {
                return HttpNotFound();
            }
            return View(typeOfBonification);
        }

        // POST: TypeOfBonifications/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TypeOfBonification typeOfBonification = db.TypeOfBonification.Find(id);
            db.TypeOfBonification.Remove(typeOfBonification);
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
