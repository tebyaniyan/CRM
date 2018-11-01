using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM
{
    public partial class Login : System.Web.UI.Page
    {
        Models.ManegmentProductCRMEntities db = new Models.ManegmentProductCRMEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "ورود به سیستم";
        }
        protected void ckuserValid_OnServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (from u in db.Tbl_User
                            where u.Email == txtUsername.Text.Trim()
                            where u.Password == txtPassword.Text
                            select u).Any();
        }

        protected void btnLogin_OnClick(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(3000);
            if (Page.IsValid)
            {
                var user =
                    (from u in db.Tbl_User where u.Email == txtUsername.Text && u.Password == txtPassword.Text select u)
                        .FirstOrDefault();
                if (user != null)
                {
                    FormsAuthentication.RedirectFromLoginPage(user.UserID.ToString(), ckSaveUser.Checked);
                }
                
            }
        }
    }
}