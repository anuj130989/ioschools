using System;
using System.Collections.Generic;
using System.IO;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using ioschoolsWebsite.Models.exam.JSON;

namespace ioschoolsWebsite.Library.ActionFilters
{
    public class ExamJsonFilterAttribute : ActionFilterAttribute
    {
        public string Param { get; set; }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if ((filterContext.HttpContext.Request.ContentType ?? string.Empty).Contains("application/json") &&
                filterContext.HttpContext.Request.HttpMethod == "POST")
            {
                string inputstring = "";
                try
                {
                    using (var sr = new StreamReader(filterContext.HttpContext.Request.InputStream))
                    {
                        inputstring = sr.ReadToEnd();
                        var o = new JavaScriptSerializer().Deserialize<StudentMarkJsonModel[]>(inputstring);
                        filterContext.ActionParameters[Param] = o;
                        filterContext.ActionParameters["inputjson"] = inputstring;
                    }
                }
                catch (Exception ex)
                {
                    filterContext.HttpContext.Response.Write(ex.Message);
                }
                
            }
        }
    }
}