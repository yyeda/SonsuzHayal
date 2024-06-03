using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace SonsuzHayal
{
    public partial class Kayit : Form
    {
        public Kayit()
        {
            InitializeComponent();
        }

       

       

        private void Kayit_FormClosed(object sender, FormClosedEventArgs e)
        {
            Form1 fr = new Form1();
            fr.Show();
        }
       
        private void button1_Click(object sender, EventArgs e)
        {
            string kullanici = textBox1.Text;
            string sifre = textBox2.Text;
            string isim = textBox3.Text;
            string soyisim = textBox4.Text;
            string eposta = textBox8.Text;
            string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=SonsuzHayal;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                if (!string.IsNullOrEmpty(kullanici) && !string.IsNullOrEmpty(sifre) && !string.IsNullOrEmpty(isim) && !string.IsNullOrEmpty(soyisim) && !string.IsNullOrEmpty(eposta))
                {
                    try
                    {
                        con.Open();

                        // SQL sorgusunda parametre kullanımı, SQL Injection saldırılarına karşı daha güvenli bir yol sağlar
                        string query = " INSERT INTO Kullanicilar (KullanıcıAdı, Sifre, İsim, Soyİsim, Eposta, rol_id) VALUES (@kullanici,@sifre, @isim , @soyisim, @eposta, 2);";

                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@kullanici", kullanici);
                        cmd.Parameters.AddWithValue("@sifre", sifre);
                        cmd.Parameters.AddWithValue("@isim", isim);
                        cmd.Parameters.AddWithValue("@soyisim", soyisim);
                        cmd.Parameters.AddWithValue("@eposta", eposta);






                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Hata: " + ex.Message);
                    }
                }
                else
                {
                    MessageBox.Show("Lütfen Tüm Verileri Doğru ve Eksiksiz giriniz");
                }
            }







        }

        private void Kayit_Load(object sender, EventArgs e)
        {

        }
    }
}

