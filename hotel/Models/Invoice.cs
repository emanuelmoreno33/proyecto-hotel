
//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------


namespace hotel.Models
{

using System;
    using System.Collections.Generic;
    
public partial class Invoice
{

    public int invoiceID { get; set; }

    public int reservationID { get; set; }

    public int guestID { get; set; }

    public System.DateTime dateTime { get; set; }

    public decimal subtotal { get; set; }

    public decimal discount { get; set; }

    public decimal tax { get; set; }

    public decimal totalDue { get; set; }



    public virtual Guest Guest { get; set; }

    public virtual Reservation Reservation { get; set; }

}

}
