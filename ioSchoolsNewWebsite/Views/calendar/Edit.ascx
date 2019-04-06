<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.calendar.admin.CalendarAdminEntry>" %>
<%@ Import Namespace="ioschools.Data" %>
<tr alt="<%= Model.id %>">
    <td>
        <%= Html.TextBox("date", Model.date.ToString(Constants.DATEFORMAT_DATEPICKER_SHORT))%>
    </td>
    <td>
        <%= Html.TextBox("description", Model.description, new Dictionary<string, object>(){{"class","w95p"}})%>
    </td>
    <td>
    <select id="holiday">
    <option value="False" <%= !Model.isHoliday?"selected='selected'":"" %>>No</option>
    <option value="True" <%= Model.isHoliday?"selected='selected'":"" %>>Yes</option>
    </select>
    </td>
    <td>
        <button id="buttonSave" type="button">
            <img class="am" src="/Content/img/icons/save.png" /> save</button>
            <button id="buttonCancel" type="button">
            <img class="am" src="/Content/img/icons/cancel.png" /> cancel
            </button>
    </td>
</tr>
