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
    public class EmployeesController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: Employees
        public ActionResult Index()
        {
            var employee = db.Employee.Include(e => e.City).Include(e => e.Departament).Include(e => e.PlaceOfOrigin1);
            return View(employee.ToList());
        }

        // GET: Employees/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employee.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return View(employee);
        }

        // GET: Employees/Create
        public ActionResult Create()
        {
            ViewBag.cityID = new SelectList(db.City.OrderBy(s =>s.city1), "cityID", "city1");
            ViewBag.departamentID = new SelectList(db.Departament, "departamentID", "type");
            ViewBag.placeOfOrigin = new SelectList(db.PlaceOfOrigin.OrderBy(s=>s.country), "placeOfOrigin1", "country");
            return View();
        }

        // POST: Employees/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "employeeID,name,lastName,DOB,salary,placeOfOrigin,cityID,username,password,departamentID")] Employee employee)
        {
            if (ModelState.IsValid)
            {
                db.Employee.Add(employee);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.cityID = new SelectList(db.City.OrderBy(s => s.city1), "cityID", "city1", employee.cityID);
            ViewBag.departamentID = new SelectList(db.Departament, "departamentID", "type", employee.departamentID);
            ViewBag.placeOfOrigin = new SelectList(db.PlaceOfOrigin.OrderBy(s => s.country), "placeOfOrigin1", "country", employee.placeOfOrigin);
            return View(employee);
        }

        // GET: Employees/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employee.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            ViewBag.cityID = new SelectList(db.City.OrderBy(s => s.city1), "cityID", "city1", employee.cityID);
            ViewBag.departamentID = new SelectList(db.Departament, "departamentID", "type", employee.departamentID);
            ViewBag.placeOfOrigin = new SelectList(db.PlaceOfOrigin.OrderBy(s => s.country), "placeOfOrigin1", "country", employee.placeOfOrigin);
            return View(employee);
        }

        // POST: Employees/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "employeeID,name,lastName,DOB,salary,placeOfOrigin,cityID,username,password,departamentID")] Employee employee)
        {
            if (ModelState.IsValid)
            {
                db.Entry(employee).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.cityID = new SelectList(db.City.OrderBy(s => s.city1), "cityID", "city1", employee.cityID);
            ViewBag.departamentID = new SelectList(db.Departament, "departamentID", "type", employee.departamentID);
            ViewBag.placeOfOrigin = new SelectList(db.PlaceOfOrigin.OrderBy(s => s.country), "placeOfOrigin1", "country", employee.placeOfOrigin);
            return View(employee);
        }

        // GET: Employees/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employee.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return View(employee);
        }

        // POST: Employees/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Employee employee = db.Employee.Find(id);
            db.Employee.Remove(employee);
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
