<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.user.UserBase>" %>
<div class="blockSelectable" alt="<%= Model.id %>">
    <div class="fl w50px ac">
        <%= Model.thumbnailString %>
    </div>
    <div class="content">
        <p>
            <%= Model.name%></p>
    </div>
</div>
