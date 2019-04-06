<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<ioschoolsWebsite.Models.admin.AdminViewModel>"
    MasterPageFile="~/Views/Shared/Internal.Master" %>

<%@ Import Namespace="System.Threading" %>

<%@ Import Namespace="ioschoolsWebsite.Library.Helpers" %>

<asp:Content runat="server" ID="Title" ContentPlaceHolderID="TitleContent">
    Admin</asp:Content>
<asp:Content runat="server" ID="ExtraHeader" ContentPlaceHolderID="ExtraHeader">
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
<div id="admin_tabs" class="">
    <ul class="hidden">
        <li><a href="#settings">Settings</a></li>
        <li><a href="#school">Classes</a></li>
        <li><a href="#conduct">Conduct</a></li>
        <li><a href="#grading">Grading</a></li>
        <li><a href="#eca">ECA</a></li>
        <li><a href="#leave">Leave</a></li>
        <li><a href="#terms">School Terms</a></li>
        <li><a href="#subjects">School Subjects</a></li>
        <li><a href="#teachers">Subject Teachers</a></li>
    </ul>
    <div id="settings" class="hidden">
    <div class="section_header">
        Enrolment Notifications <a class="icon_add fr" href="#" id="addNotifiers">add user</a></div>
    <div>
        <div class="tip">
            Users that will be notified when an online enrolment is submitted</div>
        <div id="enrolment_notifiers">
            <% foreach (var usr in Model.enrolmentNotifiers)
               {%>
            <div class="blockSelectable" alt="<%= usr.id %>">
                <div class="fl w50px ac">
                    <%= usr.thumbnailString %>
                </div>
                <div class="content">
                    <p>
                        <%= usr.name %></p>
                </div>
            </div>
            <%} %>
        </div>
        <div class="clear">
        </div>
    </div>
        <div class="section_header">
        System Statistics</div>
    <div>
        <table>
            <tr>
                <td>
                    Schedulers
                </td>
                <td colspan="3">
                    1min:<%= Model.cacheTimer1Min %>
                    5min:<%= Model.cacheTimer5Min %>
                    10min:<%= Model.cacheTimer10Min %>
                    60min:<%= Model.cacheTimer60Min %>
                </td>
            </tr>
            <% int availableWorker, availableIO;
               int maxWorker, maxIO;

               ThreadPool.GetAvailableThreads(out availableWorker, out availableIO);
               ThreadPool.GetMaxThreads(out maxWorker, out maxIO); 
            %>
            <tr>
                <td>
                    Threading
                </td>
                <td colspan="3">
                    availableWorker:<%= availableWorker%>
                    availableIO:<%= availableIO%>
                    maxWorker:<%= maxWorker%>
                    maxIO:<%= maxIO%>
                </td>
            </tr>
            <tr>
                <td>
                    Others
                </td>
                <td colspan="3">
                    mailQueue: <%= Model.mailQueueLength %>
                </td>
            </tr>
        </table>
    </div>
    <div class="section_header">
        Change Logs</div>
    <div class="fl w250px">
        <form id="changeLogForm" action="/admin/changelog" method="post">
        <div class="form_entry">
            <div class="form_label">
                From</div>
            <select id="log_from_day" name="log_from_day">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
                <option>10</option>
                <option>11</option>
                <option>12</option>
                <option>13</option>
                <option>14</option>
                <option>15</option>
                <option>16</option>
                <option>17</option>
                <option>18</option>
                <option>19</option>
                <option>20</option>
                <option>21</option>
                <option>22</option>
                <option>23</option>
                <option>24</option>
                <option>25</option>
                <option>26</option>
                <option>27</option>
                <option>28</option>
                <option>29</option>
                <option>30</option>
                <option>31</option>
            </select>
            <select id="log_from_month" name="log_from_month">
                <option value="1">Jan</option>
                <option value="2">Feb</option>
                <option value="3">Mar</option>
                <option value="4">Apr</option>
                <option value="5">May</option>
                <option value="6">Jun</option>
                <option value="7">Jul</option>
                <option value="8">Aug</option>
                <option value="9">Sep</option>
                <option value="10">Oct</option>
                <option value="11">Nov</option>
                <option value="12">Dec</option>
            </select>
            <%= Html.DropDownList("log_from_year", Model.changeLogYears)%>
        </div>
        <div class="form_entry">
            <div class="form_label">
                To</div>
            <select id="log_to_day" name="log_to_day">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
                <option>10</option>
                <option>11</option>
                <option>12</option>
                <option>13</option>
                <option>14</option>
                <option>15</option>
                <option>16</option>
                <option>17</option>
                <option>18</option>
                <option>19</option>
                <option>20</option>
                <option>21</option>
                <option>22</option>
                <option>23</option>
                <option>24</option>
                <option>25</option>
                <option>26</option>
                <option>27</option>
                <option>28</option>
                <option>29</option>
                <option>30</option>
                <option>31</option>
            </select>
            <select id="log_to_month" name="log_to_month">
                <option value="1">Jan</option>
                <option value="2">Feb</option>
                <option value="3">Mar</option>
                <option value="4">Apr</option>
                <option value="5">May</option>
                <option value="6">Jun</option>
                <option value="7">Jul</option>
                <option value="8">Aug</option>
                <option value="9">Sep</option>
                <option value="10">Oct</option>
                <option value="11">Nov</option>
                <option value="12">Dec</option>
            </select>
            <%= Html.DropDownList("log_to_year", Model.changeLogYears)%>
        </div>
        <button id="searchLog" type="button">
            search</button>
        </form>
    </div>
    <div class="w700px fr" id="changelog_results">
        <% Html.RenderAction("ChangeLog"); %>
    </div>
    <div class="clear">
    </div>
    </div>
    <div id="school" class="hidden">
        <% Html.RenderAction("Classes"); %>
    </div>
    <div id="conduct" class="hidden">
        <% Html.RenderAction("Conduct"); %>
    </div>
    <div id="grading" class="hidden">
        <% Html.RenderAction("Grading"); %>
    </div>
    <div id="eca" class="hidden">
        <% Html.RenderAction("Eca"); %>
    </div>
    <div id="leave" class="hidden">
        <% Html.RenderAction("Leave"); %>
    </div>
    <div id="terms" class="hidden">
        <% Html.RenderAction("Terms"); %>
    </div>
    <div id="subjects" class="hidden">
        <% Html.RenderAction("Subjects"); %>
    </div>
    <div id="teachers" class="hidden">
        <% Html.RenderAction("Teachers"); %>
    </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            ioschools.util.setNavigation('#nadmin', 'selected_dark');
            $('#admin_tabs').tabs();
            $('#searchLog').click(function () {
                $('#changeLogForm').trigger('submit');
            });
            $('#rollover_year').numeric();
            init_inputSelectors();
            $('#rollover').click(function () {
                var newyear = $('#rollover_year').val();
                if (newyear == '') {
                    $.jGrowl('Please specify a new year');
                    return false;
                }
                var ok = window.confirm('This rolls students over to their class next year. There is NO UNDO. Continue?');
                if (!ok) {
                    return false;
                }
                $(this).post('/admin/RolloverStudents/' + newyear, null, function (json_result) {
                    if (json_result.success) {
                        $('#rollover_year').val('');
                    }
                    $.jGrowl(json_result.message);
                }, 'json');
            });
        });           // ready

        $('#log_more').live('click', function () {
            var sinceid = $('tbody > tr:last', '#changelogTable').attr('alt');
            $(this).post('/admin/changelogcontent/' + sinceid, null, function (result) {
                if (result != '') {
                    $('tbody', '#changelogTable').append(result);
                }
                else {
                    $.jGrowl('No more entries');
                }
            });
            return false;
        });

        $('#changeLogForm').submit(function () {
            var action = $(this).attr("action");
            var serialized = $(this).serialize();

            $('#searchLog').post(action, serialized, function (result) {
                $('#changelog_results').html(result);
            });

            return false;
        }); // submit

        $('#addNotifiers').bind('click', function () {
            dialogBox_open('/users/staffselect', 'Select Staff', 622);
            return false;
        });

        $('.blockSelectable', '#enrolment_notifiers').die().live('click', function () {
            var confirm = window.confirm('Remove this user?');
            if (!confirm) {
                return false;
            }
            var block = this;
            var id = $(this).attr('alt');

            $(this).post('/enrolment/deletenotifier/' + id, null, function (json_result) {
                if (json_result.success) {
                    $(block).fadeOut('fast', function () {
                        $(this).remove();
                    });
                }
                $.jGrowl(json_result.message);
            }, 'json');

        });
    </script>
</asp:Content>
