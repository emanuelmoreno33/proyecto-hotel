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
    
    public partial class RoomPromo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RoomPromo()
        {
            this.Reservation = new HashSet<Reservation>();
        }
    
        public int roomPromoID { get; set; }
        public int promoID { get; set; }
        public int roomTypeID { get; set; }
        public double discount { get; set; }
    
        public virtual Promo Promo { get; set; }
        public virtual RoomType RoomType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reservation> Reservation { get; set; }
    }
}
