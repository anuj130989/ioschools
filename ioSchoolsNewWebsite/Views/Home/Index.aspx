<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<ioschoolsWebsite.Models.blog.BlogSummaryViewData>" %>
<%@ Import Namespace="ioschoolsWebsite.Library" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
     Group of Schools
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="slider_main" class="slider mt5">
        <img src="/Content/img/landingpage/slider7.jpg" alt="" title="#slider7caption" />
        <img src="/Content/img/landingpage/slider4.jpg" alt="" title='#slider4caption' />
        <img src="/Content/img/landingpage/slider2.jpg" alt="" title="#slider2caption" />
        <img src="/Content/img/landingpage/slider3.jpg" alt="" title="#slider3caption" />
        <img src="/Content/img/landingpage/slider9.jpg" alt="" title="#slider9caption" />
        <img src="/Content/img/landingpage/slider6.jpg" alt="" title="#slider6caption" />
        <img src="/Content/img/landingpage/slider5.jpg" alt="" title="#slider5caption" />
        <img src="/Content/img/landingpage/slider8.jpg" alt="" title="#slider8caption" />
        <img src="/Content/img/landingpage/slider1.jpg" alt="" title="#slider1caption" />
        <img src="/Content/img/landingpage/slider10.jpg" alt="" title="#slider10caption" />
        <img src="/Content/img/landingpage/slider11.jpg" alt="" title="#slider11caption" />
        <img src="/Content/img/landingpage/slider12.jpg" alt="" title="#slider12caption" />
    </div>
    <div id="slider1caption" class="nivo-html-caption">
    </div>
    <div id="slider2caption" class="nivo-html-caption">
    </div>
    <div id="slider3caption" class="nivo-html-caption">
    </div>
    <div id="slider4caption" class="nivo-html-caption">
    </div>
    <div id="slider5caption" class="nivo-html-caption">
    </div>
    <div id="slider6caption" class="nivo-html-caption">
    </div>
    <div id="slider7caption" class="nivo-html-caption">
    </div>
    <div id="slider8caption" class="nivo-html-caption">
    </div>
    <div id="slider9caption" class="nivo-html-caption">
    </div>
    <div id="slider10caption" class="nivo-html-caption">
    </div>
    <div id="slider11caption" class="nivo-html-caption">
    </div>
    <div id="slider12caption" class="nivo-html-caption">
    </div>
    <div id="news" class="col_1">
        <h2 class="bb mb10 bold">
            Director's message</h2>
    </div>
    <div id="events" class="col_1">
    <div>
    <h2 class="bb mb10 bold">
                News</h2>
            <% foreach (var entry in Model.newspanel.news)
               {%>
<div class="item">
    <div class="title">
        <a href="/news/<%= entry.id %>/<%= entry.title.ToSafeUrl() %>">
            <%= entry.title %></a></div>
    <div class="date">
        <%= entry.date %></div>
    <div class="content">
        <%= entry.content %><a class="ml5 smaller" href="/news/<%= entry.id %>/<%= entry.title.ToSafeUrl() %>">more »</a>
    </div>
</div>
<%} %>
<a class="mt10" href="/news">view all</a>
</div>
<div class="mt40">
        <%
            Html.RenderPartial("~/Views/events/Index.ascx", Model.events);%>
            </div>
    </div>
    <div class="col_1 w300px fr">
    <ul>
            <li class="link_admission"><a href="/admission">Admission</a></li>
            <li class="link_calendar"><a href="/calendar">School Calendar</a></li>
        </ul>
        <div class="img_border" style="height: 280px; width: 280px;">
            <div id="slider_side" class="slider" style="height: 280px; width: 280px;">
                <img src="/Content/img/landingpage/gallery4.jpg" alt="" />
                <img src="/Content/img/landingpage/gallery1.jpg" alt="" />
                <img src="/Content/img/landingpage/gallery10.jpg" alt="" />
                <img src="/Content/img/landingpage/gallery3.jpg" alt="" />
                <img src="/Content/img/landingpage/gallery5.jpg" alt="" />
                <img src="/Content/img/landingpage/gallery6.jpg" alt="" />
                <img src="/Content/img/landingpage/gallery7.jpg" alt="" />
                <img src="/Content/img/landingpage/gallery8.jpg" alt="" />
                <img src="/Content/img/landingpage/gallery9.jpg" alt="" />
                <img src="/Content/img/landingpage/gallery2.jpg" alt="" />
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#kindergarten').die().live('click', function () {
            window.location = '/kindergarten';
        });
        $('#primary').die().live('click', function () {
            window.location = '/primary';
        });
        $('#secondary').die().live('click', function () {
            window.location = '/secondary';
        });
        $('#international').die().live('click', function () {
            window.location = '/international';
        });
        $(document).ready(function () {
            $('#slider_main').nivoSlider({
                controlNavThumbs: true,
                pauseTime: 10000
            });

            $('#slider_side').nivoSlider({
                controlNav: false,
                directionNav: true,
                pauseTime: 5000,
                pauseOnHover: false,
                manualAdvance: true
            });
        });
    </script>
</asp:Content>
