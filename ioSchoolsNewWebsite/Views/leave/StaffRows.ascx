<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.IEnumerable<ioschoolsWebsite.Models.leave.StaffLeave>>" %>
<% foreach (var leave in Model)
   {%>
<tr alt="<%= leave.id %>">
    <td>
        <%= leave.name %>
    </td>
    <td class="ar">
        <%= leave.annualTotal %>
    </td>
    <td class="ar">
        <%= leave.remaining %>
    </td>
    <td class="ar">
        <%= leave.taken %>
    </td>
    <td class="ar"><span class="jqedit">edit</span><span class="jqdelete">delete</span></td>
</tr>
<% } %>