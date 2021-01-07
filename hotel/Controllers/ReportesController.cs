using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using hotel.Models;

namespace hotel.Controllers
{
    [Authorize]
    public class ReportesController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();
        // GET: Reportes
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult reporte1()
        {
            return View(db.consulta1.ToList());
        }

        public ActionResult reporte2()
        {
                return View(db.consulta2.ToList());
        }

        [HttpPost]
        public ActionResult reporte2(DateTime fromDate, DateTime toDate)
        {
                var resultado = db.consulta2.Where(c => c.startDate >= fromDate && c.startDate < toDate).ToList();
                return View(resultado);
        }

        public ActionResult reporte3()
        {
            DateTime fromDate = DateTime.Now;
            DateTime toDate = DateTime.Now;
            var resultado = db.busqueda_reporte3(fromDate, toDate);
            return View(resultado.ToList());
        }

        [HttpPost]
        public ActionResult reporte3(DateTime fromDate, DateTime toDate)
        {
            var resultado = db.busqueda_reporte3(fromDate, toDate);
            return View(resultado.ToList());
        }

        public ActionResult reporte4()
        {
            return View(db.reporte4.ToList());
        }

        public ActionResult reporte5()
        {
            DateTime fromDate = DateTime.Now;
            DateTime toDate = DateTime.Now;
            var resultado = db.busqueda_reporte5(fromDate, toDate);
            return View(resultado.ToList());
        }

        [HttpPost]
        public ActionResult reporte5(DateTime fromDate, DateTime toDate)
        {
            var resultado = db.busqueda_reporte5(fromDate, toDate);
            return View(resultado.ToList());
        }

        public ActionResult reporte6()
        {
            return View(db.reporte6.ToList());
        }

        public ActionResult reporte7()
        {
            DateTime fromDate = DateTime.Now;
            DateTime toDate = DateTime.Now;
            var resultado = db.busqueda_reporte7(fromDate, toDate);
            return View(resultado.ToList());
        }

        [HttpPost]
        public ActionResult reporte7(DateTime fromDate, DateTime toDate)
        {
            var resultado = db.busqueda_reporte7(fromDate, toDate);
            return View(resultado.ToList());
        }

        public ActionResult reporte8()
        {
            DateTime fromDate = DateTime.Now;
            DateTime toDate = DateTime.Now;
            var resultado = db.busqueda_reporte8(fromDate, toDate);
            return View(resultado.ToList());
        }

        [HttpPost]
        public ActionResult reporte8(DateTime fromDate, DateTime toDate)
        {
            var resultado = db.busqueda_reporte8(fromDate, toDate);
            return View(resultado.ToList());
        }
        public ActionResult reporte9()
        {
            DateTime fromDate = DateTime.Now;
            DateTime toDate = DateTime.Now;
            var resultado = db.busqueda_reporte9(fromDate, toDate);
            return View(resultado.ToList());
        }

        [HttpPost]
        public ActionResult reporte9(DateTime fromDate, DateTime toDate)
        {
            var resultado = db.busqueda_reporte9(fromDate, toDate);
            return View(resultado.ToList());
        }
        public ActionResult reporte10()
        {
            DateTime fromDate = DateTime.Now;
            DateTime toDate = DateTime.Now;
            var resultado = db.busqueda_reporte10(fromDate, toDate);
            return View(resultado.ToList());
        }

        [HttpPost]
        public ActionResult reporte10(DateTime fromDate, DateTime toDate)
        {
            var resultado = db.busqueda_reporte10(fromDate, toDate);
            return View(resultado.ToList());
        }
        public ActionResult reporte11()
        {
            DateTime fromDate = DateTime.Now;
            DateTime toDate = DateTime.Now;
            var resultado = db.busqueda_reporte11(fromDate, toDate);
            return View(resultado.ToList());
        }

        [HttpPost]
        public ActionResult reporte11(DateTime fromDate, DateTime toDate)
        {
            var resultado = db.busqueda_reporte11(fromDate, toDate);
            return View(resultado.ToList());
        }

        public ActionResult reporte12()
        {
            DateTime fromDate = DateTime.Now;
            DateTime toDate = DateTime.Now;
            var resultado = db.busqueda_reporte12(fromDate, toDate);
            return View(resultado.ToList());
        }

        [HttpPost]
        public ActionResult reporte12(DateTime fromDate, DateTime toDate)
        {
            var resultado = db.busqueda_reporte12(fromDate, toDate);
            return View(resultado.ToList());
        }

    }
}