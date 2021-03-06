
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
    
public partial class Guest
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Guest()
    {

        this.Reservation = new HashSet<Reservation>();

    }


    public int guestID { get; set; }

    public string name { get; set; }

    public string lastName { get; set; }

    public string address { get; set; }

    public System.DateTime DOB { get; set; }

    public string sex { get; set; }

    public string housePhone { get; set; }

    public string cellPhone { get; set; }

    public string email { get; set; }

    public string RFC { get; set; }

    public string placeOfOrigin { get; set; }

    public Nullable<int> cityID { get; set; }



    public virtual City City { get; set; }

    public virtual PlaceOfOrigin PlaceOfOrigin1 { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Reservation> Reservation { get; set; }

}

}
