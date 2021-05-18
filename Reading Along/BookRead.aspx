<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookRead.aspx.cs" Inherits="Reading_Along.BookRead" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .frameSize{
            width: 100%; 
            height: 100%; 
            margin: 0px; 
            border: none; 
            position: absolute; 
            top: 0; 
            left: 0; 
            right: 0; 
            bottom: 0; 
            background-color: transparent;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <iframe id="Book_Frame" runat="server" class="frameSize" title="book"></iframe>
    </form>
</body>
</html>
