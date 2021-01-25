<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebServicesProject._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Map Viewer</h2>
    <h3>Please enter an address.</h3>
    <p>
        <asp:Label ID="lblStreet" Width="75" runat="server" Text="Street"></asp:Label>
        <asp:TextBox ID="txtStreet" Width="225" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="lblCity" Width="75" runat="server" Text="City"></asp:Label>
        <asp:TextBox ID="txtCity" Width="150" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="lblState" Width="75" runat="server" Text="State"></asp:Label>
        <asp:TextBox ID="txtState" Width="150" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="lblZip" Width="75" runat="server" Text="Zip Code"></asp:Label>
        <asp:TextBox ID="txtZip" Width="150" runat="server"></asp:TextBox>
    </p>
    <asp:RadioButton id="RoadRad" GroupName="MapChoice"
             Text="Road View (Default)" runat="server" Checked="true"/>
        <br />
        <asp:RadioButton id="SatRad" GroupName="MapChoice"
             Text="Satellite" runat="server"/>
        <br />
        <asp:RadioButton id="HybRad" GroupName="MapChoice"
             Text="Hybrid" runat="server"/>
        <br />
    <p>
        <asp:Button ID="btnMap" runat="server" OnClick="btnMap_Click" Text="Get Map"/>
    </p>
</asp:Content>

