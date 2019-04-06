﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="p10">
<button id="enrolmentUpdate" type="button"><img class="am" src="/Content/img/icons/edit.png" /> update enrolment</button>
</div>
<script type="text/javascript">
    function enrol_loadcontent(enrolid, row) {
        $(row).showLoadingBlock(true);
        $.post('/enrolment/showstudent/' + enrolid, function (result) {
            $(row).html(result);
        });
    }

    $('#enrolmentUpdate').click(function () {
        var row = $(this).closest('.enrolment_row');
        var id = $(row).attr('alt');
        $(row).showLoadingBlock(true);
        $(this).post('/enrolment/editstudent/' + id, function (json_result) {
            if (json_result.success) {
                $(row).html(json_result.data);

                // bind buttons
                $('#buttonSave', row).click(function () {
                    var serialized = $('#enrolForm', row).serialize();
                    var action = $('#enrolForm', row).attr("action");

                    // post form
                    $(this).post(action, serialized, function (json_result) {
                        if (json_result.success) {
                            enrol_loadcontent(id, row);
                        }
                        $.jGrowl(json_result.message);
                    }, 'json');
                    return false;
                });

                $('#buttonCancel', row).click(function () {
                    enrol_loadcontent(id, row);

                    return false;
                });
            } else {
                $.jGrowl(json_result.message);
            }
        });

        return false;
    });
</script>