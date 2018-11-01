using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Models;

namespace CRM
{
    public partial class Register : System.Web.UI.Page
    {
        Models.ManegmentProductCRMEntities db = new Models.ManegmentProductCRMEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "ثبت نام";
        }

        protected void btnRegister_OnClick(object sender, EventArgs e)
        {
            db.Tbl_User.Add(new Tbl_User()
            {
                Date = DateTime.Now,
                Email = txtEmail.Text,
                Password = txtPassword.Text,
                Family = txtfamily.Text,
                Name = txtFullName.Text,
                RoleID = 2,
                Username = txtUsername.Text,
                
            });
            db.SaveChanges();
            Response.Redirect("/Login.aspx");
        }
    }
}