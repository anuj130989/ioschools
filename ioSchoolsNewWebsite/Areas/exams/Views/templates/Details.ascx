<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.exam.templates.ExamTemplate>" %>
<div class="scrollableContainerHolder ba" style="height: 280px;padding:10px; min-width: 400px;">
<h3><%= Model.name %></h3>
<p><%= Model.description %></p>
<h5>Subjects</h5>
<div>
    <ul class="circle" style="margin-left: 15px;">
        <% foreach (var subject in Model.subjects)
           {%>
  <li><%= subject.examsubjectname %></li>
         <%   } %>
    </ul>
</div>
</div>