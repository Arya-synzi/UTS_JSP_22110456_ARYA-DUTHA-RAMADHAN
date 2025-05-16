<%@ page import="java.util.*, inputan.Film" %>
<%
    String nama = request.getParameter("nama");
    int filmIndex = Integer.parseInt(request.getParameter("filmIndex"));
    String jam = request.getParameter("jam");
    int jumlah = Integer.parseInt(request.getParameter("jumlah"));

    ArrayList<Film> filmList = (ArrayList<Film>) session.getAttribute("filmList");
    Film filmDipilih = filmList.get(filmIndex);
    int totalHarga = jumlah * filmDipilih.harga;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Struk Pemesanan Tiket</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #6f4e37; /* brown background */
            font-family: 'Courier New', Courier, monospace;
        }
        .ticket {
            background: white;
            color: black;
            padding: 30px;
            max-width: 400px;
            margin: 50px auto;
            box-shadow: 0 8px 20px rgba(0,0,0,0.5);
            border-radius: 10px;
        }
        .ticket h3 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .line {
            border-bottom: 1px dashed #333;
            margin: 10px 0;
        }
        .ticket-item {
            margin-bottom: 10px;
        }
        .ticket-item span {
            float: right;
        }
        .barcode {
            margin-top: 30px;
            text-align: center;
        }
        .barcode img {
            max-width: 100%;
            height: 60px;
        }
        .btn-home {
            margin-top: 20px;
            display: block;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="ticket">
    <h3>BIOSKOP Mardira</h3>
    <div class="line"></div>
    <div class="ticket-item">Nama:<span><%= nama %></span></div>
    <div class="ticket-item">Film:<span><%= filmDipilih.judul %></span></div>
    <div class="ticket-item">Genre:<span><%= filmDipilih.genre %></span></div>
    <div class="ticket-item">Jam Tayang:<span><%= jam %></span></div>
    <div class="ticket-item">Jumlah Tiket:<span><%= jumlah %></span></div>
    <div class="ticket-item">Total Bayar:<span>Rp <%= totalHarga %></span></div>
    <div class="line"></div>
    
    <div class="barcode">
        <img src="https://barcode.tec-it.com/barcode.ashx?data=<%= nama %><%= jam %>&code=Code128&translate-esc=false" alt="barcode">
    </div>

    <div class="btn-home">
        <a href="index.jsp" class="btn btn-dark btn-sm">Kembali ke Beranda</a>
    </div>
</div>

</body>
</html>
