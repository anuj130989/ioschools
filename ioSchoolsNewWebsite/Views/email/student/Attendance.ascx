<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.email.EmailAttendanceViewModel>" %>
<p>Dear <%= Model.receiver %>,</p>
<p><%= Model.offender %> has been late/absent for <%= Model.days %> days this week.</p>
<p>An email notification can be sent to their parents by following the link below:</p>
<p><a href="<%= Model.link %>"><%= Model.link %></a></p>
<p>
Regards,
<br />
 School
</p>
