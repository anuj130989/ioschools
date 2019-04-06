<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.finance.StatementViewModel>" %>
<%@ Import Namespace="ioschools.Data" %>
<%@ Import Namespace="ioschoolsWebsite.Library.Helpers" %>
<button id="buttonPrintStatement" type="button" class="fr" onclick="$('#fee_statement_container').jqprint();return false;"><img src="/Content/img/icons/printer.png" alt="" /> print</button>
<div id="fee_statement_container">
    <h2>Statement of Fees Payable for the Year <%= Model.year %></h2>
<% if (Model.childs.Any()){%>
<table class="table_grey mt20">
    <thead>
        <tr>
            <td>
                Fees
            </td>
            <td class="w125px ar">
                Payment Status
            </td>
<td class="ar w125px">
                Amount Payable, RM
            </td>
            <td class="w125px ar">
               Payment Due
            </td>
            
        </tr>
    </thead>
    <tbody>
<% foreach (var row in Model.childs)
   { %>
   <tr><td colspan="4" class="bg_blue bold"><%= row.childname %></td></tr>
   <% foreach (var fee in row.fees)
      { %>
   <tr>
                            <td class="pl30">
                                <%= fee.name %>
                            </td>
                            <td class="ar">
                                <%= fee.status %>
                            </td>
                            <td class="ar">
                                <%= fee.amount.ToString("n2")%>
                            </td>
                            <td class="ar">
                                  <%= fee.duedate.ToString(Constants.DATETIME_SHORT_DATE)%>
                                </td>
                        </tr>
   <% } %>
<% } %>
</tbody>
<tfoot>
    <tr><td colspan="2" class="ar bold">Total fees payable</td><td class="ar font_gothic bold larger"><%= Model.totalPayable%></td><td></td></tr>
</tfoot>
</table>
          <% }else{ %>
      <p>No payable fees found.</p>
      <% } %>
</div>
