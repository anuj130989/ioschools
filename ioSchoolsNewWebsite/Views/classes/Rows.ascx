<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.IEnumerable<ioschoolsWebsite.Models.school.SchoolClass>>" %>
<% foreach (var c in Model)
   { %>
<tr alt="<%= c.id %>">
    <td>
        <%= c.schoolYear%>
    </td>
    <td>
        <%= c.currentClass %>
    </td>
    <td>
        <%= c.nextClass %>
    </td>
    <td class="ar">
        <span class="jqedit">edit</span><span class="jqdelete">delete</span>
    </td>
</tr>
<%  } %>
