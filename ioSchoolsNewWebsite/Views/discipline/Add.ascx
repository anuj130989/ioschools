<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<button id="disciplineAdd" type="button"><img class="am" src="/Content/img/icons/plus.png" /> create discipline entry</button>
<button id="disciplineNotify" type="button"><img src="/Content/img/icons/send.png" class="am" /> notify parents/guardian</button>
<script type="text/javascript">
    function discipline_initeditrow(row) {
        init_autogrow(row);
        init_inputSelectors(row);
        $('#discipline_reason', row).limit(1000);
    }
    
    $('#disciplineAdd').click(function () {
        $(this).getx('/discipline/edit', function (result) {
            $('.norow', '#disciplineTable').remove();
            $('#disciplineTable > tbody').prepend(result);
            discipline_initeditrow($('#disciplineTable > tbody', '#disciplineTable'));
        });
    });

    $('#discipline_type', '#disciplineTable').die().live('change', function () {
        var selected = $(this).val();
        if (selected == '') {
            return false;
        }

        var row = $(this).closest('tr');
        var point = $('#discipline_points', row).attr('alt');

        return $(this).post('/discipline/points/' + selected, function (json_result) {
            if (json_result.success) {
                if (json_result.data.min && json_result.data.max) {
                    var selector = $('<select/>').attr('id', 'points_selector');
                    var min = parseInt(json_result.data.min, 10);
                    var max = parseInt(json_result.data.max, 10);
                    for (var i = min; i <= max; i++) {
                        var option = "<option value='" + i + "'" + (point == i ? " selected='selected'" : "") + ">" + i + "</option>";
                        $(selector).append(option);
                    }
                    $('#discipline_points', row).html(selector);
                } else {
                    var textbox = $("<input type='text' />").attr('id', 'points_selector').val(point);
                    $('#discipline_points', row).html(textbox);
                    init_inputSelectors(row);
                    $('#points_selector', row).numeric();
                }
            } else {
                $.jGrowl(json_result.message);
            }
        });
    });

    $('#disciplineNotify').click(function () {
        var studentid = $('#studentid').val();
        dialogBox_open('/discipline/send/' + studentid, 'Discipline Notification' , 600);
        return false;
    });

    $('.jqdelete', '#disciplineTable').die().live('click', function () {
        var ok = window.confirm("Are you sure?");
        if (!ok) {
            return false;
        }

        var row = $(this).parents('tr');
        var dip = $(row).attr('alt');
        var userid = $('#studentid').val();

        $(this).post('/discipline/delete/' + dip, function (json_result) {
            if (json_result.success) {
                var div = $(row).parents("div[id^='discipline_']");
                $(div).load('/discipline/show/' + userid);
            }
            $.jGrowl(json_result.message);
        }, 'json');
        return false;
    });

    $('.jqedit', '#disciplineTable').die().live('click', function () {
        var row = $(this).closest('tr');
        var id = $(row).attr('alt');
        $(this).getx('/discipline/edit/' + id, function (result) {
            $(row).fadeOut('fast', function () {
                row.replaceWith($(result));
                discipline_initeditrow(row);
            });
        });
        return false;
    });

    $('#discipline_save').die().live('click', function () {
        var row = $(this).closest('tr');
        var dip = $(row).attr('alt');
        var type = $('#discipline_type', row).val();
        var reason = $('#discipline_reason', row).val();
        var points = $('#points_selector', row).val();
        var userid = $('#studentid').val();

        if (type == '') {
            $.jGrowl('A conduct type must be selected');
            return false;
        }

        if (points == '') {
            $.jGrowl('You must specify the number of points');
            return false;
        }

        $(this).post('/discipline/save/' + userid, { dip: dip, reason: reason, points: points, type: type }, function (json_result) {
            if (json_result.success) {
                var div = $(row).parents("div[id^='discipline_']");
                $(div).load('/discipline/show/' + userid);
            }
            $.jGrowl(json_result.message);
        }, 'json');
        return false;
    });

    $('#discipline_cancel').die().live('click', function () {
        var row = $(this).parents('tr');
        var id = $(row).attr('alt');
        if (id == '') {
            $(row).fadeOut('fast', function () {
                $(this).remove();
            });
            return false;
        }
        
        var div = $(row).parents("div[id^='discipline_']");
        var userid = $('#studentid').val();
        $(div).load('/discipline/show/' + userid);
        return false;
    });
</script>