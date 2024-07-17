/*

Nama : I Made Nobel Saputra
NIM : 2301020053
Kelas : PAGI 2
Prodi : Teknik Informatika
Mata Pelajaran : Pengenalan Pemrograman (DDP)


*/


// memakai package main untuk memaikan function main
package main
	// memasukan import suatu fungsional
import (
	"fmt"
	"bufio"
	"os"
	"strings"
)
	// membuat struct untuk input nama
type userInput struct {
	namaKita string
}
	// membuat struct untuk pertanyaan dan jawaban
type perJaw struct {
	pertanyaan string
	option []string
	jawaban string
}
func main() {
	// membuat variabel dengan nama "namaInput" untuk meng-Input nama dan userInput yang di ambil dari struct
	var namaInput userInput
	// membuat variabel untuk konfigurasi benar, salah dengan tipe integar
	var benar, salah int

	// Tempat memasukan nama 
	fmt.Println() // baris kosong untuk pemisah
	fmt.Print("Masukan nama anda: ")
	fmt.Scanln(&namaInput.namaKita)
	fmt.Println()

	// kumpulan pertanyaan dengan slice
	pertanyaanSlice := []perJaw{
		{"Siapa nama presiden di Indonesia saat ini?", []string{"A. Joe Biden", "B. Joko widodo", "C. Kim Jong-Un", "D. Xi Jinping"}, "B"},
		{"Nama makanan yang berasal dari Indonesia?", []string{"A. Hamburger", "B. Pizza", "C. Lasagna", "D. Rendang"}, "A"},
		{"Apa nama motor tercepat di dunia?", []string{"A. Supra Bapak", "B. Slamet Kopling", "C. MTT 420-RR", "D. Vespa Matic"}, "B"},
	}	

	// konsep iterasi menggunakan range pada slice di Go
	for _, tanya := range pertanyaanSlice {
		fmt.Println(tanya.pertanyaan)
		for _, opsi := range tanya.option {
			fmt.Println(opsi)
		}
	// membaca input dari pengguna melalui terminal atau konsol
		reader := bufio.NewReader(os.Stdin)
		fmt.Print("Jawaban(A/B/C/D): ")
		answer, _ := reader.ReadString('\n')
		answer = strings.TrimSpace(answer)

	// konfigurasi benar salah, jika benar maka +1 atau sebaliknya
		benar += map[bool]int{strings.EqualFold(answer, tanya.jawaban): 1, true: 0}[true]
		salah += map[bool]int{strings.EqualFold(answer, tanya.jawaban): 0, true: 1}[true]

	// baris kosong untuk pemisah (<br>)
		fmt.Println()

	}

	// tampilan skor akhir
	fmt.Println("Statistic Kuis")
	fmt.Println("Nama		: ", namaInput.namaKita)
	fmt.Println("Score		: ", benar)
	fmt.Println("Jawaban Benar 	: ", benar)
	fmt.Println("Jawaban Salah	: ", salah)

}




