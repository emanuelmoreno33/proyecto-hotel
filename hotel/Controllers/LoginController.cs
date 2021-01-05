using hotel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace hotel.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        private readonly proyecto_hotelEntities database = new proyecto_hotelEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login(Employee employeeModel)
        {
            var user = (from employee in database.Employee
                        where employee.username == employeeModel.username &&
                        employee.password == employeeModel.password
                        select employee.employeeID).FirstOrDefault();

            try
            {
                if (user > 0)
                {
                    Session["UserID"] = user;
                    FormsAuthentication.SetAuthCookie(Convert.ToString(Session["UserID"]), true);
                    return Redirect("~/Home");
                }

                return Redirect("~/Login");
            }
            catch (Exception e)
            {
                return View(e.Message);
            }

        }
    }
}