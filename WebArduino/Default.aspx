<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WebArduino.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WebArduino</title>
    <style>
body    {
       background-color:lightgray
}
</style>
</head>
<body>
 <form id="form1" runat="server">
        
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Timer ID="Timer1" runat="server" Interval="1000">
        </asp:Timer>
        <br />

        
        <asp:Table ID="Table3" runat="server" HorizontalAlign="Center" Width="700px" Font-Bold="True" Font-Size="XX-Large" Font-Strikeout="False">
            <asp:TableRow runat="server" HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="XX-Large">
                <asp:TableCell runat="server" Font-Names="Verdana">Access to Arduino by Website</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <br />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Table ID="Table1" runat="server" BorderStyle="Solid" BorderWidth="1px" GridLines="Both" HorizontalAlign="Center" Width="700px">
                    <asp:TableRow runat="server" BackColor="White" BorderColor="#009933" BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Middle">
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">RX</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">TX</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">2</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">3</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">4</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">5</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">6</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">7</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">8</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">9</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">10</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">11</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">12</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">13</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">ALL</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                        <asp:TableCell runat="server"><asp:Button ID="D0Btn" runat="server" Text="0" Enabled="false"/></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="D1Btn" runat="server" Text="0" Enabled="false"/></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="D2Btn" runat="server" Text="0" /></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="D3Btn" runat="server" Text="0" /></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="D4Btn" runat="server" Text="0" /></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="D5Btn" runat="server" Text="0" /></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="D6Btn" runat="server" Text="0" /></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="D7Btn" runat="server" Text="0" /></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="D8Btn" runat="server" Text="0" /></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="D9Btn" runat="server" Text="0" /></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="D10Btn" runat="server" Text="0" /></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="D11Btn" runat="server" Text="0" /></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="D12Btn" runat="server" Text="0" /></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="D13Btn" runat="server" Text="0" /></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="DAllBtn" runat="server" Text="0" /></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        <br />
        <center>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/ArduinoMegax800.png" ImageAlign="Middle" BorderWidth="1px" Width="700px"/>
        </center>    
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <br />
                <asp:Table ID="Table2" runat="server" BorderStyle="Solid" BorderWidth="1px" GridLines="Both" HorizontalAlign="Center" Width="700px">
                    <asp:TableRow runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                            <asp:TextBox ID="A0Val" runat="server" Enabled="False" BackColor="WhiteSmoke" 
                                BorderStyle="Solid" ReadOnly="True" MaxLength="5" Width="70px" Height="20px">0</asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                            <asp:TextBox ID="A1Val" runat="server" Enabled="False" BackColor="WhiteSmoke" 
                                BorderStyle="Solid" ReadOnly="True" MaxLength="5" Width="70px" Height="20px">0</asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                            <asp:TextBox ID="A2Val" runat="server" Enabled="False" BackColor="WhiteSmoke" 
                                BorderStyle="Solid" ReadOnly="True" MaxLength="5" Width="70px" Height="20px">0</asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                            <asp:TextBox ID="A3Val" runat="server" Enabled="False" BackColor="WhiteSmoke" 
                                BorderStyle="Solid" ReadOnly="True" MaxLength="5" Width="70px" Height="20px">0</asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                            <asp:TextBox ID="A4Val" runat="server" Enabled="False" BackColor="WhiteSmoke" 
                                BorderStyle="Solid" ReadOnly="True" MaxLength="5" Width="70px" Height="20px">0</asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                            <asp:TextBox ID="A5Val" runat="server" Enabled="False" BackColor="WhiteSmoke" 
                                BorderStyle="Solid" ReadOnly="True" MaxLength="5" Width="70px" Height="20px">0</asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server" BackColor="White" BorderColor="Maroon" BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Middle">
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">A0</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">A1</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">A2</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">A3</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">A4</asp:TableCell>
                        <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">A5</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick">
                </asp:AsyncPostBackTrigger>
            </Triggers>
        </asp:UpdatePanel>
        <br />
        <asp:Table ID="Table5" runat="server" HorizontalAlign="Center" Width="700px">
            <asp:TableRow runat="server" Font-Names="Verdana" Font-Size="Small">
                <asp:TableCell runat="server">Digital Value: <br />Changing from 0 to 1 (and vice versa)<br />
                </asp:TableCell>
                <asp:TableCell runat="server">Analog Value: <br />Changing from 0 to 5V </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        
    </form>
</body>
</html>
