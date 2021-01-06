using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using hotel.Models;
using System.Web.Mvc;
using System.Web.Security;

namespace hotel.Controllers
{
    public class AuthModel: ActionResult
    {
        private proyecto_hotelEntities db = new proyecto_hotelEntities();
        public override void ExecuteResult(ControllerContext context)
        {
            //HttpCookie authCookie = request.Cookies[FormsAuthentication.FormsCookieName];
            //FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);
            //nt emp_id = int.Parse(ticket.Name);
            //var admin = db.Employee.Where(d => d.employeeID == emp_id).Select(x => x.Departament.admin).FirstOrDefault();
            //var val_Admin = int.Parse(admin);
        }
    }
}