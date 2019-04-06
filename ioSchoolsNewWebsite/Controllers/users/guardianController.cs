using System;
using System.Web.Mvc;
using ioschools.Data;
using ioschools.Data.User;
using ioschoolsWebsite.Library;
using ioschoolsWebsite.Library.ActionFilters;

namespace ioschoolsWebsite.Controllers.users
{
    public class guardianController : baseController
    {
        [HttpPost]
        [PermissionFilter(perm = Permission.USERS_EDIT_STUDENTS)]
        public ActionResult Detach(long id)
        {
            try
            {
                repository.DeleteStudentOrGuardian(id);
            }
            catch (Exception ex)
            {

                return SendJsonErrorResponse(ex);
            }
            return Json("Guardian removed successfully".ToJsonOKMessage());
        }

    }
}
