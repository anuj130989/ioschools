﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.IEnumerable<string>>" %>
<div class="info_error">
    <h3 class="font_black">The following issues were found</h3>
    <ul class="circle ml20">
    <% foreach (var row in Model)
       { %>
  <li><%= row %></li>
       <%} %>
       </ul>
</div>
