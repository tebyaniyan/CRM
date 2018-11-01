using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Models;

namespace CRM.Admin
{
    public partial class Ticket : System.Web.UI.Page
    {
        Models.ManegmentProductCRMEntities db = new ManegmentProductCRMEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "مدیریت تیکت ها";
        }

        protected void dsListTicket_OnSelecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from u in db.Tbl_Ticket
                        orderby u.Date descending
                        select new
                        {
                            u.TicketId,
                            u.Tbl_Product.ProductName,
                            u.Tbl_User.Family,
                            u.Messge,

                            u.Date,
                        }).ToList();
        }

        protected void dvListTicket_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "DoReplay":
                    {
                        int ticketid = int.Parse(e.CommandArgument.ToString());
                        var ticket = db.Tbl_Ticket.First(t => t.TicketId == ticketid);
                        txtName.Text = ticket.Tbl_User.Family;
                        txtProductName.Text = ticket.Tbl_Product.ProductName;
                        txtMassge.Text = ticket.Messge;
                        txtDate.Text = ticket.Date.ToString("yyyy/MM/dd");
                        ViewState["ticketid"] = ticketid;
                        mvListticket.SetActiveView(vwReplay);
                        break;
                    }
            }

        }

        protected void btnSend_OnClick(object sender, EventArgs e)
        {
            int ticketid = int.Parse(ViewState["ticketid"].ToString());
            var ticket = db.Tbl_Ticket.First(tt => tt.TicketId == ticketid);
            ticket.ReplayMassge = txtReplay.Text;
            db.SaveChanges();
            Response.Redirect(Request.UrlReferrer.AbsolutePath);
        }
    }
}