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
    
    public partial class Tbl_Product
    {
        public Tbl_Product()
        {
            this.Tbl_Ticket = new HashSet<Tbl_Ticket>();
        }
    
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public System.DateTime Date { get; set; }
        public string Company { get; set; }
        public string Note { get; set; }
    
        public virtual ICollection<Tbl_Ticket> Tbl_Ticket { get; set; }
    }
}