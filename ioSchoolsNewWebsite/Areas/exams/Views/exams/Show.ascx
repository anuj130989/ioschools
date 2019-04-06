<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.exam.ExamStudentViewModel>" %>

<div class="mt10" id="exam_year_selector_<%= Model.studentid %>">
    <%=Html.DropDownList("exam_year_select", Model.years)%>
</div>

<div id="exam_results_<%= Model.studentid %>">

    <% Html.RenderAction("ExamContent", "Exams", new { id = Model.studentid, year = Model.year, Area = "exams"}); %>

</div>
<script type="text/javascript">
    $('select', '#exam_year_selector_<%= Model.studentid %>').bind('change', function () {
        var selected = $(this).val();
        if (selected != '') {
            $(this).post('/exams/examcontent/' + <%= Model.studentid %>, { year: selected }, function (result) {
                $('#exam_results_<%= Model.studentid %>').html(result);
            });
        }
        return false;
    });
</script>
