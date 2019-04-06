<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<ioschoolsWebsite.Models.fees.SchoolFeeStudent>>" %>
<%@ Import Namespace="ioschoolsWebsite.Models.fees" %>
<% foreach (var fee in Model){%>
        <tr alt="<%=fee.id%>">
            <td>
                <div class="font_black"><%=fee.name%></div>
            </td>
            <td class="ar"><%= fee.amount.ToString("n2") %></td>
            <td class="ar"><%=fee.status%></td>
            <td class="ar">
            <%=fee.duedate.ToSmartDate()%>
            </td>
            <td class="ar">
                <% if (fee.canEdit)
                   { %>
                <span class="jqedit">edit</span>
                <span class="jqdelete">delete</span>  
                <% } %>
            </td>
        </tr>
        <%
           } %>