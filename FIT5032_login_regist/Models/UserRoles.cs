//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FIT5032_login_regist.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserRoles
    {
        public string UserId { get; set; }
        public string RoleId { get; set; }
    
        public virtual Admin Admin { get; set; }
        public virtual Customer Customer { get; set; }
    }
}
