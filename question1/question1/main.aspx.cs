using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntitylLayer;
using BusinessLayer;
using System.Data;
using System.Data.SqlClient;

namespace question1
{
    public partial class main : System.Web.UI.Page
    {
        EL objel = new EL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                display();
            }


        }

        private void display()
        {

            DataSet dt = BusinessLayer.BL.display();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            insertuser();

        }

        

        private void insertuser()
        {
            objel.Username = txt_username.Text;
            objel.Password = txt_password.Text;
            objel.Confirmpassword = txt_confirmpassword.Text;
            objel.FirstName = txt_firstname.Text;
            objel.LastName = txt_lastname.Text;
            objel.Email = txt_email.Text;
            objel.PhoneNo = txt_phoneno.Text;
            objel.Location = txt_location.Text;
            BusinessLayer.BL.insertuser(objel);
            display();
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            txt_username.Text = string.Empty;
            txt_password.Text = string.Empty;
            txt_confirmpassword.Text = string.Empty;
            txt_firstname.Text = string.Empty;
            txt_lastname.Text = string.Empty;
            txt_email.Text = string.Empty;
            txt_phoneno.Text = string.Empty;
            txt_location.Text = string.Empty;

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            if (((LinkButton)e.CommandSource).Text == "Delete")
            {
                GridViewRow row = this.GridView1.Rows[index];
                ViewState["id"] = GridView1.DataKeys[row.RowIndex].Value;
                if (ViewState["id"] != null)
                {
                    objel.Id = Convert.ToInt32(ViewState["id"]);
                    int i = BusinessLayer.BL.delete(objel);
                    display();
                }
            }
            if (((LinkButton)e.CommandSource).Text == "Update")
            {
                GridViewRow row = GridView1.Rows[index];
                ViewState["id"] = this.GridView1.DataKeys[row.RowIndex].Value;
                txt_firstname.Text = row.Cells[1].Text;
                txt_lastname.Text = row.Cells[2].Text;
                txt_email.Text = row.Cells[3].Text;
                txt_phoneno.Text = row.Cells[4].Text;
                txt_location.Text = row.Cells[5].Text;

            }


        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Update();
        }

        private void Update()
        {
            objel.Id = Convert.ToInt32(ViewState["id"]);
            objel.Username = txt_username.Text;
            objel.Password = txt_password.Text;
            objel.Confirmpassword = txt_confirmpassword.Text;
            objel.FirstName = txt_firstname.Text;
            objel.LastName = txt_lastname.Text;
            objel.Email = txt_email.Text;
            objel.PhoneNo = txt_phoneno.Text;
            objel.Location = txt_location.Text;
            int i = BusinessLayer.BL.update(objel);
            display();
        
        }

    }
}