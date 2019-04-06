using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ioschoolsWebsite.Models;
using tradelr.Crypto;
using tradelr.Crypto.token;

namespace ioschoolsWebsite.Controllers.error
{
    public class errorController : Controller
    {
        public ActionResult Index()
        {
            Response.StatusCode = (int)HttpStatusCode.InternalServerError;
            return View();
        }

        public ActionResult NotFound()
        {
            Response.StatusCode = (int) HttpStatusCode.NotFound;
            return View(); 
        }

        [HttpPost]
        public ActionResult Log(string message)
        {
            var clientmsg = HttpUtility.UrlDecode(message);
            BasicSecurityToken token = null;
            if (Request.Cookies != null)
            {
                var httpCookie = Request.Cookies["token"];
                if (httpCookie != null)
                {
                    try
                    {
                        token = new BasicSecurityToken(httpCookie.Value); // 20 minutes
                    }
                    catch (BlobExpiredException ex)
                    {

                    }

                }
            }
            if (token != null)
            {
                clientmsg = string.Format("{0}: {1}", token.UserID, clientmsg);
            }
            return new EmptyResult();
        }
    }
}
