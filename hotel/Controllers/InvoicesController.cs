﻿using System;
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
    public class InvoicesController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();

        // GET: Invoices
        public ActionResult Index()
        {
            var invoice = db.Invoice.Include(i => i.Reservation);
            return View(invoice.ToList());
        }

        // GET: Invoices/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Invoice invoice = db.Invoice.Find(id);
            var id_reservation = invoice.reservationID;

            var cant_huespedes = db.consulta2.Where(x => x.reservationID == id_reservation).Select(x => x.companion).FirstOrDefault();
            ViewBag.cant_huesped = cant_huespedes;

            var resultado = db.DetallesFactura.Where(x => x.reservationID == id_reservation).ToList();
            List<DetallesFactura> detalles = new List<DetallesFactura>();
            foreach (var t in resultado)
            {
                detalles.Add(t);
            }
            var listafinal = new List<DetallesFactura>();
            listafinal = detalles.ToList();
            ViewBag.conceptos = listafinal;
            if (invoice == null)
            {
                return HttpNotFound();
            }
            return View(invoice);
        }

        // GET: Invoices/Create
        public ActionResult Create()
        {
            ViewBag.guestID = new SelectList(db.Guest, "guestID", "name");
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID");
            return View();
        }

        // POST: Invoices/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "invoiceID,dateTime,subtotal,discount,tax,totalDue")] Invoice invoice)
        {
            if (ModelState.IsValid)
            {
                invoice.dateTime = DateTime.Now;
                db.Invoice.Add(invoice);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.guestID = new SelectList(db.Guest, "guestID", "name");
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID", invoice.reservationID);
            return View(invoice);
        }

        // GET: Invoices/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Invoice invoice = db.Invoice.Find(id);
            if (invoice == null)
            {
                return HttpNotFound();
            }
            ViewBag.guestID = new SelectList(db.Guest, "guestID", "name");
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID", invoice.reservationID);
            return View(invoice);
        }

        // POST: Invoices/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "invoiceID,dateTime,subtotal,discount,tax,totalDue")] Invoice invoice)
        {
            if (ModelState.IsValid)
            {
                db.Entry(invoice).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.guestID = new SelectList(db.Guest, "guestID", "name");
            ViewBag.reservationID = new SelectList(db.Reservation, "reservationID", "reservationID", invoice.reservationID);
            return View(invoice);
        }

        // GET: Invoices/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Invoice invoice = db.Invoice.Find(id);
            if (invoice == null)
            {
                return HttpNotFound();
            }
            return View(invoice);
        }

        // POST: Invoices/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Invoice invoice = db.Invoice.Find(id);
            db.Invoice.Remove(invoice);
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
