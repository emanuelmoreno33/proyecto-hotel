using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Data.Entity;
using hotel.Models;

namespace hotel.Controllers
{
    public class HomeController : Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();
        public ActionResult Index()
        {
            HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);
            int emp_id = int.Parse(ticket.Name);
            var empleado = db.Employee.Where(d => d.employeeID == emp_id).Select(x => x.username).FirstOrDefault();
            ViewBag.Message = empleado;
            var admin =  db.Employee.Where(d => d.employeeID == emp_id).Select(x => x.Departament.admin).FirstOrDefault();
            var val_Admin = int.Parse(admin);
            ViewBag.admin = val_Admin;


            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Clear();  // This may not be needed -- but can't hurt
            Session.Abandon();

            // Clear authentication cookie
            HttpCookie rFormsCookie = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            rFormsCookie.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(rFormsCookie);

            // Clear session cookie 
            HttpCookie rSessionCookie = new HttpCookie("ASP.NET_SessionId", "");
            rSessionCookie.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(rSessionCookie);

            // Invalidate the Cache on the Client Side
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            ViewBag.admin = null;

            // Redirect to the Home Page (that should be intercepted and redirected to the Login Page first)
            return RedirectToAction("Index", "Login");

        }
    }
}