<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.fees.viewmodel.FeeStatusUpdateViewModel>" %>
<%@ Import Namespace="ioschoolsWebsite.Models.fees" %>
<h2><%= Model.year %> <%= Model.feename %> <span class="smaller font_grey"><%= Model.schoolname %></span></h2>
<form id="bulkUpdateForm" method="post" action="/finance/bulkupdate">
    <%= Html.Hidden("feetypeid", Model.feetypeid)%>
<div class="mt10">Payment Due Date <%= Html.TextBox("duedate", Model.duedate) %></div>
<div class="bt br bl p10 mt20 bg_lightgrey">
    <div class="mt10">
        For
        <select id="bulk_check">
            <option value="selected">selected</option>
            <option value="unselected">unselected</option>
        </select>
        rows, set the
        <select id="bulk_type">
            <option value="status">status</option>
            <option value="amount">fee amount</option>
        </select>
        to
        <select id="bulk_status" class="hidden">
            <option value="PAID">PAID</option>
            <option value="UNPAID">UNPAID</option>
        </select>
        <input type="text" id="bulk_amount" class="hidden" />
        <button id="bulkUpdate" type="button">
            Mass Update Rows</button>
    </div>
</div>

<table id="feeupdate_table" class="table_edit m0">
    <thead>
        <tr>
            <td class="w25px">
                <input type="checkbox" id="checkall" />
            </td>
            <td>
                Student Name
            </td>
            <td>
                Amount, RM
            </td>
            <td>
                Status
            </td>
        </tr>
    </thead>
    <tbody>
        <% foreach (var row in Model.studentList)
           { %>
        <tr>
            <td class="w25px">
                <input type="checkbox" id="check" />
                <%= Html.Hidden("id", row.id) %>
            </td>
            <td>
                <%= row.studentname %>
                <div class="bold"><%= row.classname %></div>
                <%= Html.Hidden("studentid", row.studentid) %>
            </td>
            <td>
                <%= Html.TextBox("amount", row.amount, new Dictionary<string, object>(){{"class","ar"}}) %>
            </td>
            <td>
                <%= Html.DropDownList("status", row.statusList) %>
            </td>
        </tr>
        <%  } %>
    </tbody>
</table>
</form>
<div class="buttonRow_bottom">
    <span class="mr10">
        <button type="button" id="buttonCancel" class="ajax large">
           <img class="am" src="/Content/img/icons/cancel.png" /> cancel</button>
        <button type="button" id="buttonSave" class="ajax large">
           <img class="am" src="/Content/img/icons/save.png" /> save</button>
    </span>
</div>
<script type="text/javascript">
    function init_feebulkfields() {
        $('#bulk_amount', '#feeupdate_container').numeric({allow:',.'});
        $('#bulk_status,#bulk_amount', '#feeupdate_container').hide();
        var type = $('#bulk_type', '#feeupdate_container').val();
        switch (type) {
            case 'status':
                $('#bulk_status', '#feeupdate_container').show();
                break;
            case 'amount':
                $('#bulk_amount', '#feeupdate_container').show();
                break;
            default:
                throw "unknown fee bulk update type";
        }
    }
    
    function feetable_selectrow(select, row) {
        if (select) {
            $('input[type=checkbox]', row).attr('checked', true);
            $(row).animate({ backgroundColor: "#2C85D3", color: "#ffffff" });
        } else {
            $('input[type=checkbox]', row).attr('checked', false);
            $(row).animate({ backgroundColor: "#FFFFCC", color: "#000000" });
        }
    }

    $('#check', '#feeupdate_table').click(function () {
        var checked = $(this).is(':checked');
        feetable_selectrow(checked, $(this).closest('tr'));
    });

    $(document).ready(function () {
        init_feebulkfields();
        $('#buttonCancel', '#feeupdate_container').one('click', function () {
            $('#fee_content', '#feeupdate_container').html('');
        });


        $('#bulk_type', '#feeupdate_container').change(function () {
            init_feebulkfields();
        });

        $("#duedate", '#feeupdate_container').datepicker(
        {
            dateFormat: 'D, d M yy'
        });

        $("#duedate", '#feeupdate_container').attr('readonly', 'readonly');

        $('#checkall', '#feeupdate_table').click(function () {
            var checked = $(this).is(':checked');
            $('tr', '#feeupdate_table > tbody').each(function () {
                feetable_selectrow(checked, this);
            });
        });

        $('#bulkUpdate', '#feeupdate_container').click(function () {
            var selected = $('#bulk_check', '#feeupdate_container').val() == 'selected';
            var type = $('#bulk_type', '#feeupdate_container').val();

            switch (type) {
                case 'status':
                    var status = $('#bulk_status', '#feeupdate_container').val();
                    $('input[type=checkbox]' + (selected ? ':checked' : ':not(:checked)'), '#feeupdate_table > tbody').each(function () {
                        var row = $(this).closest('tr');
                        $('#status', row).val(status);
                    });
                    break;
                case 'amount':
                    var amount = $('#bulk_amount', '#feeupdate_container').val();
                    $('input[type=checkbox]' + (selected ? ':checked' : ':not(:checked)'), '#feeupdate_table > tbody').each(function () {
                        var row = $(this).closest('tr');
                        $('#amount', row).val(amount);
                    });
                    break;
                default:
                    throw "Unknown fees bulk update type";
            }
        });

        $('#buttonSave', '#feeupdate_container').click(function () {
            // get rows with status set
            $('#bulkUpdateForm').trigger('submit');
        });
    });

    $('#bulkUpdateForm').submit(function () {
        var action = $(this).attr("action");
        var serialized = $(this).serialize();
        var ok = $(this).validate({
            invalidHandler: function (form, validator) {
                $(validator.invalidElements()[0]).focus();
            },
            focusInvalid: false,
            rules: {
                duedate: {
                    required: true
                }
            }
        }).form();
        if (!ok) {
            return false;
        }
        
        $('#buttonSave', '#feeupdate_container').post(action, serialized, function (json_result) {
            if (json_result.success) {
                $('#fee_content', '#feeupdate_container').html('');
            }
            $.jGrowl(json_result.message);
        });

        return false;

    });
    
</script>
