﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="selector_class" class="pt10 mb20 hidden">
    <div class="form_entry">
            <div class="form_label">
                <label>
                    Classes</label>
                    <div class="tip">Select classes involved. Click to select.</div>
            </div>
        </div>
<input id="selector_class_all" type="checkbox" /><label for="selector_class_all">select all</label>
<div id="selector_class_result">
</div>
<div class="clear"></div>
<script type="text/javascript">
    var selector_classes = [];

    function addAllSelectedClass() {
        clearAllSelectedClass();
        var blocks = $('.blockSelectable', '#selector_class_result');
        $.each(blocks, function () {
            var id = $(this).attr('alt');
            selector_classes.push(id);
        });
    }

    function clearAllSelectedClass() {
        selector_classes = [];
    }

    function addSelectedClass(val) {
        var exist = false;
        var i = 0;
        while (i < selector_classes.length && !exist) {
            if (selector_classes[i] == val) {
                exist = true;
            }
            i++;
        }

        if (!exist) {
            selector_classes.push(val);
        }
    }

    function removeSelectedClass(val) {
        var index = -1;
        var exist = false;
        var i = 0;
        while (i < selector_classes.length && !exist) {
            if (selector_classes[i] == val) {
                index = i;
                exist = true;
            }
            i++;
        }

        if (index != -1) {
            selector_classes.splice(index, 1);
        }
    }
    
    function selector_class_populate(id) {
        $.get('/schools/classes/' + id, function (json_result) {
            if (json_result.success) {
                $('#selector_class_result').html('');
                $.each(json_result.data, function () {
                    var block = ["<div class='blockSelectable' alt='", this.id, "'>", this.name, "</div>"];
                    $('#selector_class_result').append(block.join(''));
                });
                $('#selector_class').show();
            }
            else {
                $.jGrowl(json_result.message);
            }
        }, 'json');
    }

    $('.blockSelectable', '#selector_class_result').die().live('click', function () {
        var id = $(this).attr('alt');
        if (!$(this).hasClass('selected')) {
            // add selected
            $(this).animate({ backgroundColor: "#2C85D3", color: "#ffffff" }, 800).addClass('selected');
            addSelectedClass(id);
        }
        else {
            // remove selected
            $(this).animate({ backgroundColor: "#ffffff", color: "#000000" }, 800).removeClass('selected');
            removeSelectedClass(id);
        }
        return false;
    });

    $('#selector_class_all').click(function () {
        var checked = $(this).is(':checked');
        $('.blockSelectable', '#selector_class_result').each(function () {
            if (checked) {
                $(this).css({ backgroundColor: "#2C85D3", color: "#ffffff" }).addClass('selected');
                addAllSelectedClass();
            }
            else {
                $(this).css({ backgroundColor: "#ffffff", color: "#000000" }).removeClass('selected');
                clearAllSelectedClass();
            }
        });
    });
</script>
</div>