using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.UI.WebControls;
using ioschools.Data;
using ioschools.Data.User;
using ioschoolsWebsite.Library.Helpers;
using ioschoolsWebsite.Models.user;
using tradelr.Crypto.token;

namespace ioschoolsWebsite.Library.ActionFilters
{
    [HandleError]
    public class PermissionFilterAttribute : ActionFilterAttribute
    {
        public Permission perm { get; set; }


        private void LogAccessError(ActionExecutingContext filterContext, string userid)
        {
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var token = (BasicSecurityToken)filterContext.HttpContext.Items["token"];
            if (token != null)
            {
                var userperm = token.Permission.ToEnum<Permission>();

                if (perm != Permission.NONE && (userperm & perm) == 0)
                {
                    if (filterContext.IsChildAction)
                    {
                        filterContext.Result = new EmptyResult();
                    }
                    else if (filterContext.HttpContext.Request.IsAjaxRequest())
                    {
                        filterContext.RequestContext.HttpContext.Response.StatusCode = HttpStatusCode.Forbidden.ToInt();
                        filterContext.Result = new EmptyResult();

                        LogAccessError(filterContext, token.UserID);
                    }
                    else
                    {
                        filterContext.RequestContext.HttpContext.Response.StatusCode = HttpStatusCode.Forbidden.ToInt();
                        filterContext.Result = new ViewResult(){ViewName = "~/Views/Error/NoPermission.aspx"};

                        LogAccessError(filterContext, token.UserID);
                    }
                    return;
                }
            }
            else
            {
                // then user is not logged in 
                filterContext.RequestContext.HttpContext.Response.StatusCode = HttpStatusCode.Unauthorized.ToInt();
                if (filterContext.HttpContext.Request.IsAjaxRequest())
                {
                    filterContext.Result = new EmptyResult();
                }
                else
                {
                    filterContext.Result = new RedirectResult("/login?redirect=" + HttpUtility.UrlEncode(filterContext.HttpContext.Request.Url.PathAndQuery));
                }
            }

            base.OnActionExecuting(filterContext);
        }
    }
}