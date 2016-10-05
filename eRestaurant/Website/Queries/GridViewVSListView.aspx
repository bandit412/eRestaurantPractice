<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GridViewVSListView.aspx.cs" Inherits="Queries_GridViewVSListView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>GridView vs. ListView</h1>
    <asp:Label ID="Label1" runat="server" Text="GridView POCO"></asp:Label>
    <asp:ObjectDataSource ID="GridViewODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="MenuCategoryFoodItems_GetPOCO" TypeName="eRestaurantSystem.BLL.ItemsController"></asp:ObjectDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="GridViewODS" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="MenuCatgegoryDescription" HeaderText="MenuCatgegoryDescription" SortExpression="MenuCatgegoryDescription"></asp:BoundField>
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID"></asp:BoundField>
            <asp:BoundField DataField="FoodDescription" HeaderText="FoodDescription" SortExpression="FoodDescription"></asp:BoundField>
            <asp:BoundField DataField="CurrentPrice" HeaderText="CurrentPrice" SortExpression="CurrentPrice"></asp:BoundField>
            <asp:BoundField DataField="TimesServed" HeaderText="TimesServed" SortExpression="TimesServed"></asp:BoundField>
        </Columns>
    </asp:GridView>
</asp:Content>

