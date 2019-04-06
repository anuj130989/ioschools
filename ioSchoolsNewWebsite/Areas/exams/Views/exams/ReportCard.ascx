<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.exam.ReportCardExamSelectViewModel>" %>
<h1 class="icon_user">
    <%= Model.student_name %></h1>
<form id="examSelectForm" action="/exams/reportcard" method="post">
<div class="form_entry ml10">
    <div class="form_label">
        Exam Year</div>
    <%= Html.DropDownList("year", Model.yearList) %>
</div>
<div class="form_entry ml10">
    <div class="form_label">
        Exam Result</div>
    <%= Html.DropDownList("result", Model.examList, new Dictionary<string, object>(){{"class","w200px_min"}}) %>
</div>
<div class="form_entry ml10">
    <div class="form_label">
        Term</div>
    <%= Html.DropDownList("term", Model.termList) %>
</div>
<div class="form_entry ml10">
    <%= Html.CheckBox("allclass") %> <label for="allclass">Export for all students in same class</label>
</div>
<div class="mt10">
        <button id="buttonCreate" type="button" class="medium">
        <img class="am" src="/Content/img/icons/document.png" />
        create report card</button>
    <a href="#" onclick="dialogBox_close();return false;">close</a>
</div>
<%= Html.Hidden("studentid", Model.studentid) %>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        init_inputSelectors('#examSelectForm');
        $('#year', '#examSelectForm').bind('change', function () {
            var year = $(this).val();
            var studentid = $('#studentid', '#examSelectForm').val();
            if (year != '') {
                $(this).post('/exams/select', { studentid: studentid, year: year }, function (json_result) {
                    if (json_result.success) {
                        $('#result', '#examSelectForm').html('<option value="">None</option>');
                        $.each(json_result.data, function () {
                            var option = "<option value=" + this.id + ">" + this.name + "</option>";
                            $('#result', '#examSelectForm').append(option);
                        });
                    }
                    else {
                        $.jGrowl(json_result.message);
                    }
                }, 'json');
            }
        });
    });

    $('#buttonCreate', '#examSelectForm').click(function () {
        $('#examSelectForm').trigger('submit');
    });
    
</script>
