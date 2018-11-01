using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Models;

namespace CRM.Admin
{
    public partial class Customer : System.Web.UI.Page
    {
        Models.ManegmentProductCRMEntities db = new Models.ManegmentProductCRMEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "مدیریت مشتریان";
        }
        protected void dsShowUser_OnSelecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from u in db.Tbl_User
                        orderby u.RoleID descending
                        select new
                        {
                            u.UserID,
                            u.RoleID,
                            u.Tbl_Role.RoleTitle,
                            u.Email,
                            u.Password,
                            u.Username,
                            u.Name,
                            u.Family,

                            }).ToList();

        }


        protected void gvListUer_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "DoEdit":
                    {
                        int userId = int.Parse(e.CommandArgument.ToString());
                        var user = db.Tbl_User.First(p => p.UserID == userId);
                        txtPassword.Text = user.Password;
                        txtEmail.Text = user.Email;
                        txtname.Text = user.Name;
                        txtFamily.Text = user.Family;
                        txtUsername.Text = user.Username;
                        ddlRole.SelectedValue = user.RoleID.ToString();
                        ViewState["userId"] = userId;
                        btnShowaddView.Visible = true;
                        mvListUser.SetActiveView(vweditUser);

                        break;
                    }
                case "DoDelete":
                    {
                        int userId = int.Parse(e.CommandArgument.ToString());
                        var user = db.Tbl_User.First(p => p.UserID == userId);
                        db.Tbl_User.Remove(user);
                        db.SaveChanges();
                        gvListUer.DataBind();
                        break;
                    }
              
                    
            }
        }
        protected void btnAdd_OnServerClick(object sender, EventArgs e)
        {

            if (ViewState["userId"] == null)
            {
                db.Tbl_User.Add(new Tbl_User()
                {
                    RoleID = int.Parse(ddlRole.SelectedValue),
                    Name = txtname.Text,
                    Family = txtFamily.Text,
                    Date = DateTime.Now,
                    Email = txtEmail.Text,
                    Password = txtPassword.Text,
                    Username = txtUsername.Text,
                });
                db.SaveChanges();
                Response.Redirect(Request.UrlReferrer.AbsolutePath);
            }
            else
            {
                int userId = int.Parse(ViewState["userId"].ToString());
                var user = db.Tbl_User.First(p => p.UserID == userId);
                user.Password = txtPassword.Text;
                user.Email = txtEmail.Text;
                user.Name = txtname.Text;
                user.Family = txtFamily.Text;
                user.Username = txtUsername.Text;
                user.RoleID = int.Parse(ddlRole.SelectedValue);
                db.SaveChanges();
                Response.Redirect(Request.UrlReferrer.AbsolutePath);

            }

        }

        protected void btnShowaddView_OnClick(object sender, EventArgs e)
        {
            btnShowaddView.Visible = false;
            mvListUser.SetActiveView(vweditUser);

        }

        protected void btnCancell_OnServerClick(object sender, EventArgs e)
        {
            Response.Redirect(Request.UrlReferrer.AbsolutePath);
        }

    }
}