using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM.Admin
{
    public partial class AccessLevel : System.Web.UI.Page
    {
        Models.ManegmentProductCRMEntities db = new Models.ManegmentProductCRMEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "سطح های دسترسی";
        }
        protected void dsShowRole_OnSelecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from u in db.Tbl_Role
                        select new
                        {
                            u.RoleID,
                            u.RoleName,
                            u.RoleTitle,
                        }).ToList();

        }

        protected void gvShowRole_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "DoEdit":
                    {
                        int roleId = int.Parse(e.CommandArgument.ToString());
                        var role = db.Tbl_Role.First(p => p.RoleID == roleId);
                        txtTitleName.Text = role.RoleTitle;
                        ViewState["roleId"] = roleId;
                        mvRole.SetActiveView(vwAddRole);
                        break;
                    }
            }
        }

        protected void btnAdd_OnClick(object sender, EventArgs e)
        {
            if (ViewState["roleId"] != null)
            {
                int roleId = int.Parse(ViewState["roleId"].ToString());
                var role = db.Tbl_Role.First(p => p.RoleID == roleId);
                role.RoleTitle = txtTitleName.Text;
                db.SaveChanges();
                Response.Redirect(Request.UrlReferrer.AbsolutePath);
            }
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Response.Redirect(Request.UrlReferrer.AbsolutePath);
        }
    }
}