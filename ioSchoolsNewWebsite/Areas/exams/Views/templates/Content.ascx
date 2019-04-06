<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<ioschoolsWebsite.Models.exam.templates.ExamTemplate>>" %>
<% foreach (var t in Model)
{%>
<div class="exam_template_row" id="<%= t.id %>">
    <div class="fr">
        <span class="jqedit">edit</span><span class="jqdelete">delete</span>
    </div>
    <div class="font_darkred"><%= t.name %> </div>
    <div class="font_black"><%= t.schoolname %></div>
    <% if (t.isPrivate)
       { %>
       <span class="tag_red">private template</span>
    <% } %>
    <div class="mt10 mb10"><%= !string.IsNullOrEmpty(t.description) ? t.description : "<span class='font_lightgrey'>no description</span>"%></div>
    <div class="clear_right"></div>
    <div class="creator"><%= t.creator %></div>
    <div class="clear_right"></div>
</div>
<%} %>
