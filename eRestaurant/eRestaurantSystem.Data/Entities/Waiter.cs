using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
#endregion

namespace eRestaurantSystem.Data.Entities
{
    [Table("Waiters")]
    public class Waiter
    {
        [Key]
        public int WaiterID { get; set; }
        [Required(AllowEmptyStrings = false), StringLength(25)]
        public string FirstName { get; set; }
        [Required(AllowEmptyStrings = false), StringLength(35)]
        public string LastName { get; set; }
        [Required(AllowEmptyStrings = false), StringLength(15, MinimumLength = 4)]
        public string Phone { get; set; }
        [Required(AllowEmptyStrings = false), StringLength(30, MinimumLength = 8)]
        public string Address { get; set; }
        public DateTime HireDate { get; set; }
        public DateTime? ReleaseDate { get; set; } // Can be NULL
        // The following propertyu is NOT stored in the database
        [NotMapped]
        public string FullName { get { return FirstName + " " + LastName; } }

        // Navigation properties based on the navigation properties
        //   displayed in LinqPad
        public virtual ICollection<Bill> Bills { get; set; }
    }
}
