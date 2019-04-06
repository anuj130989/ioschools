<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.fees.FeeNotificationTemplate>" %>
<tr class="bg_edit" alt="<%= Model.id %>">
    <td colspan="2">
        <div class="form_entry">
    <div class="form_label">
        Title</div>
    <input type="text" id="title" name="title" class="w650px" value="<%= Model.title %>" />
</div>
<div class="form_entry">
<div class="form_label">
        Content</div>
    <textarea id="content" class="w700px"><%= Model.body %></textarea>
</div>
<div class="mt10 mb10">
        <button id="buttonSave" type="button" class="large">
            <img class="am" src="/Content/img/icons/save.png" /> save</button>
            <button id="buttonCancel" type="button" class="large">
            <img class="am" src="/Content/img/icons/cancel.png" /> cancel
            </button>
</div>
    </td>
</tr> 
