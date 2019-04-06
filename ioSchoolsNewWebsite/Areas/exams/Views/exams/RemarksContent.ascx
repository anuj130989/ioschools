<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.exam.viewmodels.ExamRemarksViewModel>" %>
<%@ Import Namespace="ioschoolsWebsite.Library" %>
<% foreach (var remark in Model.remarks)
   {%>
<div class="remark mt10 mb20">
    <div class="section_header mt5">
        <%= remark.term_name %></div>
    <table class="table_brown" alt="<%= remark.id %>" term="<%= remark.term_id %>">
        <thead>
            <tr>
                <td class="w150px at">
                    Conduct
                </td>
                <td>
                    Remarks
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <div class="<%= Model.canEdit?"inlineedit ":"" %> editor_conduct">
                        <%= remark.conduct %></div>
                </td>
                <td>
                    <div class="<%= Model.canEdit?"inlineedit ":"" %> editor_remark">
                        <%=remark.remark.ToHtmlBreak() %></div>
                </td>
            </tr>
        </tbody>
    </table>
</div>
<%
   }%>
