using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Models;

namespace CRM.User
{
    public partial class SendTicket : System.Web.UI.Page
    {
        Models.ManegmentProductCRMEntities db = new Models.ManegmentProductCRMEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            //بدست اوردن کاربر انلاین
            int userid = int.Parse(Page.User.Identity.Name);
            var user = db.Tbl_User.First(u => u.UserID == userid);
            Page.Title = "خوش آمدید" + " " + user.Username;
        }
        protected void dsShowListUser_OnSelecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            int userid = int.Parse(Page.User.Identity.Name);
            e.Result = (from u in db.Tbl_Ticket
                        where u.UserID == userid
                        select new
                        {
                            u.TicketId,
                            u.UserID,
                            u.ProductID,
                            u.Tbl_Product.ProductName,
                            u.Tbl_Product.Company,
                            u.Date,
                            u.Messge,
                            u.Tbl_User.Family,
                            u.ReplayMassge,

                        }).ToList();
        }

        protected void btnSendTiket_OnClick(object sender, EventArgs e)
        {
            //شماره پیگیری
            Random rnd = new Random();
            int a = rnd.Next(0, 999999999);
            //---
            int userid = int.Parse(Page.User.Identity.Name);
            db.Tbl_Ticket.Add(new Tbl_Ticket()
            {
                ProductID = int.Parse(ddlProduct.SelectedValue),
                Date = DateTime.Now,
                UserID = userid,
                Messge = txtMassge.Text,
                Pigiri = a,
            });
            db.SaveChanges();
            lblPigiri.Text = "شماره پیگیری" + " " + a.ToString();
            mvListTicket.SetActiveView(vwPigiri);

        }

        protected void btnAddTicket_OnClick(object sender, EventArgs e)
        {
            mvListTicket.SetActiveView(vwSendTicket);
        }
    }
}