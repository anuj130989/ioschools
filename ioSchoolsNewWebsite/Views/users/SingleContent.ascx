<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.user.User>" %>
<%@ Import Namespace="ioschools.Data" %>
<%@ Import Namespace="ioschoolsWebsite.Library" %>
<%@ Import Namespace="ioschools.Data.User" %>
<div id="user_<%= Model.id %>_tabs" class="tabs_clear">
    <ul class="hidden">
        <li><a href="#basic_<%= Model.id %>">Basic</a></li>
        <% if (UserSuperGroups.STAFF.HasFlag(Model.usergroup) && Model.canModifyStaff)
       { %>
       <li><a href="#staff_<%= Model.id %>">Staff</a></li>
    <li><a href="#permissions_<%= Model.id %>">Permissions</a></li>
    <% } %>
        <% if (Model.usergroup == UserGroup.STUDENT)
           {%>
        <li><a href="#attendance_<%= Model.id %>">Attendance</a></li>
        <li><a href="#discipline_<%= Model.id %>">Conduct</a></li>
        <li><a href="#ECA_<%= Model.id %>">ECA</a></li>
        <li><a href="#enrol_<%= Model.id %>">Enrolment</a></li>
        <li><a href="#fees_<%= Model.id %>">Fees</a></li>
        <li><a href="#homework_<%= Model.id %>">Homework</a></li>
        <li><a href="#remarks_<%=Model.id%>">Remarks</a></li>
        <li><a href="#exam_<%= Model.id %>">Results</a></li>
        <li class="hidden"><a href="#library_<%= Model.id %>">Library Usage</a></li>
        <%
            }%>
            <% if (Model.usergroup == UserGroup.GUARDIAN)
           {%>
        <li><a href="#statement_<%= Model.id %>">Statement</a></li>
        <li><a href="#overdue_<%= Model.id %>">Overdue Fees</a></li>
        <%
            }%>
    </ul>
    <div id="basic_<%= Model.id %>" class="hidden">
        <div id="profile_image" class="images_column fr">
            <div class="results">
                <%
                    if (Model.profilePhoto != null)
                    {%>
                <span class='thumbnail w100p m0'>
                    <img src='<%=Model.profilePhoto.url%>' alt='<%=Model.profilePhoto.id%>' />
                </span>
                <%
                    }
                    else
                    {%>
                <div class="nophoto">
                    no profile photo has been uploaded yet</div>
                <%
                    }%>
            </div>
        </div>
        <div class="fl ml10">
            <table id="personal_details_<%= Model.id %>" class="table_plain w700px mt20">
                <tbody>
                    <tr>
                        <td class="w100px">
                            ID
                        </td>
                        <td>
                            <%= Model.id %>
                        </td>
                        <td class="w100px">
                            Status
                        </td>
                        <td>
                            <%= Model.active ? "<span class='tag_green'>active</span>" : "<span class='tag_red'>inactive</span>"%>
                        </td>
                        <% if (Model.usergroup == UserGroup.STUDENT){ %>
                           <td class="w100px">
                            Rank
                        </td>
                        <td class="w100px">
                            <%= Model.rank %>
                        </td>
                        <% } else { %>
                        <td class="w100px">
                            &nbsp;
                        </td>
                        <td class="w100px">
                            &nbsp;
                        </td>
                        <% } %>
                        
                    </tr>
                    <tr>
                        <td>
                            Email
                        </td>
                        <td colspan="2">
                            <%= Model.email %>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Gender
                        </td>
                        <td>
                            <%= Model.gender %>
                        </td>
                        <% if (UserSuperGroups.STAFF.HasFlag(Model.usergroup) || UserGroup.GUARDIAN.HasFlag(Model.usergroup))
                           {%>
                        <td>
                            Marital Status
                        </td>
                        <td>
                            <%=Model.marital_status%>
                        </td>
                    <% }
                           else
                           { %>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <% } %>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Race
                        </td>
                        <td>
                            <%= Model.race %>
                        </td>
                        <td>
                            Dialect
                        </td>
                        <td>
                            <%= Model.dialect %>
                        </td>
                        <td>
                            Religion
                        </td>
                        <td>
                            <%= Model.religion %>
                        </td>
                    </tr>
                    <% if (Model.usergroup == UserGroup.STUDENT)
                       {%>
                    <tr>
                        <td>
                            Date of Birth
                        </td>
                        <td>
                            <%=Model.dob.HasValue
                                                 ? Model.dob.Value.ToString(Constants.DATETIME_SHORT_DATE)
                                                 : ""%>
                        </td>
                        <td>
                           Place of Birth
                        </td>
                        <td>
                            <%= Model.pob %>
                        </td>
                        <td>
                            Birth Cert No.
                        </td>
                        <td>
                            <%=Model.birthcertno%>
                        </td>
                    </tr>
                    <%
                       }%>
                    <tr>
                        <td>
                            Citizenship
                        </td>
                        <td>
                            <%= Model.citizenship %>
                        </td>
                        <td>
                            Passport No.
                        </td>
                        <td>
                            <%= Model.passport %>
                        </td>
                        <td>
                            NRIC
                        </td>
                        <td>
                            <%= Model.nric_new %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Home Phone
                        </td>
                        <td>
                            <%= Model.homephone %>
                        </td>
                        <td>
                            Cell Phone
                        </td>
                        <td>
                            <%= Model.cellphone %>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Home Address
                        </td>
                        <td colspan="5">
                            <%= Model.address.ToHtmlBreak() %>
                        </td>
                    </tr>
                    <% if (Model.usergroup == UserGroup.GUARDIAN)
                       {%>
                    <tr>
                        <td>
                            Occupation
                        </td>
                        <td>
                            <%= Model.occupation %>
                        </td>
                        <td>
                            Office Phone
                        </td>
                        <td>
                            <%= Model.officephone %>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Employer
                        </td>
                        <td colspan="5">
                            <%= Model.employer.ToHtmlBreak() %>
                        </td>
                    </tr>
                    <%
                        }%>
                </tbody>
            </table>
            <div class="clear">
            </div>
        </div>
        <div class="clear">
        </div>
        <% if (!string.IsNullOrEmpty(Model.notes))
           {%>
        <div class="section_header">Notes</div>
           <div class="m10">
           <%= Model.notes.ToHtmlBreak() %>
           </div>
            <%
                        }%>
                        
        <% if(UserSuperGroups.STAFF.HasFlag(Model.usergroup)){%>
        <div class="section_header">Leave Details <span class="fr"><a href="/leave/<%= Model.id %>">view details</a></span></div>
        <table class="table_brown">
            <thead>
                <tr><td>Leave Type</td><td class="w100px">Annual Total</td><td class="w100px">Remaining</td><td class="w100px">Taken</td></tr>
            </thead>
            <tbody>
                <% foreach (var leave in Model.staffLeaves)
                   {%>
                <tr>
                    <td>
                        <%= leave.name %>
                    </td>
                    <td>
                        <%= leave.annualTotal %>
                    </td>
                    <td>
                        <%= leave.remaining %>
                    </td>
                    <td>
                        <%= leave.taken %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
                        
        <%} %>
        <% if (Model.usergroup == UserGroup.STUDENT)
           {%>
           <div class="section_header">Classes</div>
           <div class="ml10">
        <table id="assignedStudentsSubjectsTable" class="table_brown">
            <thead>
                <tr>
                    <td>
                        Year
                    </td>
                    <td>
                        School
                    </td>
                    <td>
                        Class
                    </td>
                    <td>
                    </td>
                </tr>
            </thead>
            <tbody>
                <%
                    foreach (var c in Model.allocatedStudentClasses)
                    {%>
                <tr alt="<%=c.id%>">
                    <td>
                        <%=c.year%>
                    </td>
                    <td>
                        <%=c.school%>
                    </td>
                    <td>
                        <%=c.classname%>
                    </td>
                    <td>
                    </td>
                </tr>
                <%
                    }%>
            </tbody>
        </table>
        </div>
        <div class="section_header">Parents / Guardian</div>
        <div class="ml10">
        <table id="parents" class="table_brown">
            <thead>
                <tr>
                    <td>
                        Parent Name
                    </td>
                    <td>Relationship</td>
                    <td>Contact Details
                    </td>
                </tr>
            </thead>
            <tbody>
                <% foreach (var parent in Model.parents)
                   {%>
                <tr>
                    <td>
                        <a href="/users/<%= parent.id %>"><%= parent.name %></a>
                    </td>
                    <td><%= parent.relationship %></td>
                    <td><%= parent.contactInfo %>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
        </div>
        <%
            }%>
        <% if (Model.usergroup == UserGroup.TEACHER)
           {%>
           <div class="section_header">Subject Teacher</div>
           <table class="table_brown">
               <thead>
                   <tr>
                   <td class="w100px">Year</td><td class="w200px">School</td><td>Subject</td><td>Classes</td>
               </tr>
               </thead>
               <tbody>
                   <% foreach (var teaching in Model.subjectsTeaching)
                      {%>
  <tr><td><%= teaching.year %></td><td><%= teaching.school %></td><td><%= teaching.subjectname %></td><td><%= teaching.classesTeaching %></td></tr>
                    <%  } %>
               </tbody>
           </table>
           <div class="section_header">Classes</div>
        <table id="assignedTeachersSubjectsTable" class="table_brown">
            <thead>
                <tr>
                    <td>
                        Year
                    </td>
                    <td>
                        School
                    </td>
                    <td>
                        Class
                    </td>
                    <td>
                        Subject
                    </td>
                    <td>
                        Day
                    </td>
                    <td class="ar">
                        Start
                    </td>
                    <td class="ar">
                        End
                    </td>
                    <td>
                    </td>
                </tr>
            </thead>
            <tbody>
                <% foreach (var c in Model.allocatedTeacherClasses)
                   { %>
                <tr alt="<%= c.id %>">
                    <td>
                        <%= c.year %>
                    </td>
                    <td>
                        <%= c.school %>
                    </td>
                    <td>
                        <%= c.classname %>
                    </td>
                    <td>
                        <%= c.subjectname %>
                    </td>
                    <td>
                        <%= c.day %>
                    </td>
                    <td class="ar">
                        <%= c.time_start %>
                    </td>
                    <td class="ar">
                        <%= c.time_end %>
                    </td>
                    <td>
                    </td>
                </tr>
                <%} %>
            </tbody>
        </table>
        <%
            }%>
            <% if (Model.usergroup == UserGroup.GUARDIAN)
               {%>
               <div class="section_header">Children</div>
               <div class="ml10">
               <table id="children" class="table_brown">
            <thead>
                <tr>
                    <td>
                        Child's Name
                    </td>
                </tr>
            </thead>
            <tbody>
                <% foreach (var child in Model.children)
                   {%>
                <tr>
                    <td>
                        <a href="/users/<%= child.id %>"><%= child.name %></a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
        </div>
            <%
               }%>
    </div>
    <% if (UserSuperGroups.STAFF.HasFlag(Model.usergroup) && Model.canModifyStaff)
       { %>
       <div id="staff_<%= Model.id %>" class="hidden">
        <% Html.RenderPartial("~/Views/Staff/Show.ascx", Model.staff); %>
    </div>
    <div id="permissions_<%= Model.id %>" class="hidden">
        <% Html.RenderPartial("Permissions", Model.permission); %>
    </div>
    <% } %>
    <% if (Model.usergroup == UserGroup.STUDENT)
       {%>
    <div id="attendance_<%= Model.id %>" class="hidden">
        <% Html.RenderPartial("~/Views/Attendance/Show.ascx", Model.attendance); %>
    </div>
    <div id="ECA_<%= Model.id %>" class="hidden">
        <% Html.RenderPartial("~/Views/Eca/ShowStudent.ascx", Model.eca); %>
    </div>
        <div id="fees_<%= Model.id %>" class="hidden">
        <% Html.RenderAction("ShowStudent", "SchoolFees", new { studentid = Model.id }); %>
    </div>
    <div id="exam_<%= Model.id %>" class="hidden">
        <% Html.RenderAction("Show", "Exams", new { id = Model.id, Area = "Exams" }); %>
    </div>
    <div id="remarks_<%= Model.id %>" class="hidden">
        <% Html.RenderAction("Remarks", "Exams", new { id = Model.id, Area = "Exams" }); %>
    </div>
    <div id="discipline_<%= Model.id %>" class="hidden">
        <% Html.RenderPartial("~/Views/Discipline/Show.ascx", Model.discipline); %>
    </div>
    <div id="library_<%= Model.id %>" class="hidden">
    </div>
    <div id="enrol_<%= Model.id %>" class="hidden">
        <%Html.RenderPartial("~/Views/Enrolment/ShowStudent.ascx", Model.enrolments); %>
    </div>
    <div id="homework_<%= Model.id %>" class="hidden">
        <% Html.RenderPartial("~/Views/Homework/Show.ascx", Model.homework); %>
    </div>
    <% }%>
    <% if (Model.usergroup == UserGroup.GUARDIAN)
           {%>
        <div id="statement_<%= Model.id %>" class="hidden pt10">
        <% Html.RenderAction("Statement", "schoolfees", new { id = Model.id, Area = "" }); %>
    </div>
    <div id="overdue_<%= Model.id %>" class="hidden pt10">
        <% Html.RenderAction("OverdueFees", "schoolfees", new { id = Model.id, Area = "" }); %>
    </div>
        <%
            }%>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#user_<%= Model.id %>_tabs').tabs();

        $('tr', '#personal_details_<%= Model.id %>,#staff_spouse_details,#staff_details').each(function () {
            $('td:odd', this).css({'font-weight':'bold'});
        });
    });
</script>