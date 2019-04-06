<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.notifications.NotificationSendViewModel>" %>
<p>
    Select parents/guardian to notify</p>
<form id="sendAttendanceForm" action="/attendance/send" method="post">
<div class="form_entry">
    <% if (!Model.parents.Any())
       {%>
    <span class="tag_red">no parents/guardian information found</span>
    <%
        }
       else
       {%>
    <ul>
        <%
            foreach (var parent in Model.parents)
            {%>
        <li>
            <input type="checkbox" id="parent_<%=parent.id%>" name="parent" value="<%=parent.id%>" /><label
                for="parent_<%=parent.id%>"><%=parent.name%></label></li>
        <%
            }%>
    </ul>
    <%
        }%>
</div>
<div class="form_entry">
    <div class="form_label">
        <label>
            Message</label>
    </div>
    <%= Html.TextArea("message", Model.message, 
        new Dictionary<string, object> { { "style", "width:100%" } })%>
</div>
<div class="form_entry">
    <div class="form_label">
        <label>
            Send using:</label>
    </div>
    <ul class="fl">
        <li><%= Html.CheckBox("use_email", true)%><label for="use_email">Email</label></li>
        <li><%= Html.CheckBox("use_SMS", false, new Dictionary<string, object>() { { "disabled", "disabled" } })%><label for="use_SMS">SMS</label></li>
    </ul>
</div>
<div class="clear"></div>
<div class="mt10">
    <button id="buttonSend" type="button" class="medium">
        send</button>
    <a href="#" onclick="dialogBox_close();return false;">cancel</a>
</div>
<%= Html.Hidden("studentid", Model.studentid)%>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        $('#buttonSend', '#sendAttendanceForm').click(function () {
            $(this).trigger('submit');
        });

        $('#sendAttendanceForm').submit(function () {
            var action = $(this).attr("action");
            var serialized = $(this).serialize();
            var ok = $('#sendAttendanceForm').validate({
                invalidHandler: function (form, validator) {
                    $(validator.invalidElements()[0]).focus();
                },
                focusInvalid: false,
                rules: {
                    message: {
                        required: true
                    }
                }
            }).form();
            if (!ok) {
                return false;
            }
            // post form
            $('#buttonSend', '#sendAttendanceForm').post(action, serialized, function (json_result) {
                if (json_result.success) {
                    dialogBox_close();
                }
                $.jGrowl(json_result.message);
            });
            return false;
        });
        init_inputSelectors();
        init_autogrow('#sendAttendanceForm');
    });
</script>
