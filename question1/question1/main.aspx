<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="question1.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
            <tr>
            <th colspan="2">Registration Form</th>
                </tr>
            <tr>
            <td>
                <asp:Label ID="lblusername" runat="server" Text="Username"></asp:Label></td>
            <td>
                <asp:TextBox ID="txt_username" runat="server"></asp:TextBox>
            </td>
                <td>
                    <asp:RequiredFieldValidator ID="r1" runat="server" ErrorMessage="Enter Username"
                         ControlToValidate="txt_username" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                </tr>
            <tr>
                <td>
                    <asp:Label ID="lblpassword" runat="server" Text="Password"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txt_password" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="r2" runat="server" ErrorMessage="Enter Password" 
                        ControlToValidate="txt_password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblcnfrmpassword" runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td> 
                    <asp:TextBox ID="txt_confirmpassword" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="r3" runat="server" ErrorMessage="ReEnter Password" 
                        ControlToValidate="txt_confirmpassword" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:CompareValidator ID="comparepassword" runat="server" ErrorMessage="Password Mismatch"
                        ControlToValidate="txt_password" ControlToCompare="txt_confirmpassword" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblfirstname" runat="server" Text="FirstName"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_firstname" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="r4" runat="server" Text="Enter FirstName" 
                        ControlToValidate="txt_firstname" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbllastname" runat="server" Text="LastName"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_lastname" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="r5" runat="server" ErrorMessage="Enter LastName" 
                        ControlToValidate="txt_lastname" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblemail" runat="server" Text="Email"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="r6" runat="server" ErrorMessage="Enter Email"
                        ControlToValidate ="txt_email" ForeColor ="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="r7" runat="server" 
                  ValidationExpression ="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                   ControlToValidate="txt_email" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
             <tr>
                 <td>
                     <asp:Label ID="lblphoneno" runat="server" Text="Phone No"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txt_phoneno" runat="server"></asp:TextBox>
                 </td>
                 <td>
                     <asp:RequiredFieldValidator ID="reqfldphone" runat="server" ErrorMessage="Enter Phone Number" 
                         ControlToValidate="txt_phoneno" ForeColor="Red"></asp:RequiredFieldValidator></td>

                     <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txt_phoneno" ErrorMessage="Enter 10 digit mobile number" 
                            ValidationExpression ="[0-9]{10}" ForeColor="Red"></asp:RegularExpressionValidator>
                 </td>
             </tr>
            <tr>
                <td>
                    <asp:Label ID="ibllocation" runat="server" Text="Location"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_location" runat ="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqfldloc" runat="server" ErrorMessage="Enter Location"
                      ControlToValidate ="txt_location" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click"/></td>
                    <td><asp:Button ID="btnreset" runat="server" Text="Reset" OnClick="btnreset_Click"/></td>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                </td>
                    </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="Id" OnRowCommand="GridView1_RowCommand" 
                       BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" >
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" />
                            <asp:BoundField DataField="Firstname" HeaderText="First Name" />
                            <asp:BoundField DataField="Lastname" HeaderText="Last Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="Location" HeaderText="Location" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                 <asp:LinkButton ID="btndelete" runat="server" Text="Delete" CausesValidation="false" 
                                     CommandArgument="<%#((GridViewRow)Container).RowIndex %>"></asp:LinkButton>  
                                    <asp:LinkButton ID="btnupdate" runat="server" Text="Update" CausesValidation="false"
                                        CommandArgument="<%#((GridViewRow)Container).RowIndex %>"></asp:LinkButton>
                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </div>
    </form>
</body>
</html>