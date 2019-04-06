<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.stats.ClassStatistics>" %>
<h3 class="fl">Student Demographic</h3>
<div class="fr">
<form id="statsExportForm" method="post" action="/schools/exportstats">
<%= Html.Hidden("ugroup", Model.usergroup.ToString())%>
<%= Html.Hidden("school", Model.school.ToString()) %>
<%= Html.Hidden("year", Model.year) %>
<button id="statExport" type="submit">export <img src="/Content/img/icons/continue.png" class="am" /></button>
</form>
</div>
<div class="clear_right"></div>
<table class="table_blue ac">
<thead>
<tr><td colspan="2">Malaysian</td><td colspan="2">Foreigners</td><td colspan="2">SubTotal</td><td>Total</td></tr>
<tr><td>M</td><td>F</td><td>M</td><td>F</td><td>M</td><td>F</td><td></td></tr>
</thead>
<tbody>
<tr>
<td><%= Model.msian_male %></td><td><%= Model.msian_female %></td><td><%= Model.foreign_male %></td><td><%= Model.foreign_female %></td><td><%= Model.msian_male + Model.foreign_male %></td><td><%= Model.msian_female + Model.foreign_female %></td><td><%= Model.msian_male + Model.msian_female + Model.foreign_male + Model.foreign_female %></td>
</tr>
</tbody>
</table>

<% foreach (var statistic in Model.collections)
   {%>
<h4>
    <%= statistic.name %></h4>
<table class="table_grey ac">
    <thead>
        <tr>
            <% foreach (var race in statistic.GetList())
               {%>
            <td colspan="2" class="br bold">
                <%= race.name %>
            </td>
            <%} %>
            <td class="w50px"><strong>Total</strong></td>
        </tr>
        <tr>
            <% for (int i = 0; i < statistic.GetList().Count(); i++)
               {%>
            <td>
                M
            </td>
            <td class="br">
                F
            </td>
            <%} %>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <% foreach (var race in statistic.GetList())
               {%>
            <td>
                <%= race.male %>
            </td>
            <td class="br">
                <%= race.female %>
            </td>
            <%} %>
            <td><strong><%= statistic.GetList().Sum(x => x.male + x.female) %></strong></td>
        </tr>
    </tbody>
</table>
<%} %>
<script type="text/javascript">
    $(document).ready(function () {
        $('#statExport').click(function () {
            var ok = window.confirm('Export statistics to excel?');
            if (!ok) {
                return false;
            }
            $(this).trigger('submit');
        });
    });
</script>
