<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.homework.HomeworkStudent>" %>
<%@ Import Namespace="ioschoolsWebsite.Library" %>
<tr class="homework" alt="<%= Model.id %>">
    <td colspan="2">
        <h2 class="fl">
            <%= Model.title %></h2>
        <span class="fr font_grey smaller">
            <%= Model.created %></span>
        <div class="clear">
        </div>
        <div class="font_grey mb10">
        <%= Model.subjectname %> - <%= string.Join(", ", Model.classes.Select(x => x.name).ToArray()) %></div>
        <p>
            <%= Model.message.ToHtmlBreak() %></p>
        <% if (Model.files.Count() != 0)
           {%>
        <div class="bold icon_pin mt20">
            Attachments</div>
        <%
           foreach (var file in Model.files)
           {%>
        <a class="icon_file" target="_blank" href="<%=file.url%>">
            <%=file.name%></a>
        <%
       }
       }%>
        <div class="clear">
        </div>
        <% if (Model.answers.Any() || Model.canUploadAnswer)
           {%>
  <div id="homework_answer_container" class="mt10">
            <div id="student_actions_container" class="mt20">
                <h3>
                    Uploaded Answers</h3>
                <div class="answer_files_<%= Model.id %>" class="mt10">
                    <% foreach (var file in Model.answers)
                       {%>
                    <a class="icon_file" target="_blank" href="<%=file.url%>">
                        <%=file.name%></a>
                    <%} %>
                </div>
                <div class="clear mb20">
                </div>
                <% if (Model.canUploadAnswer)
                   { %>
                <div id="buttonStudentUpload<%= Model.id %>" class="w250px">
                </div>
                <% } %>
            </div>
        </div>
           <%} %>
        
        <script type="text/javascript">
    <% if (Model.canUploadAnswer)
   { %>
    $(document).ready(function() {
        var uploader = new qq.FileUploader({
            element: $('#buttonStudentUpload<%= Model.id %>')[0],
            action: '/homework/uploadanswer/<%= Model.id %>',
            sizeLimit: 10485760,
            onSubmit: function (id, filename) {

            },
            onComplete: function (id, filename, json_data) {
                // enable upload button
                if (json_data.success) {
                    var file = json_data.data;
                    var html = ['<span class="file" alt="', file.id, '">', file.name, '</span>'];
                    $('.answer_files_<%= Model.id %>').append(html.join(''));
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
    });
    <% } %>
        </script>
    </td>
</tr>
