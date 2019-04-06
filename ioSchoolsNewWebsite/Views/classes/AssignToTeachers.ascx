<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.IEnumerable<SelectListItem>>" %>
<tr class="bg_edit">
<td>
<%= Html.TextBox("year", DateTime.UtcNow.Year, new Dictionary<string, object>() { { "class", "w70px" } })%>
</td>
<td>
<%= Html.DropDownList("school", Model) %>    
</td>
<td>
<select id="schoolclass" name="schoolclass"></select>
</td>
<td>
<select id="subject" name="subject"></select>
</td>
<td>
<select id="day" name="day">
<option value="1">Monday</option>
<option value="2">Tuesday</option>
<option value="3">Wednesday</option>
<option value="4">Thursday</option>
<option value="5">Friday</option>
<option value="6">Saturday</option>
<option value="0">Sunday</option>
</select>
</td>
<td>
<select id="start_hour" name="start_hour">
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
</select>
<select id="start_minutes" name="start_minutes">
<option value="0">00</option>
<option value="5">05</option>
<option value="10">10</option>
<option value="15">15</option>
<option value="20">20</option>
<option value="25">25</option>
<option value="30">30</option>
<option value="35">35</option>
<option value="40">40</option>
<option value="45">45</option>
<option value="50">50</option>
<option value="55">55</option>
</select>
</td>
<td>
<select id="end_hour" name="end_hour">
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
</select>
<select id="end_minutes" name="end_minutes">
<option value="0">00</option>
<option value="5">05</option>
<option value="10">10</option>
<option value="15">15</option>
<option value="20">20</option>
<option value="25">25</option>
<option value="30">30</option>
<option value="35">35</option>
<option value="40">40</option>
<option value="45">45</option>
<option value="50">50</option>
<option value="55">55</option>
</select>
</td>
<td class="ar">
<a class="assign_del" href="#">delete</a>
</td>
</tr>