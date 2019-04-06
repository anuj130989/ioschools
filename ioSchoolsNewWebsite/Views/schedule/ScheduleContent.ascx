<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<ioschoolsWebsite.Models.schedule.Schedule>>" %>
<h2 class="icon_calendar mt10">Today's Schedule</h2>
<%if (Model.Count() == 0){ %>
<p>You do not have any classes today.</p>
<%}else{%>
<table class="table_brown">
<thead>
<tr><td>Class</td><td>Subject</td><td>Start</td><td>End</td></tr>
</thead>
<tbody>
<% foreach (var row in Model)
{%>
  <tr><td><%= row.class_name %></td><td><%= row.subject_name %></td><td><%= row.start_time %></td><td><%= row.end_time %></td></tr>
<%} %>
</tbody>
</table>
<%} %>
