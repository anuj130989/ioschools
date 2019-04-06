﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="selector_schoolyear" class="pt10 mb20 hidden">
    <div class="form_entry">
            <div class="form_label">
                <label>
                    School Years</label>
                    <div class="tip">Select affected school years. Click to select.</div>
            </div>
        </div>
<input id="selector_schoolyear_all" type="checkbox" /><label for="selector_schoolyear_all">select all</label>
<div id="selector_schoolyear_result">
</div>
<div class="clear"></div>
<script type="text/javascript">
    var schoolYearSelectorHandler = function () {
        var schoolyears = [];
        var context;

        var addAll = function () {
            clearAll();
            var blocks = $('.blockSelectable', context);
            $.each(blocks, function () {
                var id = $(this).attr('alt');
                add(id);
            });
        };

        var clearAll = function () {
            schoolyears = [];
        };

        var add = function (val) {
            if (schoolyears.indexOf(val) == -1 && val != null && val != "") {
                schoolyears.push(val);
            }
        };

        var remove = function (val) {
            var index = schoolyears.indexOf(val);

            if (index != -1) {
                schoolyears.splice(index, 1);
            }
        };

        var bindClicks = function () {
            $('.blockSelectable', context).bind('click', function () {
                var id = $(this).attr('alt');
                if (!$(this).hasClass('selected')) {
                    // add selected
                    $(this).animate({ backgroundColor: "#2C85D3", color: "#ffffff" }, 800).addClass('selected');
                    add(id);
                } else {
                    // remove selected
                    $(this).animate({ backgroundColor: "#ffffff", color: "#000000" }, 800).removeClass('selected');
                    remove(id);
                }
                return false;
            });

            $('#selector_schoolyear_all', context).click(function () {
                var checked = $(this).is(':checked');
                $('.blockSelectable', context).each(function () {
                    if (checked) {
                        $(this).css({ backgroundColor: "#2C85D3", color: "#ffffff" }).addClass('selected');
                        addAll();
                    } else {
                        $(this).css({ backgroundColor: "#ffffff", color: "#000000" }).removeClass('selected');
                        clearAll();
                    }
                });
            });
        };

        var initBlocks = function (schoolid) {
            $.post('/schools/years/' + schoolid, function (json_result) {
                if (json_result.success) {
                    $('#selector_schoolyear_result', context).html('');
                    for (var i = 0; i < json_result.data.length; i++) {
                        var entry = json_result.data[i];
                        var block = ["<div class='blockSelectable' alt='", entry.id, "'>", entry.name, "</div>"];
                        $('#selector_schoolyear_result', context).append(block.join(''));
                    }
                    $('#selector_schoolyear', context).show();
                    bindClicks();
                    for (var j = 0; j < schoolyears.length; j++) {
                        $('.blockSelectable[alt=' + schoolyears[j] + ']', context).trigger('click');
                    }
                }
                else {
                    $.jGrowl(json_result.message);
                }
            }, 'json');
        };

        return {
            init: function (schoolid, ctx) {
                context = ctx;
                initBlocks(schoolid);

            },
            get: function () {
                return schoolyears;
            },
            populate: function (idarray) {
                for (var i = 0; i < idarray.length; i++) {
                    // just add because blocks may not be ready yet
                    add(idarray[i]);
                }
            }
        };
    };
</script>
</div>
