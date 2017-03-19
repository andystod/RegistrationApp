<%@ Page Title="Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="RegistrationApp.Search" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    
    <div>
        <asp:TextBox ID="SearchTextBox" runat="server"></asp:TextBox>
        <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" />
    </div>

    <asp:GridView ID="registrationGridView" runat="server" AutoGenerateColumns="False" 
        AllowCustomPaging="True" AllowPaging="True"  AllowSorting="true" 
        ItemType="RegistrationApp.RegistrationSearch_Result"
        SelectMethod="GetRegistrationList" UpdateMethod="RegistrationGridView_UpdateItem" 
        DeleteMethod="RegistrationGridView_DeleteItem" DataKeyNames="Username" OnSorting="RegistrationGridView_Sorting"
        >
    <Columns>
        <asp:TemplateField HeaderText="Name" SortExpression="Name">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# BindItem.Name %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Item.Name %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="80px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# BindItem.Email %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Item.Email %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="150px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Phone">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# BindItem.Phone %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Item.Phone %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Action">
            <EditItemTemplate>
                <asp:LinkButton  runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                &nbsp;<asp:LinkButton  runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton  runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                <asp:LinkButton  runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
            </ItemTemplate>
            <ItemStyle Width="100px" />
        </asp:TemplateField>
    </Columns>
</asp:GridView>


</asp:Content>
