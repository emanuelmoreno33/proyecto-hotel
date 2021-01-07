using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using hotel.Models;
using System.Web.Mvc;
using System.Web.Security;

namespace hotel.Controllers
{
    public class AuthModel: Controller
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();
        public string nombre_admin()
        {
            HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);
            int emp_id = int.Parse(ticket.Name);
            var empleado = db.Employee.Where(d => d.employeeID == emp_id).Select(x => x.username).FirstOrDefault();
            return empleado;
            
        }
        public int es_admin()
        {
            HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);
            int emp_id = int.Parse(ticket.Name);
            var admin = db.Employee.Where(d => d.employeeID == emp_id).Select(x => x.Departament.admin).FirstOrDefault();
            var val_Admin = int.Parse(admin);
            return val_Admin;
        }
        public void cargar(int emp_id)
        {
            var empleado = db.Employee.Where(d => d.employeeID == emp_id).Select(x => x.username).FirstOrDefault();
            ViewBag.Message = empleado;
            var admin = db.Employee.Where(d => d.employeeID == emp_id).Select(x => x.Departament.admin).FirstOrDefault();
            var val_Admin = int.Parse(admin);
            ViewBag.admin = val_Admin;
        }
    }
}