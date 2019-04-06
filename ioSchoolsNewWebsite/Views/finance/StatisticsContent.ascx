<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.fees.statistics.StatisticsViewModel>" %>
<h2>
    <%= Model.statname%></h2>
<table class="table_grey">
    <thead>
        <tr>
            <td>
                Fee Name
            </td>
            <td class="w50px ar">
                Paid
            </td>
            <td class="w50px ar">
                Unpaid
            </td>
            <td class="w50px ar">
                Overdue
            </td>
        </tr>
    </thead>
    <tbody>
        <%foreach(var ftype in Model.feetypes)
        {%>
        <tr>
            <td colspan="4" class="bg_lightblue bold">
                <%=ftype.feename%>
            </td>
        </tr>
        <%  foreach (var yearrow in ftype.entries)
           {%>
        <tr>
            <td class="pl30">
                <%=yearrow.schoolyear%>
            </td>
            <td class="ar">
                <%=yearrow.paid%>
            </td>
            <td class="ar">
                <%=yearrow.unpaid%>
            </td>
            <td class="ar">
                <%=yearrow.overdue%>
            </td>
        </tr>
        <%  }%>
        <%  }%>
    </tbody>
</table>
