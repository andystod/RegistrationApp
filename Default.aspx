<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RegistrationApp.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron vertical-center">
        <asp:FormView ID="registrationFormView" runat="server" DefaultMode="Insert"
            ItemType="RegistrationApp.RegistrationInsert_Result" RenderOuterTable="false"
            InsertMethod="RegistrationInsert">
            <InsertItemTemplate>
                <div class="container form-horizontal">

                    <div class="form-group">
                        <p class="col-sm-4 form-control-static control-label">
                            <asp:Label runat="server" AssociatedControlID="UsernameTextBox" Text="User Name" />
                        </p>
                        <div class="col-sm-4 ">
                            <asp:TextBox ID="UsernameTextBox" runat="server" class="form-control" MaxLength="20" Text='<%# BindItem.Username %>' />
                        </div>
                        <p class="col-sm-4 form-control-static error text-danger">
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UsernameTextBox" ValidationGroup="MainValidationGroup"
                                Text="* Required" Display="Dynamic"></asp:RequiredFieldValidator>
                        </p>
                    </div>
                    <div class="form-group">
                        <p class="col-sm-4 form-control-static control-label">
                            <asp:Label runat="server" AssociatedControlID="FirstNameTextBox" Text="First Name" />
                        </p>
                        <div class="col-sm-4">
                            <asp:TextBox ID="FirstNameTextbox" runat="server" class="form-control" MaxLength="50" 
                                ValidationGroup="MainValidationGroup" Text='<%# BindItem.Name %>' />
                        </div>
                        <p class="col-sm-4 form-control-static error text-danger">
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstNameTextbox" ValidationGroup="MainValidationGroup"
                                Text="* Required" Display="Dynamic"></asp:RequiredFieldValidator>
                        </p>
                    </div>
                    <div class="form-group">
                        <p class="col-sm-4 form-control-static control-label">
                            <asp:Label runat="server" AssociatedControlID="LastNameTextBox" Text="Last Name" />
                        </p>
                        <div class="col-sm-4">
                            <asp:TextBox ID="LastNameTextbox" runat="server" class="form-control" MaxLength="50" />
                        </div>
                        <p class="col-sm-4 form-control-static error text-danger">
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="LastNameTextbox" ValidationGroup="MainValidationGroup"
                                Text="* Required" Display="Dynamic"></asp:RequiredFieldValidator>
                        </p>
                    </div>
                    <div class="form-group">
                        <p class="col-sm-4 form-control-static control-label">
                            <asp:Label runat="server" AssociatedControlID="EmailTextBox" Text="Email" />
                        </p>
                        <div class="col-sm-4">
                            <asp:TextBox ID="EmailTextBox" runat="server" class="form-control" MaxLength="254" Text='<%# BindItem.Email %>' />
                        </div>
                        <p class="col-sm-4 form-control-static error text-danger">
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="EmailTextBox" ValidationGroup="MainValidationGroup"
                                Text="* Required" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ValidationGroup="MainValidationGroup"
                                Text="* Invalid Email" ControlToValidate="EmailTextBox" Display="Dynamic"
                                ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>

                        </p>
                    </div>
                    <div class="form-group">
                        <p class="col-sm-4 form-control-static control-label">
                            <asp:Label runat="server" AssociatedControlID="ConfirmEmailTextBox" Text="Confirm Email" />
                        </p>
                        <div class="col-sm-4 ">
                            <asp:TextBox ID="ConfirmEmailTextBox" runat="server" class="form-control" MaxLength="254" />
                        </div>
                        <p class="col-sm-4 form-control-static error text-danger">
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmEmailTextBox" ValidationGroup="MainValidationGroup"
                                Text="* Required" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="abc" runat="server" Text="* Does not match" ValidationGroup="MainValidationGroup"
                                ControlToValidate="ConfirmEmailTextBox" ControlToCompare="EmailTextBox" Display="Dynamic"></asp:CompareValidator>
                        </p>
                    </div>
                    <div class="form-group">
                        <p class="col-sm-4 form-control-static control-label">
                            <asp:Label runat="server" AssociatedControlID="DateOfBirthTextBox" Text="Date Of Birth" />
                        </p>
                        <div class="col-sm-4 ">
                            <asp:TextBox ID="DateOfBirthTextBox" runat="server" class="form-control" type="date" MaxLength="10" Text='<%# BindItem.DateOfBirth %>' />
                        </div>
                        <p class="col-sm-4 form-control-static error text-danger">
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="DateOfBirthTextBox" ValidationGroup="MainValidationGroup"
                                Text="* Required" Display="Dynamic"></asp:RequiredFieldValidator>
                        </p>
                    </div>
                    <div class="form-group">
                        <p class="col-sm-4 form-control-static control-label">
                            <asp:Label runat="server" AssociatedControlID="PhoneTextBox" Text="Phone" />
                        </p>
                        <div class="col-sm-4 ">
                            <asp:TextBox ID="PhoneTextBox" runat="server" class="form-control" MaxLength="10"  Text='<%# BindItem.Phone %>' />
                        </div>
                        <p class="col-sm-4 form-control-static error text-danger">
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneTextBox" ValidationGroup="MainValidationGroup"
                                Text="* Required" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ValidationGroup="MainValidationGroup"
                                Text="* Phone should be 10 digits" ControlToValidate="PhoneTextBox"
                                ValidationExpression="^[0-9]{10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        </p>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-offset-4 col-sm-4 ">
                            <asp:Button runat="server" ID="SubmitButton" Text="Register" CssClass="btn btn-primary"
                                ValidationGroup="MainValidationGroup" commandname="Insert" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-offset-4 col-sm-8 ">
                            <asp:ValidationSummary ID="ValidationSummary" runat="server" ValidationGroup="MainValidationGroup"
                                EnableClientScript="true" DisplayMode="SingleParagraph" ShowValidationErrors="true" 
                                ShowSummary="true" HeaderText="Please fix errors indicated above" />
                            
                        </div>
                    </div>
                </div>
            </InsertItemTemplate>

        </asp:FormView>

    </div>

</asp:Content>
