<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.IEnumerable<SelectListItem>>" %>
<tr>
<td>
<%= Html.TextBox("year", DateTime.UtcNow.Year, new Dictionary<string, object>() { { "class", "w70px" } })%>
</td>
<td>
<%= Html.DropDownList("school", Model) %>       
</td>
<td>
<select id="schoolclass" name="schoolclass"></select>
</td>
<td class="ar">
<a class="assign_del" href="#">delete</a>
</td>
</tr>
