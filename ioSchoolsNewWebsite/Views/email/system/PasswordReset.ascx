<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.user.UserCredentials>" %>
<p>Please login with the following credentials at <a href="http://www.ioschools.edu.my/login">www.ioschools.edu.my/login</a>. Password is <strong>case-sensitive</strong>.</p>
<table>
<tbody>
<tr><td><strong>Email</strong></td><td><%= Model.email %></td></tr>
<tr><td><strong>Password</strong></td><td><%= Model.password %></td></tr>
</tbody>
</table>
<p>You will be prompted to change your password after signing into your account.</p>
<p>If you have problems login in, please contact .</p>
<p>
 School Information System
</p>
