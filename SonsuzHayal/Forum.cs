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
    public partial class Forum : Form
    {
        public Forum()
        {
            InitializeComponent();
        }
        string kulid="1";
        private void Formsayfasi_Load(object sender, EventArgs e)
        {  
           
            string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=SonsuzHayal;Integrated Security=True";

          
            using (SqlConnection con = new SqlConnection(connectionString))
            {




                try
                {
                    con.Open();

                   
                    string query = "SELECT * FROM Forum WHERE gonderi_id=@kullanici ";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@kullanici", kulid);

                  
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    { 
                        richTextBox1.Text = dr["gonderi_basligi"].ToString();
                        richTextBox2.Text = dr["gonderi_metni"].ToString();
                        label1.Text = dr["gonderi_tarihi"].ToString();
                    }



                    dr.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Hata: " + ex.Message);
                }


            }
        }
        int num = 0;
        private void button2_Click(object sender, EventArgs e)
        {
            num = int.Parse(kulid);
            num=1+num;
           kulid=num.ToString();

            string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=SonsuzHayal;Integrated Security=True";


            using (SqlConnection con = new SqlConnection(connectionString))
            {




                try
                {
                    con.Open();


                    string query = "SELECT * FROM Forum WHERE gonderi_id=@kullanici ";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@kullanici", kulid);


                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        richTextBox1.Text = dr["gonderi_basligi"].ToString();
                        richTextBox2.Text = dr["gonderi_metni"].ToString();
                        label1.Text = dr["gonderi_tarihi"].ToString();

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
            num = int.Parse(kulid);
            num--;
            kulid = num.ToString();

            string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=SonsuzHayal;Integrated Security=True";


            using (SqlConnection con = new SqlConnection(connectionString))
            {




                try
                {
                    con.Open();


                    string query = "SELECT * FROM Forum WHERE gonderi_id=@kullanici ";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@kullanici", kulid);


                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        richTextBox1.Text = dr["gonderi_basligi"].ToString();
                        richTextBox2.Text = dr["gonderi_metni"].ToString();
                        label1.Text = dr["gonderi_tarihi"].ToString();
                    }



                    dr.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Hata: " + ex.Message);
                }


            }
        }
    }
}
