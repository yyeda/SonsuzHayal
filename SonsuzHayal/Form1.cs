using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace SonsuzHayal
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }


        public static string kullanici;
        private void button1_Click(object sender, EventArgs e)
        {

         

            // ...

            string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=SonsuzHayal;Integrated Security=True";

            // SQL Server bağlantı nesnesi
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                kullanici = textBox1.Text;
                string sifre = textBox2.Text;

                if (!string.IsNullOrEmpty(kullanici) && !string.IsNullOrEmpty(sifre))
                {
                    try
                    {
                        con.Open();

                        // SQL sorgusunda parametre kullanımı, SQL Injection saldırılarına karşı daha güvenli bir yol sağlar
                        string query = "SELECT * FROM Kullanicilar WHERE Kullanıcıadı=@kullanici AND Sifre=@sifre";

                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@kullanici", kullanici);
                        cmd.Parameters.AddWithValue("@sifre", sifre);

                        SqlDataReader dr = cmd.ExecuteReader();

                        if (dr.Read())
                        {
                            //ıkgulıgıu
                            Main mr = new Main();
                            mr.Show();
                            this.Hide();
                            
                        }
                        else
                        {
                            MessageBox.Show("Kullanıcı adı ya da şifre yanlış");
                        }

                        dr.Close();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Hata: " + ex.Message);
                    }
                }
                else
                {
                   ///Misafir Girişi
                }
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Kayit ky = new Kayit();
            ky.Show();
            this.Hide();

        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
