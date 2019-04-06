<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage" MasterPageFile="~/Views/Shared/Main.Master" %>
<asp:Content runat="server" ID="Title" ContentPlaceHolderID="TitleContent">Extracurricular Activities</asp:Content>
<asp:Content runat="server" ID="ExtraHeader" ContentPlaceHolderID="ExtraHeader">
    <style type="text/css">
        .style1 {
            background-color: #F7F7F7;
        }
        .style2 {
            text-align: center;
        }
        .style3 {
            font-weight: bold;
            text-align: center;
        }
        .style4 {
            text-align: center;
            background-color: #F7F7F7;
        }
    </style>
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
<div class="nav_side mt20">
        <ul>
            <li><a href="/international">About</a></li>
            <li><a class="selected" href="/international/eca">Extracurricular Activities</a></li>
        </ul>
    </div>
    <div class="col_2 ml20 mt10">
    <div class="breadcrumb">
<a href="/">Home</a> / <a href="/Schools">Schools</a> / <a href="/international/">International</a> / Extracurricular Activities
</div>
<h1>
Extracurricular Activities</h1>
<table class="semester">
<thead>
<tr><td>Day</td><td>Activities</td><td>Class</td><td>Time</td><td>Venue</td><td>Teachers-in-Charge</td></tr>
</thead>
<tbody>
<tr><td class="style1" rowspan="7">Monday</td><td class="style1">Teakwondo</td>
    <td class="style1">Years 2 - 13</td><td class="style1">3.30-5.00 pm</td>
    <td class="style1">Hall</td><td class="style1">Chong Siew Ling</td></tr>
<tr><td class="style1">Computer Club</td><td class="style1">Years 4 - 6</td>
    <td class="style1">3.30-5.00 pm</td><td class="style1">Computer Lab (P212)</td>
    <td class="style1">Irene Yeo</td></tr>
<tr><td class="style1">Choir</td><td class="style1">Years 2 - 6</td>
    <td class="style1">3.30-5.00 pm</td><td class="style1">P105</td>
    <td class="style1">Carol Jong / Puk Mui Lee</td></tr>
<tr><td class="style1">Basketball (Boys)</td><td class="style1">Years 7 - 13</td>
    <td class="style1">3.30-5.00 pm</td><td class="style1">Court</td>
    <td class="style1">John Law</td></tr>
<tr><td class="style1">Indonesian Club </td><td class="style1">Years 7 - 13</td>
    <td class="style1">3.30-5.00 pm</td><td class="style1">P209</td>
    <td class="style1">Matthew Wee</td></tr>
<tr><td class="style1">International Award </td><td class="style1">Years 9 - 13</td>
    <td class="style1">3.30-5.00 pm</td><td class="style1">Library (P205)</td>
    <td class="style1">Teresa Attley</td></tr>
<tr><td class="style1">Prefects</td><td class="style1">Nominated</td>
    <td class="style1">3.30-5.00 pm</td><td class="style1">P202</td>
    <td class="style1">Sim Siok Yian</td></tr>
<tr><td rowspan="6">Tuesday</td><td>Badminton</td><td>Years 2 - 6</td><td>3.30-5.00 
    pm</td><td>Hall</td><td>Mohamad Masebak</td></tr>
<tr><td>Table Tennis</td><td>Years 2 - 6</td><td>3.30-5.00 pm</td><td>Foyer</td><td>
    Song Ewe Loong</td></tr>
<tr><td>Scouts</td><td>Years 2 - 6</td><td>3.30-5.00 pm</td><td>P202</td><td>William 
    Chew</td></tr>
<tr><td>Football</td><td>Years 7 - 13</td><td>3.30-5.00 pm</td><td>Field</td><td>
    Azyzy Ahmad</td></tr>
<tr><td>Yoga</td><td>Years 7 - 13</td><td>3.30-5.00 pm</td><td>P115</td><td>Soon Bee 
    Ching</td></tr>
<tr><td>Gavel Club</td><td>Years 7 - 13</td><td>3.30-5.00 pm</td><td>P209</td><td>
    Fiona de Rozario / Teresa Attley</td></tr>
<tr><td class="style1" rowspan="6">Wednesday</td><td class="style1">Football</td>
    <td class="style1">Years 2 - 6</td><td class="style1">3.30-5.00 pm</td>
    <td class="style1">Field</td><td class="style1">Azyzy Ahmad </td></tr>
<tr><td class="style1">Dance</td><td class="style1">Years 2 - 6</td>
    <td class="style1">3.30-5.00 pm</td><td class="style1">P115</td>
    <td class="style1">Diane Tan</td></tr>
<tr><td class="style1">Bowling</td><td class="style1">Years 7 - 13</td>
    <td class="style1">4.30-6.00 pm</td><td class="style1">Crystal Bowling Club</td>
    <td class="style1">Ng Pei Fen</td></tr>
<tr><td class="style1">Basketball (Girls)</td><td class="style1">Years 7 - 13</td>
    <td class="style1">3.30-5.00 pm</td><td class="style1">Court</td>
    <td class="style1">Faith Liew</td></tr>
<tr><td class="style1">Red Cresent</td><td class="style1">Years 7 - 13</td>
    <td class="style1">3.30-5.00 pm</td><td class="style1">P214 / P219</td>
    <td class="style1">Lynette Lee / Juliana Teo</td></tr>
<tr><td class="style1">Debate</td><td class="style1">Years 7 - 13</td>
    <td class="style1">3.30-5.00 pm</td><td class="style1">P209</td>
    <td class="style1">Tom McLaughlin</td></tr>
<tr><td rowspan="6">Thursday</td><td>Chess</td><td>Years 2 - 6</td><td>3.30-5.00 pm</td><td>
    P209</td><td>Jason Wong / Lynette Lee</td></tr>
<tr><td>Football</td><td>Years 2 - 6</td><td>3.30-5.00 pm</td><td>Field</td><td>
    Azyzy Ahmad</td></tr>
<tr><td>Korean Club</td><td>Years 7 - 13</td><td>3.30-5.00 pm</td><td>P209</td><td>
    Kim Seon Yi </td></tr>
<tr><td>Badminton</td><td>Years 7 - 13</td><td>3.30-5.00 pm</td><td>Hall</td><td>
    Mary Tan</td></tr>
<tr><td>Table Tennis</td><td>Years 7 - 13</td><td>3.30-5.00 pm</td><td>Foyer</td><td>
    Chung Miaw Ling </td></tr>
<tr><td>Interact</td><td>Years 7 - 13</td><td>3.30-5.00 pm</td><td>P204</td><td>
    Frances Tan</td></tr>
<tr><td class="style1" rowspan="4">Friday</td><td class="style1">Swimming</td>
    <td class="style1">Years 3 - 9</td><td class="style1">3.30-5.00 pm</td>
    <td class="style1">Bus to pool</td><td class="style1">Ling Ting Kuon / Chin Chai 
    Ling</td></tr>
<tr><td class="style1">Athletics</td><td class="style1">Years 2 - 13</td>
    <td class="style1">3.30-5.00 pm</td><td class="style1">Field</td>
    <td class="style1">Jerry Chia / Azyzy Ahmad</td></tr>
<tr><td class="style1">Science Club</td><td class="style1">Years 7 - 13</td>
    <td class="style1">3.30-5.00 pm</td><td class="style1">P204</td>
    <td class="style1">Jonathan Lee </td></tr>
<tr><td class="style1">Magazine / Newsletter </td><td class="style1">Years 7 - 13</td>
    <td class="style1">3.30-5.00 pm</td><td class="style1">Library (P205)</td>
    <td class="style1">Peter de Run / Viviana Liu / M M Ann Armstrong </td></tr>
<tr><td>Saturday</td><td>Teakwondo</td><td>Years 2 - 13</td><td>8.00-10.30 am</td><td>
    National School</td><td>Instructor</td></tr>

</tbody>
</table>
<h3>Solat Jumaat Activities</h3>
<table class="semester">
<thead>
<tr><td colspan="6">Lower Primary (Years 2, 3, 4) 11.50am - 1.20pm</td></tr>
<tr><td>Activity</td><td colspan="3" class="ac">Rotation Dates</td><td>Room</td><td>
    Teachers-in-charge</td></tr>
</thead>
<tbody>
<tr><td></td><td class="style3">4 January</td><td class="style3">15 April</td>
    <td class="style3">15 August</td><td></td><td></td></tr>
<tr><td class="style1">Board Games</td><td class="style4">Year 2</td>
    <td class="style4">Year 3</td><td class="style4">Year 4</td><td class="style1">Class room</td>
    <td class="style1">
    Lucy Lee (with Class TAs)</td></tr>
<tr><td>Book Time</td><td class="style2">Year 4</td><td class="style2">Year 2</td>
    <td class="style2">Year 3</td><td>Class room</td><td>
    Grace Tiong (with Class TAs)</td></tr>
<tr><td class="style1">Art &amp; Craft</td><td class="style4">Year 3</td>
    <td class="style4">Year 4</td><td class="style4">Year 2</td><td class="style1">P202</td>
    <td class="style1">
    Irene Chiam (with Class TAs)</td></tr>
</tbody>

</table>

<table class="semester">
<thead>
<tr><td colspan="7">Upper Primary (Years 5 &amp; 6) 11.50am - 1.20pm</td></tr>
<tr><td>Activity</td><td colspan="4" class="ac">Rotation Dates</td><td>Room</td><td>
    Teachers-in-charge</td></tr>
</thead>
<tbody>
<tr><td></td><td class="style3" colspan="2">4 January</td><td class="style3" 
        colspan="2">13 June</td><td></td><td></td></tr>
<tr><td class="style1">Book Time</td><td class="style4" colspan="2">Year 5</td>
    <td class="style4" colspan="2">Year 6</td><td class="style1">Library (P205)</td>
    <td class="style1">
        Florence Chew</td></tr>
<tr><td rowspan="2">Cookery</td><td class="style2">Year 6A</td><td class="style2">
    Year 6B</td><td class="style2">Year 5A</td><td class="style2">Year 5B</td>
    <td rowspan="2">P218</td><td rowspan="2">
    Caressa Bong / Leong Siew Fweng</td></tr>
<tr><td class="style2">4 Jan -
    <br />
    11 Mar</td><td class="style2">21 Mar -
        <br />
        28 May</td><td class="style2">13 Jun -<br />
        26 Aug</td><td class="style2">5 Sep -<br />
        18 Nov</td></tr>
<tr><td class="style1" rowspan="2">Sewing&nbsp; &amp; Craft</td><td class="style4">
    Year 6B</td><td class="style4">Year 6A</td><td class="style4">Year 5B</td>
    <td class="style4">Year 5A</td><td class="style1" rowspan="2">P112</td>
    <td class="style1" rowspan="2">
        Liew Siaw Sia</td></tr>
<tr><td class="style4">4 Jan -
    <br />
    11 Mar</td><td class="style4">21 Mar -
        <br />
        28 May</td><td class="style4">13 Jun -<br />
        26 Aug</td><td class="style4">5 Sep -<br />
        18 Nov</td></tr>
<tr><td colspan="5">Primary ICF (Years 4, 5, 6) </td><td>
    P217</td><td>
        Grace Chew</td></tr>
<tr><td class="style1" colspan="5">Korean Church (Years 4 - 10)</td><td class="style1">P209</td><td class="style1">
    Pastor / Gina Kim Seon Yi</td></tr>
<tr><td colspan="5">Agama / Islamic Studies (Years 4 - 10) </td><td>P217</td><td>
    Najwa bt Ahmad Tarmizi</td></tr>
</tbody>

</table>

<table class="semester">
<thead>
<tr><td colspan="3">Secondary (Years 7, 8, 9, 10) 12.20 - 1.50pm </td></tr>
<tr><td>Activity</td><td>Room</td><td>Teachers-in-charge</td></tr>
</thead>
<tbody>
<tr><td class="style1">Homework Club</td><td class="style1">P105</td>
    <td class="style1">Sharon Goh</td></tr>
<tr><td>Chess</td><td>S406</td><td>Helena Chai</td></tr>
<tr><td class="style1">Badminton</td><td class="style1">Hall</td><td class="style1">
    Louise Yong</td></tr>
<tr><td>Dramatic Arts</td><td>P214 &amp; P219</td><td>Connie Ying</td></tr>
<tr><td class="style1">Modern Dance</td><td class="style1">P115</td>
    <td class="style1">Esther Chia</td></tr>
<tr><td>Computer Club</td><td>P211</td><td>Ellaine Yong</td></tr>
<tr><td class="style1">Maths Club</td><td class="style1">S302</td>
    <td class="style1">Tang Siu Kiong</td></tr>
<tr><td>Secondary ICF</td><td>S405</td><td>Kung Leh Chin</td></tr>
<tr><td class="style1">Korean Church</td><td class="style1">P209</td>
    <td class="style1">Pastor / Kim Seon Yi</td></tr>
<tr><td>Agama / Islamic Studies</td><td>S304</td><td>Najwa bt Ahmad Tarmizi</td></tr>
<tr><td class="style1">Supervising</td><td class="style1">During Solat Jumaat</td>
    <td class="style1">Jason Wong</td></tr>
</tbody>
</table>

</div>
</asp:Content>
