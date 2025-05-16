<%@ page import="java.util.*, inputan.Film" %>
<%
    ArrayList<Film> filmList = (ArrayList<Film>) session.getAttribute("filmList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Form Pemesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #6f4e37; /* Brown */
            color: #fff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .navbar {
            background-color: #4e342e;
            box-shadow: 0 2px 6px rgba(0,0,0,0.4);
        }
        .container {
            background-color: #5d4037;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.5);
            max-width: 500px;
            margin-bottom: 40px;
            flex-grow: 1;
        }
        h2 {
            margin-bottom: 25px;
            font-weight: 700;
            letter-spacing: 1.2px;
            text-align: center;
            color: #ffd180;
            text-shadow: 1px 1px 4px #3e2723;
        }
        label {
            font-weight: 600;
            color: #ffd180;
        }
        .form-control, .form-select {
            background-color: #8d6e63;
            border: none;
            color: #fff;
            box-shadow: inset 2px 2px 6px rgba(0,0,0,0.3);
            transition: background-color 0.3s ease;
        }
        .form-control:focus, .form-select:focus {
            background-color: #a1887f;
            color: #fff;
            box-shadow: 0 0 8px #ffd180;
            outline: none;
        }
        .btn-success {
            background-color: #3e2723;
            border: none;
            width: 100%;
            padding: 12px;
            font-weight: 600;
            font-size: 1.1rem;
            transition: background-color 0.3s ease;
            box-shadow: 0 5px 15px rgba(0,0,0,0.4);
        }
        .btn-success:hover {
            background-color: #5d4037;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp" style="font-weight:700; font-size:1.25rem; letter-spacing:1px;">Bioskop Mardira</a>
    </div>
</nav>

<div class="container">
    <h2>Form Pemesanan Tiket</h2>
    <form action="struk.jsp" method="post" class="mt-3">
        <div class="mb-4">
            <label for="nama" class="form-label">Nama</label>
            <input type="text" id="nama" class="form-control" name="nama" required autocomplete="off" placeholder="Masukkan nama lengkap"/>
        </div>

        <div class="mb-4">
            <label for="filmSelect" class="form-label">Film</label>
            <select id="filmSelect" name="filmIndex" class="form-select" onchange="updateJamTayang()" required>
                <% for (int i = 0; i < filmList.size(); i++) { %>
                    <option value="<%= i %>"><%= filmList.get(i).judul %></option>
                <% } %>
            </select>
        </div>

        <div class="mb-4">
            <label for="jamSelect" class="form-label">Jam Tayang</label>
            <select id="jamSelect" name="jam" class="form-select" required></select>
        </div>

        <div class="mb-4">
            <label for="jumlah" class="form-label">Jumlah Tiket</label>
            <input type="number" id="jumlah" class="form-control" name="jumlah" min="1" max="10" required placeholder="Masukkan jumlah tiket" />
        </div>

        <button type="submit" class="btn btn-success">Pesan Tiket</button>
    </form>
</div>

<script>
    const jamTayangList = [
        <% for (Film f : filmList) { %>
            ["<%= String.join("\", \"", f.jamTayang) %>"],
        <% } %>
    ];

    function updateJamTayang() {
        const filmIndex = document.getElementById("filmSelect").value;
        const jamSelect = document.getElementById("jamSelect");
        jamSelect.innerHTML = "";

        jamTayangList[filmIndex].forEach(jam => {
            const option = document.createElement("option");
            option.value = jam;
            option.textContent = jam;
            jamSelect.appendChild(option);
        });
    }

    window.onload = updateJamTayang;
</script>

</body>
</html>
