
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
    
public partial class RoomAmenity
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public RoomAmenity()
    {

        this.AmenityComplaint = new HashSet<AmenityComplaint>();

        this.AmenityReview = new HashSet<AmenityReview>();

    }


    public int amenityID { get; set; }

    public int reservationID { get; set; }

    public int serviceID { get; set; }

    public System.DateTime date { get; set; }



    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<AmenityComplaint> AmenityComplaint { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<AmenityReview> AmenityReview { get; set; }

    public virtual Reservation Reservation { get; set; }

    public virtual Service Service { get; set; }

}

}
