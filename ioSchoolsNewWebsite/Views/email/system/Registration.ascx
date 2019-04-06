<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ioschoolsWebsite.Models.email.EmailRegistrationViewModel>" %>
<p>Dear <%= Model.applicantName %>,</p>
<p>Your online registration has been received and is being processed. 
To view the status of your registration, you can sign in using the following credentials: </p>
<table>
<tr><td style="width:100px;">Email</td><td><%= Model.email  %></td></tr>
<tr><td>Password</td><td><%= Model.password  %></td></tr>
</table>
<p>You can change your password after signing into your account.</p>
<p>
 School Information System
</p>
