<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.homework.viewmodels.HomeworkStudentViewModel>" %>
<div class="content_filter mt20">
            <div class="mt10">
                <%= Html.DropDownList("homework_subject", Model.subjects) %>
            </div>
</div>
<div class="main_columnright">
    <table id="homeworkTable" class="table_grey">
        <thead>
            <tr><td colspan="2">Homeworks</td></tr>
        </thead>
        <tbody>
            <% Html.RenderPartial("~/Views/Homework/StudentRows.ascx", Model.homeworks); %>
        </tbody>
    </table>
</div>    
<script type="text/javascript">
    $('#homework_subject').change(function () {
        var subject = $('#homework_subject').val();
        $('tbody', '#homeworkTable').showLoadingBlock(true);
        $(this).post('/homework/studentrows', { subject: subject }, function (result) {
            $('tbody', '#homeworkTable').html(result);
        });
    });

    function initAjaxUpload(context) {
        // upload url
        var uploader = new qq.FileUploader({
            element: $('#buttonUpload', context)[0],
            action: '/files/upload',
            sizeLimit: 10485760,
            onSubmit: function (id, filename) {

            },
            onComplete: function (id, filename, json_data) {
                // enable upload button
                if (json_data.success) {
                    var file = json_data.data;
                    var html = ['<span class="file" alt="', file.id, '">', file.name, '</span>'];
                    $('.homework_files_content', context).append(html.join(''));
                }
                else {
                    if (json_data.message == undefined || json_data.message == '') {
                        $.jGrowl("Oops. Something wrong has occurred. We're currently looking into this.");
                    }
                    else {
                        $.jGrowl(json_data.message);
                    }
                }
            }
        });
    }
    
</script>
