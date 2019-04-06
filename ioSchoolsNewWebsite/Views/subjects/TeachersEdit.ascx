<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.subject.SubjectTeacher>" %>
<tr class="bg_edit">
    <td>
        <%= Model.subjectname%>
    </td>
    <td>
        <%= Html.Hidden("subjectid", Model.subjectid)%>
        <ul id="tsubject_spare" class=" hidden">
            <li class="bb p5">
                    <div class="fl">
                        <%= Html.DropDownList("teacher", Model.teachers.First().teachers)%><a href="#" class="teacher_delete hover_delete ml10">teacher</a>
                        <div class="allocatedclasses mt5">
                        </div>
                    </div>
                    <div class="fr">
                        <%= Html.DropDownList("schoolclass", Model.teachers.First().classes)%><a href="#" class="icon_add ml10 class_add">class</a>
                    </div>
                    <div class="clear"></div>
                </li>
        </ul>
        <ul id="tsubject_editor">
                <% foreach (var entry in Model.teachers)
                   {%>
                <li class="bb p5">
                    <div class="fl">
                        <%= Html.DropDownList("teacher", entry.teachers)%><a href="#" class="teacher_delete hover_delete ml10">teacher</a>
                        <div class="allocatedclasses mt5">
                            <%foreach (var klass in entry.AllocatedClasses)
                              {%>
                            <span class="tag">
                                <%= klass.name %><%= Html.Hidden("sclass", klass.id) %></span>
                            <%} %>
                        </div>
                    </div>
                    <div class="fr">
                        <%= Html.DropDownList("schoolclass", entry.classes)%><a href="#" class="icon_add ml10 class_add">class</a>
                    </div>
                    <div class="clear"></div>
                </li>
                <%} %>
                </ul>
                <div class="clear pt20">
                        <a href="#" class="icon_add teacher_add">add another teacher to this subject</a>
                </div>
        
    </td>
    <td class="w100px">
        <button id="buttonSave" type="button">
            <img class="am" src="/Content/img/icons/save.png" />
            save</button>
        <br />
        <button id="buttonCancel" type="button">
            <img class="am" src="/Content/img/icons/cancel.png" />
            cancel</button>
    </td>
</tr>
