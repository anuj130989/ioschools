<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.attendance.AttendanceViewModel>" %>
<%@ Import Namespace="ioschoolsWebsite.Library" %>
<% foreach (var a in Model.attendances) {%>
<tr alt="<%= a.id%>">
    <td>
        <%= a.date%>
    </td>
    <td>
        <%= a.class_name%>
    </td>
    <td>
        <%= a.status %>
    </td>
    <td>
        <div class="<%= Model.canEdit?"inlineedit ":"" %>">
            <%= a.reason.ToHtmlBreak()%>
        </div>
    </td>
    <% if(Model.canEdit){ %>
    <td>
    <a href="#" class="assign_del">delete</a>
    </td>
    <% }%>
</tr>
<% }%>
<% if(Model.canEdit){ %>
<script type="text/javascript">
    $('.assign_del', '#attendanceTable').click(function () {
        var ok = window.confirm('Delete this entry?');
        if (!ok) {
            return false;
        }
        var row = $(this).parents('tr');
        var id = $(row).attr('alt');
        $(this).post('/attendance/delete/' + id, null, function (json_result) {
            if (json_result.success) {
                $(row).slideUp('fast', function () {
                    $(this).remove();
                });
            }
            $.jGrowl(json_result.message);
        }, 'json');
        return false;
    });

    $('.inlineedit', '#attendanceTable').inlineEdit({
        control: "textarea",
        save: function (e, data) {
            var id = $(this).parents('tr').attr('alt');
            var ok = window.confirm('Update reason?');
            var editor = this;
            var oldvalue = $(editor).data('oldvalue.inlineedit');
            if (!ok) {
                return false;
            }
            var params = {
                id: id,
                reason: data.value
            };
            $.post('/attendance/reason', params, function (json_result) {
                $.jGrowl(json_result.message);
                if (!json_result.success) {
                    $(editor).data('value.inlineedit', oldvalue);
                    $(editor).html(oldvalue);
                }
            });
        }
    });
</script>
<%} %>