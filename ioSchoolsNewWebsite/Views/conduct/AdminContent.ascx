<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.IEnumerable<ioschoolsWebsite.Models.discipline.Conduct>>" %>
<% foreach (var conduct in Model)
   {%>
<tr alt="<%= conduct.id %>">
    <td>
        <%= conduct.name %>
    </td>
    <td>
        <%= conduct.isdemerit?"DEMERIT":"MERIT" %>
    </td>
    <td>
        <%= conduct.min %>
    </td>
    <td>
        <%= conduct.max %>
    </td>
    <td class="ar">
        <span class="jqedit">edit</span><span class="jqdelete">delete</span>
    </td>
</tr>
<%} %>

