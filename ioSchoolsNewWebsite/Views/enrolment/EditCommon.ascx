<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.enrolment.Enrolment>" %>
<form id="enrolForm" autocomplete="off" action="<%= Url.Action("Update","Enrolment") %>" method="post">
<div class="fl">
<div class="fl mr10 form_entry">
<div class="form_label">Status</div>
<%= Html.DropDownList("enrol_status", Model.enrol_statusList)%>
</div>
<div class="clear"></div>
<div class="fl mr10 form_entry">
<div class="form_label">Year Enrolling</div>
<%= Html.TextBox("enrol_year", Model.year)%>
</div>
<div class="fl mr10 form_entry">
<div class="form_label">School</div>
<%= Html.DropDownList("enrol_school", Model.enrol_schoolList)%>
</div>
<div class="fl mr10 form_entry">
<div class="form_label">School Year</div>
<%= Html.DropDownList("enrol_schoolyear", Model.enrol_yearList)%>
</div>
</div>
<div class="fr">
    <div class="form_entry">
    <div class="form_label">
        Admission Date</div>
        <div class="tip w250px">If past Admission Date, status becomes ACTIVE</div>
    <%= Html.DropDownList("admission_day", Model.admissionDayList)%>
    <%= Html.DropDownList("admission_month", Model.admissionMonthList)%>
    <%= Html.TextBox("admission_year", Model.admissionDate.HasValue ? Model.admissionDate.Value.Year.ToString() : "", 
    new Dictionary<string, object> { { "class", "w70px" } })%>
</div>
<div class="form_entry">
    <div class="form_label">
        Leaving Date</div>
        <div class="tip w250px">If past Leaving Date, status becomes INACTIVE</div>
    <%= Html.DropDownList("left_day", Model.leftDayList)%>
    <%= Html.DropDownList("left_month", Model.leftMonthList)%>
    <%= Html.TextBox("left_year", Model.leftDate.HasValue ? Model.leftDate.Value.Year.ToString() : "", 
    new Dictionary<string, object> { { "class", "w70px" } })%>

</div>
<div class="clear"></div>
</div>
<div class="clear"></div>
<div class="form_entry">
    <div class="form_label">
        Name and Address of last School / Nursery / Play group attended</div>
            <%= Html.TextArea("previous_school", Model.previous_school, new Dictionary<string, object> { { "class", "w99p" } })%>
</div>
<div class="form_entry">
    <div class="form_label">
        Previous class attended</div>
    <%= Html.TextBox("previous_class", Model.previous_class)%>
</div>
<div class="form_entry">
    <div class="form_label">
        Date and reason for leaving</div>
    <%= Html.TextArea("leaving_reason", Model.leaving_reason, new Dictionary<string, object> { { "class", "w99p" } })%>
</div>
<div class="form_entry">
<%= Html.CheckBox("handicap", Model.handicap)%> <label for="handicap">Has a physical handicap or medical problem</label>
</div>
<div class="form_entry">
<%= Html.CheckBox("learning_problems", Model.learning_problems)%> <label for="learning_problems">Has learning difficulties</label>
</div>
<div class="form_entry">
    <div class="form_label">
        Disability details</div>
        <%= Html.TextArea("disability_details", Model.disability_details, new Dictionary<string, object> { { "class", "w99p" } })%>
</div>
<div id="message_area" class="form_entry">
<div class="form_label">Message To Guardian/Parent</div>
<span class="tip">email a message to the child's parent/guardian</span>
<textarea id="message" name="message" class="w99p"></textarea>
<%= Html.CheckBox("sendmessage")%><label for="sendmessage">send above message to parent/guardian</label>
</div>

<%= Html.Hidden("id", Model.id) %>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        $('#rank,#enrol_year,#admission_year,#left_year').numeric();
        init_inputSelectors('#enrolForm');
        init_autogrow('#enrolForm');
        $('#admission_year,#left_year').watermark('year');
    });
</script>