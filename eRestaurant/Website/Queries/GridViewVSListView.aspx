<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GridViewVSListView.aspx.cs" Inherits="Queries_GridViewVSListView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>GridView POCO</h1>
    <asp:Label ID="Label1" runat="server" Text="GridView POCO"></asp:Label>
    <asp:ObjectDataSource ID="GridViewODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="MenuCategoryFoodItems_GetPOCO" TypeName="eRestaurantSystem.BLL.ItemsController"></asp:ObjectDataSource>
    <asp:GridView ID="GridViewPOCO" runat="server" AutoGenerateColumns="False" DataSourceID="GridViewODS" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="MenuCatgegoryDescription" HeaderText="MenuCatgegoryDescription" SortExpression="MenuCatgegoryDescription"></asp:BoundField>
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID"></asp:BoundField>
            <asp:BoundField DataField="FoodDescription" HeaderText="FoodDescription" SortExpression="FoodDescription"></asp:BoundField>
            <asp:BoundField DataField="CurrentPrice" HeaderText="CurrentPrice" SortExpression="CurrentPrice"></asp:BoundField>
            <asp:BoundField DataField="TimesServed" HeaderText="TimesServed" SortExpression="TimesServed"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <hr />
    <!-- ListView Code -->
    <h1>ListView POCO</h1>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="GridViewODS">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF; color: #284775;">
                <td>
                    <asp:Label Text='<%# Eval("MenuCatgegoryDescription") %>' runat="server" ID="MenuCatgegoryDescriptionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ItemID") %>' runat="server" ID="ItemIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("FoodDescription") %>' runat="server" ID="FoodDescriptionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("CurrentPrice") %>' runat="server" ID="CurrentPriceLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("TimesServed") %>' runat="server" ID="TimesServedLabel" /></td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF; color: #333333;">
                <td>
                    <asp:Label Text='<%# Eval("MenuCatgegoryDescription") %>' runat="server" ID="MenuCatgegoryDescriptionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("ItemID") %>' runat="server" ID="ItemIDLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("FoodDescription") %>' runat="server" ID="FoodDescriptionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("CurrentPrice") %>' runat="server" ID="CurrentPriceLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("TimesServed") %>' runat="server" ID="TimesServedLabel" /></td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                            <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                <th runat="server">Menu Category</th>
                                <th runat="server">ID</th>
                                <th runat="server">Description</th>
                                <th runat="server">$Price</th>
                                <th runat="server">Servings</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                        <asp:DataPager runat="server" ID="DataPager1">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>

