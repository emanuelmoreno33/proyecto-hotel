
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
    
public partial class Bonification
{

    public int bonificationID { get; set; }

    public int employeeID { get; set; }

    public int typeOfBonificationID { get; set; }



    public virtual Employee Employee { get; set; }

    public virtual TypeOfBonification TypeOfBonification { get; set; }

}

}
