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
    public class consulta1Controller : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: consulta1
        public ActionResult Index()
        {
            return View(db.consulta1.ToList());
        }

        // GET: consulta1/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            consulta1 consulta1 = db.consulta1.Find(id);
            if (consulta1 == null)
            {
                return HttpNotFound();
            }
            return View(consulta1);
        }

        // GET: consulta1/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: consulta1/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "typeName,Expr1")] consulta1 consulta1)
        {
            if (ModelState.IsValid)
            {
                db.consulta1.Add(consulta1);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(consulta1);
        }

        // GET: consulta1/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            consulta1 consulta1 = db.consulta1.Find(id);
            if (consulta1 == null)
            {
                return HttpNotFound();
            }
            return View(consulta1);
        }

        // POST: consulta1/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "typeName,Expr1")] consulta1 consulta1)
        {
            if (ModelState.IsValid)
            {
                db.Entry(consulta1).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(consulta1);
        }

        // GET: consulta1/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            consulta1 consulta1 = db.consulta1.Find(id);
            if (consulta1 == null)
            {
                return HttpNotFound();
            }
            return View(consulta1);
        }

        // POST: consulta1/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            consulta1 consulta1 = db.consulta1.Find(id);
            db.consulta1.Remove(consulta1);
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
