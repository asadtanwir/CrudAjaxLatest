using CrudAjaxLatest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CrudAjaxLatest.Controllers
{
    public class LoginController : Controller
    {
        EmployeeDB empDB = new EmployeeDB();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Logout()
        {
            Session.Clear();
            Session.Abandon();
            Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
            Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-10);
            return View("Index");
        }
        public JsonResult LoginUser(LoginUser lu)
        {
            return Json(empDB.LoginUser(lu), JsonRequestBehavior.AllowGet);
        }
    }
}