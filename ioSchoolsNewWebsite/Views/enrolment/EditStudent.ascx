<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.enrolment.Enrolment>" %>
<div class="bg_edit p10">
    <% Html.RenderPartial("EditCommon", Model); %>
    <div class="mt10">
        <button id="buttonSave" type="button" class="ajax large">
            <img class="am" src="/Content/img/icons/save.png" />
            save</button>
        <button id="buttonCancel" type="button" class="ajax large">
            <img class="am" src="/Content/img/icons/cancel.png" />
            cancel</button>
    </div>
</div>
