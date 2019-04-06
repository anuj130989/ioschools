<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.IdName>" %>
<div id="variantsDialog">
    <div id="search_area">
    <span class="search"></span>
                    <input type="text" id="searchbox" name="searchbox" />
    </div>
    <div class="clear mt20"></div>
<div class="fixedHeight scroll_y">
    <%
        Html.RenderAction("StaffSelectContent",new { term = Model.name, sinceid = Model.id });%>
</div>
<div class="clear">
</div>
<div id="buttons" class="mt10">
<button type="button" onclick="dialogBox_close();">cancel</button>
</div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        // init height
        var height = $(window).height();
        var buttonHeight = $('#buttons', '#variantsDialog').height();
        var fixedHeight = height - buttonHeight - 210; // dialog padding
        $('.fixedHeight', '#variantsDialog').height(fixedHeight);
    });

    var searchtimer;
    var searchterm = "";
    // login name availability check
    $('#searchbox').keyup(function () {
        searchterm = $('#searchbox').val();

        if (searchtimer !== undefined) {
            clearTimeout(searchtimer);
        }
        searchtimer = setTimeout(function () {
            $.post("/users/staffselectcontent", { term: searchterm }, function (result) {
                $('.fixedHeight', '#variantsDialog').html(result);
            });
        }, 500);
    }).bind('focus', function () {
        $(this).siblings().addClass('searchfocused');
    }).bind('blur', function () {
        $(this).siblings().removeClass('searchfocused');
    });

    $('.fixedHeight', '#variantsDialog').scroll(function () {
        var elem = $(this);
        if (elem[0].scrollHeight - elem.scrollTop() != elem.outerHeight()) {
            // We're not at bottom
            return false;
        }
        $(this).showLoadingBlock();

        // get highest productid
        var maxid = $('.blockSelectable:last', '#variantsDialog').attr('alt');
        $.post('/users/staffselectcontent', { term: searchterm, sinceid: maxid }, function (result) {
            $(elem).removeLoading();
            $('.fixedHeight', '#variantsDialog').append(result);
            return false;
        });
    });

    $('.blockSelectable', '#variantsDialog').die().live('click', function () {
        var id = $(this).attr('alt');
        if ($('#enrolment_notifiers').length != 0) {
            $(this).post('/enrolment/addnotifier/' + id, null, function (result) {
                $('#enrolment_notifiers').append(result);
                $.jGrowl('User added successfully');
                dialogBox_close();
            });
        }
    });
</script>