<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage" MasterPageFile="~/Views/Shared/Internal.Master" %>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="TitleContent">Help</asp:Content>
<asp:Content runat="server" ID="ExtraHeader" ContentPlaceHolderID="ExtraHeader">
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
<h2>
    Help / Frequently Asked Questions</h2>
    <p>If you are unable to find an answer to you question, please send an email to <a href="mailto:seanlinmt@clearpixels.co.nz">seanlinmt@clearpixels.co.nz</a>.</p>
<div id="help_content">
    <h3>
        Circular / Newsletters</h3>
    <ol class="ml20">
        <li><a href="">Can I use content from Microsoft Word documents (and possibly other document
            types) when creating a new circular/newsletter?</a>
            <div id="usingothercontents" class="hidden">
                <p>
                    Yes, you can but hopefully in the future you will directly using the web interface.
                    Otherwise, you will need to follow the steps below:</p>
                <p>
                    Generally, you can just copy and paste from other documents directly into the web
                    interface. However, your content will probably not appear as you want it to look.</p>
                <ol>
                    <li>After pasting your content into the web interface, select the content you have just
                        pasted by either highlighting the content or by pressing Ctrl + A. </li>
                    <li>Then click on the <span class="font_red bold">X</span> on the top right corner of
                        the web interface. This removes any hidden formatting from the content you just
                        pasted.</li>
                    <li>Then you just need to format the content accordingly using the buttons provided,
                        i.e., make sure content is paragraphed properly with the necessary headings</li>
                </ol>
                <p>
                    <strong>Note:</strong> You cannot copy and paste photos or files into the web interface.
                    Use the "Upload File" button to do this.</p>
            </div>
        </li>
    </ol>
    <h3 class="mt10">
        Website Maintenance</h3>
    <ol class="ml20">
        <li><a href="">How do I update website photos and do general modifications?</a>
            <div id="website_update" class="hidden">
                <p>
                    Website content can be normally updated by modifying html, css and updating image
                    files. However, the following should be maintained</p>
                <ol class="mb10">
                    <li>Ensure that id and class attributes are not changed if html tags are modified.</li>
                    <li>Ensure that file names are not renamed.</li>
                    <li>Ensure that files are not moved to different locations.</li>
                </ol>
                <strong>HTML files</strong>
                <p>
                    HTML files that can be modified are located at /Views. �/Views/Shared/Main.Master�
                    is the master page, ie. the template that holds other pages. This can be modified
                    as well.</p>
                <strong>CSS</strong>
                <p>
                    The main CSS file is located at /Content/css/Site.css and /Content/css/common.css.</p>
                <strong>Photos</strong>
                <p>
                    Photos will normally be located at /Content/img. And will be located in various
                    subdirectories. The html tags will point you to the right location.</p>
                <strong>Changing photos in slider/animation</strong>
                <p>
                    To change the photos in the slider, all you need to do is to update the individual
                    images.
                </p>
                <p>
                    There are 2 types of photo sliders</p>
                <ol class="mb10">
                    <li>Slider with thumbnails (eg. the website�s frontpage)</li>
                    <li>Slide without thumbnail (all other sliders on other pages)</li>
                </ol>
                <p>
                    For the slider with thumbnails, a fullsize photo will need to be created along with
                    a thumbnail. These files are called slider1.jpg to slider12.jpg and thumbnails will
                    be slider1_thumb.jpg to slider12_thumb.jpg.</p>
                <ul class="mb10">
                    <li>Fullsize dimensions: 635 x 335</li>
                    <li>Thumbnail dimensions: 110 x 80</li>
                </ul>
                <p>
                    For all other sliders, look at the corresponding page and just replaced the photos
                    in the corresponding image location. Ensure that the dimensions of the files are
                    the same. The dimensions of the images can be viewed under windows or from most
                    image editors.</p>
                <strong>Example</strong>
                <p>
                    For example, we wish to modify the photos in the slider on page �/about�. The html
                    file corresponding to this would be located at �/Views/about/Index.aspx�. Looking
                    at this file, the images in the slider is shown by the following:</p>
                <table>
                    <tr>
                        <td>
                            &lt;div class="slider w700px" style="height: 200px;"&gt;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &lt;img src="/Content/img/about/about1.jpg" alt="" /&gt;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &lt;img src="/Content/img/about/about2.jpg" alt="" /&gt;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &lt;img src="/Content/img/about/about3.jpg" alt="" /&gt;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &lt;img src="/Content/img/about/about4.jpg" alt="" /&gt;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &lt;/div&gt;
                        </td>
                    </tr>
                </table>
                <p>
                    Therefore, you will need to go to �/Content/img/about/� and replace the photos about1.jpg
                    to about4.jpg.</p>
            </div>
        </li>
        <li><a href="">How do I update the calendar file that drives the event entries?</a>
            <div id="website_calendar" class="hidden">
                <p>
                    The school calendar shown at �/calendar� is generated from excel file location at
                    �/Content/media/calendar.xls. This file MUST be in Excel 97-2003 format. To update
                    the calendar just replace this file with a new file containing data in the format
                    shown below. Looking at the contents of this file will give you an idea on how to
                    format the file correctly. The data in this excel file will automatically generate
                    data for the yearly calendar and upcoming events.</p>
                <p>
                    The format for each excel row is as follows</p>
                <table class="table_grid mb10">
                    <tr>
                        <td>
                            Year
                        </td>
                        <td>
                            Month
                        </td>
                        <td>
                            Day
                        </td>
                        <td>
                            Day name
                        </td>
                        <td>
                            Event
                        </td>
                        <td>
                            True/false is a public holiday
                        </td>
                    </tr>
                </table>
                <p>
                    <strong>Limitation:</strong> Months must start from January of the curent year until
                    January of the following year</p>
            </div>
        </li>
    </ol>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('li > a', '#help_content').click(function () {
            $(this).next().toggle();
            return false;
        });

        var hash = window.location.hash;
        if (hash != '') {
            $(hash).show();
        }
    });
</script>
</asp:Content>