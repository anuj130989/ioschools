﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
     Secondary - About
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="nav_side mt20">
        <ul>
            <li><a class="selected" href="/secondary">About</a></li>
            <li><a href="/schools/eca">Extracurricular Activities</a></li>
        </ul>
    </div>
    <div class="col_2 ml20 mt10">
        <div class="breadcrumb">
            <a href="/">Home</a> / <a href="/Schools">Schools</a> / <a href="/secondary/">Secondary</a>
            / About
        </div>
        <h1>
             Secondary</h1>
        <div class="img_border w700px">
            <div class="slider w700px" style="height: 300px;">
                <img src="/Content/img/schools/secondary/about2.jpg" alt="" />
                <img src="/Content/img/schools/secondary/about1.jpg" alt="" />
                <img src="/Content/img/schools/secondary/about3.jpg" alt="" />
            </div>
        </div>
        <p class="mt10">
             National Secondary School follows the Malaysian National Secondary School Curriculum.
            At the end of the third year, students sit for the PMR (Penilaian Menengah Rendah)
            and at the end of the fifth year , they sit for the SPM (Sijil Pelajaran Malaysia)
            examination. The subjects offered are:
        </p>
        <table class="ac w100p">
            <tr>
                <td class="bold">
                    PMR
                </td>
                <td class="bold">
                    SPM
                </td>
            </tr>
            <tr>
                <td>
                    Bahasa Malaysia
                </td>
                <td>
                    Bahasa Malaysia
                </td>
            </tr>
            <tr>
                <td>
                    English
                </td>
                <td>
                    English
                </td>
            </tr>
            <tr>
                <td>
                    Sejarah
                </td>
                <td>
                    Sejarah
                </td>
            </tr>
            <tr>
                <td>
                    Geografi
                </td>
                <td>
                    Geografi
                </td>
            </tr>
            <tr>
                <td>
                    Matematik
                </td>
                <td>
                    Matematik
                </td>
            </tr>
            <tr>
                <td>
                    Sains
                </td>
                <td>
                    Matematik Tambahan
                </td>
            </tr>
            <tr>
                <td>
                    Pendidikan Moral
                </td>
                <td>
                    Fizik
                </td>
            </tr>
            <tr>
                <td>
                    ICT/Lukisan
                </td>
                <td>
                    Kimia
                </td>
            </tr>
            <tr>
                <td>
                    Kemahiran Hidup
                </td>
                <td>
                    Biologi
                </td>
            </tr>
            <tr>
                <td>
                    Literature in English
                </td>
                <td>
                    Ekonomi Asas
                </td>
            </tr>
            <tr>
                <td>
                    Pendidikan Jasmani & Kesihatan
                </td>
                <td>
                    Pendidikan Jasmani & Kesihatan
                </td>
            </tr>
            <tr>
                <td>
                    Music</td>
                <td>
                    Perdagangan
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    ICT/Lukisan
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    English Literature</td>
            </tr>
        </table>
        <h3 class="mt20">
            School hours</h3>
            <a name="hours"></a>
        <p>
            <strong>Monday to Friday :</strong> 7.30 am to 3.50 pm</p>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.slider').nivoSlider({
                controlNav: false,
                directionNav: false,
                pauseTime: 5000,
                pauseOnHover: false
            });
        });
    </script>
</asp:Content>
