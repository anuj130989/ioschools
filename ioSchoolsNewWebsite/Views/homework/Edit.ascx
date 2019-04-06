<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.homework.Homework>" %>
<tr id="homework<%= Model.contextid %>" alt="<%= Model.id %>" class="homework bg_edit">
    <td colspan="2">
        <div class="form_entry">
            <div class="form_label">
                <label>
                    Subject</label>
            </div>
           <%= Html.DropDownList("subject", Model.subjectList) %>
        </div>
        <div class="form_entry">
            <div class="form_label">
                <label>
                    Title</label>
            </div>
            <%= Html.TextBox("title", Model.title, new Dictionary<string, object>(){{"class", "w300px"}}) %>
        </div>
        <div class="form_entry">
            <div class="form_label">
                <label>
                    Message</label>
            </div>
            <%= Html.TextArea("message", Model.message, new Dictionary<string, object>(){{"class", "w99p"}}) %>
        </div>
        <div class="form_entry">
            <div class="form_label">
                <label>
                    Notifications</label>
            </div>
            <select id="notifyme" name="notifyme">
                <option value="True" <%= Model.notifyme?"selected='selected'":"" %>>Notify me when a student uploads an answer</option>
                <option value="False" <%= !Model.notifyme?"selected='selected'":"" %>>Don't notify me when a student uploads an answer</option>
            </select>
        </div>
        <div class="form_entry">
            <div class="form_label">
                <label>
                    Files</label>
            </div>
            <div id="buttonUpload" class="w250px"></div>
<div class="homework_files_content">
<% foreach (var file in Model.files)
{%>
  <span class="file" alt="<%= file.id %>"><%= file.name %></span>
<%} %>
</div>
        </div>
         <% if (!Model.editmode){%>
        <div class="form_entry">
            <div class="form_label">
                <label>
                    Students</label>
            </div>
  <%= Html.DropDownList("homework_class", Model.classList) %> 
<button id="class_add" type="button" class="small"><img class="am" src="/Content/img/icons/plus.png" /> show students</button>
   <div class="homework_class_content">
<% Html.RenderAction("studentSelector", "users"); %>
</div>
        </div>
        <%  } %>
        <div class="mt10 mb10">
        <button type="button" id="buttonSave" class="large"><img class="am" src="/Content/img/icons/save.png" /> save</button>
            <button id="buttonCancel" type="button" class="large"><img class="am" src="/Content/img/icons/cancel.png" /> cancel</button>
    </div>
    </td>
</tr>
<script type="text/javascript">
    if (typeof(studentSelectorHandler) != 'undefined') {
        var homeworkStudentSelector<%= Model.contextid %> = new studentSelectorHandler();
    }
    
    $(document).ready(function () {
        init_autogrow('#homework<%= Model.contextid %>');
        init_inputSelectors('#homework<%= Model.contextid %>');
        initAjaxUpload('#homework<%= Model.contextid %>');
        
        // live doesnt seem to work
        $('#class_add', '#homework<%= Model.contextid %>').bind('click', function () {
            var row = $(this).closest('tr');
            var id = $('#homework_class', row).val();
            if (typeof(homeworkStudentSelector<%= Model.contextid %>) != 'undefined') {
                homeworkStudentSelector<%= Model.contextid %>.init([id], new Date().getFullYear(), '#homework<%= Model.contextid %>');
            }
            return false;
        });

        $('.file', '#homework<%= Model.contextid %>').die().live('click', function () {
            var ok = window.confirm('Are you sure you want to delete this attachment? There is NO UNDO.');
            if (!ok) {
                return false;
            }
            var id = $(this).attr('alt');
            var file = this;
            $(this).post('/files/delete/' + id, null, function (json_result) {
                if (json_result.success) {
                    $(file).fadeOut('fast', function () {
                        $(this).remove();
                    });
                }
                $.jGrowl(json_result.message);
            });
            return false;
        });

        $('#buttonSave', '#homework<%= Model.contextid %>').click(function () {
            var row = $(this).closest('tr');
            var homework = {
                id: $(row).attr('alt'),
                title: $('#title', row).val(),
                message: $('#message', row).val(),
                subject: $('#subject', row).val(),
                notifyme: $('#notifyme', row).val(),
                students: [],
                files: []
            };
            if (typeof(homeworkStudentSelector<%= Model.contextid %>) != 'undefined') {
                homework.students = homeworkStudentSelector<%= Model.contextid %>.get();
            }
            var files = $('.file', row);
            $.each(files, function () {
                var file = {
                    id: $(this).attr('alt'),
                    name: $(this).text()
                };
                homework.files.push(file);
            });

            $.ajax({
                contentType: 'application/json',
                type: "POST",
                url: '/homework/save',
                dataType: "json",
                context: this,
                data: JSON.stringify(homework),
                success: function (json_result) {
                    if (json_result.success) {
                        $(row).fadeOut('fast', function() {
                        row.replaceWith($(json_result.data));
                    });
                    }
                    $.jGrowl(json_result.message);
                }
            });
        });
    });

</script>
