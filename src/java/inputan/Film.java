/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author MyBook Hype AMD
 */
package inputan;

public class Film {
    public String judul;
    public String genre;
    public int durasi; // dalam menit
    public int harga;
    public String[] jamTayang;

    public Film(String judul, String genre, int durasi, int harga, String[] jamTayang) {
        this.judul = judul;
        this.genre = genre;
        this.durasi = durasi;
        this.harga = harga;
        this.jamTayang = jamTayang;
    }
}
