//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CRM.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tbl_Ticket
    {
        public int TicketId { get; set; }
        public int UserID { get; set; }
        public int ProductID { get; set; }
        public string Messge { get; set; }
        public System.DateTime Date { get; set; }
        public int Pigiri { get; set; }
        public string ReplayMassge { get; set; }
    
        public virtual Tbl_Product Tbl_Product { get; set; }
        public virtual Tbl_User Tbl_User { get; set; }
    }
}