using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CrudAjaxLatest.Models
{
    public class LoginUser
    {
        public string userName { get; set; }
        public string password { get; set; }
        public bool isAdmin { get; set; }
        public bool loggedUser { get; set; }
    }
}