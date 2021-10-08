//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FIT5032_Ass.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Property
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Property()
        {
            this.Booking = new HashSet<Booking>();
        }
    
        public int Id { get; set; }
        public string type { get; set; }
        public double price { get; set; }
        public Nullable<double> discount { get; set; }
        public string address { get; set; }
        public string description { get; set; }
        public string AspNetUsersId { get; set; }
        public int AgencyId { get; set; }
    
        public virtual AspNetUsers AspNetUsers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Booking> Booking { get; set; }
        public virtual Agency Agency { get; set; }
        public virtual PropertySize PropertySize { get; set; }
    }
}
