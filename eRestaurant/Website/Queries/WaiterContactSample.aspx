<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="WaiterContactSample.aspx.cs" Inherits="Queries_WaiterContactSample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Sample: Entity vs. LINQ to Entity Query</h1>
    <asp:ObjectDataSource ID="EntityFrameworkODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="WaiterList_All" TypeName="eRestaurantSystem.BLL.WaiterController"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="LinqToEntityODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="WaiterContacts_Get" TypeName="eRestaurantSystem.BLL.WaiterController"></asp:ObjectDataSource>
    <asp:GridView ID="EntityFrameworkList" runat="server" AllowPaging="true" AutoGenerateColumns="False" DataSourceID="EntityFrameworkODS">
        <Columns>
            <asp:BoundField DataField="WaiterID" HeaderText="WaiterID" SortExpression="WaiterID"></asp:BoundField>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"></asp:BoundField>
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName"></asp:BoundField>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"></asp:BoundField>
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
            <asp:BoundField DataField="HireDate" HeaderText="HireDate" SortExpression="HireDate"></asp:BoundField>
            <asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:GridView ID="LinqToEntityList" runat="server" AllowPaging="true" AutoGenerateColumns="False" DataSourceID="LinqToEntityODS">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"></asp:BoundField>
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
        </Columns>
    </asp:GridView>
</asp:Content>

