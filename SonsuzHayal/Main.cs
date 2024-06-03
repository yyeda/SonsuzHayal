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

namespace SonsuzHayal
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
        }
        public static string kulid;
        private void Main_Load(object sender, EventArgs e)
        {
            string kuladi=Form1.kullanici;
            string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=SonsuzHayal;Integrated Security=True";

            // SQL Server bağlantı nesnesi
            using (SqlConnection con = new SqlConnection(connectionString))
            {
               

                
                
                    try
                    {
                        con.Open();

                        // SQL sorgusunda parametre kullanımı, SQL Injection saldırılarına karşı daha güvenli bir yol sağlar
                        string query = "SELECT * FROM Kullanicilar WHERE Kullanıcıadı=@kullanici ";

                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@kullanici", kuladi);
                       

                        SqlDataReader dr = cmd.ExecuteReader();

                       while (dr.Read())
                        {
                        
                        richTextBox1.Text= dr["KullanıcıAdı"].ToString()+" " + dr["isim"].ToString()+" "+ dr["Soyisim"].ToString() +" " + dr["Eposta"].ToString();

                        kulid = dr["kullanici_id"].ToString();
                      

                       }
                       

                        dr.Close();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Hata: " + ex.Message);
                    }
                
               
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Forum ff = new Forum();
            ff.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {

        }
    }
}
