using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Models;

namespace CRM.Admin
{
    public partial class Product : System.Web.UI.Page
    {
        Models.ManegmentProductCRMEntities db = new Models.ManegmentProductCRMEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "مدیریت محصولات";
        }

        protected void dsListProduct_OnSelecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from u in db.Tbl_Product
                        orderby u.Date descending
                        select new
                        {
                            u.ProductID,
                            u.ProductName,
                            u.Company,
                            u.Note,
                            u.Date,
                        }).ToList();
        }

        protected void btnAddProduct_OnClick(object sender, EventArgs e)
        {
            mvShowListProduct.SetActiveView(vwAddProduct);
        }

        protected void btnAdd_OnClick(object sender, EventArgs e)
        {
            if (ViewState["ProductId"] == null)
            {
                db.Tbl_Product.Add(new Tbl_Product()
                {
                    ProductName = txtName.Text,
                    Company = txtCompany.Text,
                    Date = DateTime.Now,
                    Note = txtNote.Text,
                });
                db.SaveChanges();
                Response.Redirect(Request.UrlReferrer.AbsolutePath);
            }
            else
            {
                int productid = int.Parse(ViewState["ProductId"].ToString());
                var product = (from u in db.Tbl_Product where u.ProductID == productid select u).First();
                product.ProductName = txtName.Text;
                product.Company = txtCompany.Text;
                product.Note = txtNote.Text;
                db.SaveChanges();
                Response.Redirect(Request.UrlReferrer.AbsolutePath);
            }
        }

        protected void gvListProduct_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "DoEdit":
                {
                    int ProductId = int.Parse(e.CommandArgument.ToString());
                    var product = (from u in db.Tbl_Product where u.ProductID == ProductId select u).First();
                    txtName.Text = product.ProductName;
                    txtCompany.Text = product.Company;
                    txtNote.Text = product.Note;
                    ViewState["ProductId"] = ProductId;
                    mvShowListProduct.SetActiveView(vwAddProduct);
                    btnAddProduct.Visible = false;
                    break;
                }
                case "DoDelete":
                {
                    int ProductId = int.Parse(e.CommandArgument.ToString());
                    var product = (from u in db.Tbl_Product where u.ProductID == ProductId select u).First();
                    db.Tbl_Product.Remove(product);
                    db.SaveChanges();
                    gvListProduct.DataBind();
                    break;
                }
            }
        }
    }
}