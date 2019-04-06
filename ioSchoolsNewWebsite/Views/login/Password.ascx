<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<form id="passwordForm" action="/login/password" method="post">
<div class="form_entry">
    <div class="form_label">
        <label>
            New Password</label>
    </div>
    <%= Html.Password("newPass") %>
</div>
<div class="form_entry">
    <div class="form_label">
        <label>
            Enter New Password Again</label>
    </div>
    <%= Html.Password("newPassConfirm")%>
</div>
<div class="mt10">
    <button id="buttonSave" type="button" class="ajax green">
        <img class="am" src="/Content/img/icons/save.png" /> save</button>
</div>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        $('#buttonSave', '#passwordForm').click(function () {
            $(this).trigger('submit');
        });

        $('#passwordForm').submit(function () {
            var action = $(this).attr("action");
            var serialized = $(this).serialize();
            var ok = $('#passwordForm').validate({
                invalidHandler: function (form, validator) {
                    $(validator.invalidElements()[0]).focus();
                },
                focusInvalid: false,
                rules: {
                    newPass: {
                        required: true,
                        minlength: 6
                    },
                    newPassConfirm: {
                        required: true,
                        minlength: 6,
                        equalTo: '#newPass'
                    }
                }
            }).form();
            if (!ok) {
                return false;
            }
            // post form
            $.ajax({
                type: "POST",
                url: action,
                data: serialized,
                context: $('#buttonSave', '#passwordForm'),
                dataType: 'json',
                success: function (json_data) {
                    if (json_data.success) {
                        $.jGrowl(json_data.message);
                        dialogBox_close();
                    }
                    else {
                        $.jGrowl(json_data.message);
                    }
                    return false;
                }
            });
            return false;
        });
        init_inputSelectors();
    });
</script>

