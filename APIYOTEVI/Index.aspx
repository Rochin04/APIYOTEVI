<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="APIYOTEVI.index" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Título de tu página</title>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css" />
    <style>
        /* Estilo para el fondo gris oscuro */
        body {
            background-color: #333;
            color: #fff;
        }

        /* Estilo para el encabezado */
        .header {
            background-color: #ff0000; /* Rojo característico de YouTube */
            padding: 10px 0;
        }

        /* Estilo para el botón de búsqueda */
        #btnBuscar {
            background-color: #ff0000;
            color: #fff;
            border: none;
            transition: background-color 0.3s ease; /* Transición de color en 0.3 segundos */
            cursor: pointer;
        }

        /* Estilo para el botón de búsqueda al pasar el mouse sobre él */
        #btnBuscar:hover {
            background-color: #cc0000; /* Rojo ligeramente más oscuro al pasar el mouse */
        }

        /* Estilo para el título "Videos" */
        h1 {
            color: #ff0000;
        }

        /* Estilo para el borde del GridView */
        .table-bordered {
            border: 2px solid #ff0000;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script>
        function reproducirVideo(VideoId) {
            var srcVideo = "https://www.youtube.com/embed/" + VideoId + "?autoplay=1&loop=1";
            $("#frameVideo").attr("src", srcVideo);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txBuscar">Buscar</label>
                            <asp:TextBox ID="txBuscar" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" CssClass="btn btn-danger" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <br />
                    <h1>Videos DEL yotevi</h1>
                    <asp:GridView runat="server" ID="gridVideos" AutoGenerateColumns="false" CssClass="table-responsive table table-bordered">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Titulo" />
                            <asp:TemplateField HeaderText="Imagen">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Imagen") %>' Width="100px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Reproducir">
                                <ItemTemplate>
                                    <a href="javascript:reproducirVideo('<%# Eval("videoId") %>')" class="btn btn-primary">Reproducir</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="col-md-6">
                    <br />
                    <iframe id="frameVideo" width="100%" height="450px" src="" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
