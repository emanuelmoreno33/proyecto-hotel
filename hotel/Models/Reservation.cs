
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
    
public partial class Reservation
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Reservation()
    {

        this.GuestCompanion = new HashSet<GuestCompanion>();

        this.Invoice = new HashSet<Invoice>();

        this.ReservationComplaint = new HashSet<ReservationComplaint>();

        this.ReservationReview = new HashSet<ReservationReview>();

        this.RoomAmenity = new HashSet<RoomAmenity>();

    }


    public int reservationID { get; set; }

    public int guestID { get; set; }

    public int roomID { get; set; }

    public System.DateTime startDate { get; set; }

    public System.DateTime endDate { get; set; }

    public int reservationStatusID { get; set; }

    public int reservedFromID { get; set; }

    public int employeeID { get; set; }

    public Nullable<int> roomPackageID { get; set; }

    public Nullable<int> roomPromoID { get; set; }



    public virtual Employee Employee { get; set; }

    public virtual Guest Guest { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<GuestCompanion> GuestCompanion { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Invoice> Invoice { get; set; }

    public virtual ReservationStatus ReservationStatus { get; set; }

    public virtual ReservedFrom ReservedFrom { get; set; }

    public virtual Room Room { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<ReservationComplaint> ReservationComplaint { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<ReservationReview> ReservationReview { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<RoomAmenity> RoomAmenity { get; set; }

    public virtual RoomPackage RoomPackage { get; set; }

    public virtual RoomPromo RoomPromo { get; set; }

}

}
