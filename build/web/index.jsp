<%@ page import="java.util.*, inputan.Film" %>
<%
    ArrayList<Film> filmList = new ArrayList<>();
    filmList.add(new Film("Inception", "Sci-Fi", 148, 50000, new String[]{"10:00", "13:00", "16:00"}));
    filmList.add(new Film("Avengers: Endgame", "Action", 181, 60000, new String[]{"11:00", "14:00", "17:00"}));
    filmList.add(new Film("Laskar Pelangi", "Drama", 120, 40000, new String[]{"09:00", "12:00", "15:00"}));
    session.setAttribute("filmList", filmList);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Daftar Film</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #6f4e37; /* Brown */
            color: #fff;
            margin: 0;
            padding: 0;
        }

        .navbar {
            margin-bottom: 0;
            background-color: #4e342e;
        }

        .carousel-img {
            max-height: 75vh;
            object-fit: contain;
            background-color: #000;
        }

        .film-img {
            height: 250px;
            object-fit: cover;
            border-radius: 12px;
        }

        .review-section {
            background-color: #d7ccc8;
            color: #3e2723;
            padding: 40px;
            border-top: 2px solid #b0a394;
            border-bottom: 2px solid #b0a394;
            margin-bottom: 30px;
            border-radius: 15px;
        }

        .review-table {
            background-color: #bcaaa4;
            border-radius: 10px;
            color: #3e2723;
        }

        .review-table th {
            background-color: #4e342e;
            color: white;
        }

        .card {
            border-radius: 15px;
            background-color: #5d4037;
            color: #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
        }

        .card-body {
            background-color: #6d4c41;
            border-radius: 0 0 15px 15px;
        }

        .btn-primary {
            background-color: #3e2723;
            border: none;
            padding: 10px 25px;
            margin-top: 10px;
            transition: background-color 0.3s ease;
            color: #fff;
        }
        .btn-primary:hover {
            background-color: #5d4037;
            color: #fff;
        }

        /* Untuk tabel info film di card */
        .card table {
            color: #d7ccc8;
            width: 100%;
        }
        .card table th {
            width: 35%;
            padding: 5px 10px;
        }
        .card table td {
            padding: 5px 10px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-dark">
    <div class="container d-flex justify-content-between align-items-center">
        <a class="navbar-brand" href="#">Bioskop Mardira</a>
        <form class="d-flex" role="search" onsubmit="return false;">
            <input id="searchInput" class="form-control me-2" type="search" placeholder="Cari film..." onkeyup="filterFilms()" />
        </form>
    </div>
</nav>

<!-- Carousel -->
<div id="filmCarousel" class="carousel slide mb-5" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://m.media-amazon.com/images/I/51zUbui+gbL._AC_.jpg" class="d-block w-100 carousel-img" alt="Inception" />
        </div>
        <div class="carousel-item">
            <img src="https://m.media-amazon.com/images/I/81ExhpBEbHL._AC_SY679_.jpg" class="d-block w-100 carousel-img" alt="Avengers" />
        </div>
        <div class="carousel-item">
            <img src="https://1.bp.blogspot.com/-9T4t5U8DxnA/WKqn0wWompI/AAAAAAAABhw/MoU1MBDeY-cPVttYCQmzKsyeQQ_C-UUKgCLcB/s1600/Laskar-Pelangi.jpg" class="d-block w-100 carousel-img" alt="Laskar Pelangi" />
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#filmCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#filmCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>

<!-- Konten Film -->
<div class="container">
    <div class="row" id="filmContainer">
        <% 
        for (Film f : filmList) { 
            String titleLower = f.judul.toLowerCase();
        %>
        <div class="col-md-4 mb-4 film-card" data-title="<%= titleLower %>">
            <div class="card shadow">
                <img src="<%= f.judul.equals("Inception") ? "https://m.media-amazon.com/images/I/51zUbui+gbL._AC_.jpg"
                            : f.judul.equals("Avengers: Endgame") ? "https://m.media-amazon.com/images/I/81ExhpBEbHL._AC_SY679_.jpg"
                            : "https://1.bp.blogspot.com/-9T4t5U8DxnA/WKqn0wWompI/AAAAAAAABhw/MoU1MBDeY-cPVttYCQmzKsyeQQ_C-UUKgCLcB/s1600/Laskar-Pelangi.jpg" %>" 
                     class="card-img-top film-img" alt="<%= f.judul %>" />
                <div class="card-body">
                    <h5 class="card-title"><%= f.judul %></h5>
                    <table>
                        <tr><th>Genre</th><td><%= f.genre %></td></tr>
                        <tr><th>Durasi</th><td><%= f.durasi %> menit</td></tr>
                        <tr><th>Harga</th><td>Rp <%= f.harga %></td></tr>
                        <tr><th>Jam Tayang</th><td><%= String.join(", ", f.jamTayang) %></td></tr>
                    </table>
                    <p class="text-muted mt-2"><i>
                        <%= f.judul.equals("Inception") ? "Seorang pencuri spesialis mimpi menjalani misi terakhirnya."
                        : f.judul.equals("Avengers: Endgame") ? "Para Avengers melawan Thanos demi mengembalikan dunia."
                        : "Kisah inspiratif anak-anak Belitung mengejar pendidikan." %>
                    </i></p>
                    <a href="formPesan.jsp" class="btn btn-primary w-100">Pesan Tiket Sekarang</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>

    <!-- Review Section -->
    <div class="review-section">
        <h2 class="text-center mb-4">Review Film</h2>
        <table class="table review-table table-striped table-bordered mx-auto" style="max-width:700px;">
            <thead>
                <tr>
                    <th>Film</th>
                    <th>Review</th>
                    <th>Rating</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Inception</td>
                    <td>Plot yang rumit tapi sangat memikat dan visual yang memukau.</td>
                    <td>7,9</td>
                </tr>
                <tr>
                    <td>Avengers: Endgame</td>
                    <td>Aksi epik dan penutupan yang memuaskan dari saga Avengers.</td>
                    <td>8,9</td>
                </tr>
                <tr>
                    <td>Laskar Pelangi</td>
                    <td>Kisah inspiratif yang menyentuh hati dan penuh motivasi.</td>
                    <td>6,8</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- Script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
function filterFilms() {
    const input = document.getElementById('searchInput').value.toLowerCase();
    const cards = document.querySelectorAll('.film-card');
    cards.forEach(card => {
        const title = card.getAttribute('data-title');
        card.style.display = title.includes(input) ? 'block' : 'none';
    });
}
</script>

</body>
</html>
