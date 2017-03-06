using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DataLayer
{
    public class DL
    {
        public static void insertdata(EntitylLayer.EL objel)
        {
            SqlConnection con = new SqlConnection(@"Data Source=PRAMOD-PC\SQLEXPRESS;Initial Catalog=DBRegistration;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("spinsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserName", objel.Username);
            cmd.Parameters.AddWithValue("@Password", objel.Password);
            cmd.Parameters.AddWithValue("@FirstName", objel.FirstName);
            cmd.Parameters.AddWithValue("@LastName", objel.LastName);
            cmd.Parameters.AddWithValue("@Email", objel.Email);
            cmd.Parameters.AddWithValue("@PhoneNo", objel.PhoneNo);
            cmd.Parameters.AddWithValue("@Location", objel.Location);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            
            
            }

        public static DataSet display()
        {

            DataSet dt = new DataSet();
            SqlConnection con = new SqlConnection(@"Data Source=PRAMOD-PC\SQLEXPRESS;Initial Catalog=DBRegistration;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("spshow", con);
            cmd.CommandType = CommandType.StoredProcedure;
            
            
            SqlDataAdapter d = new SqlDataAdapter(cmd);
            d.Fill(dt);
            con.Close();
            return dt;
            

        }

        public static int delete(EntitylLayer.EL objel)
        {
            SqlConnection con = new SqlConnection(@"Data Source=PRAMOD-PC\SQLEXPRESS;Initial Catalog=DBRegistration;Integrated Security=True");
            con.Open();

            SqlCommand cmd = new SqlCommand("spdelete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", objel.Id);
            cmd.ExecuteNonQuery();
            con.Close();
            return 1;
        }

        public static int update(EntitylLayer.EL objel)
        {
            SqlConnection con = new SqlConnection(@"Data Source=PRAMOD-PC\SQLEXPRESS;Initial Catalog=DBRegistration;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("spupdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", objel.Id);
            cmd.Parameters.AddWithValue("@UserName", objel.Username);
            cmd.Parameters.AddWithValue("@Password", objel.Password);
            cmd.Parameters.AddWithValue("@FirstName", objel.FirstName);
            cmd.Parameters.AddWithValue("@LastName", objel.LastName);
            cmd.Parameters.AddWithValue("@Email", objel.Email);
            cmd.Parameters.AddWithValue("@PhoneNo", objel.PhoneNo);
            cmd.Parameters.AddWithValue("@Location", objel.Location);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return 1;
        }
    }
}