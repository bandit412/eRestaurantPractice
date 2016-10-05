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
    [Table("Tables")]
    public class Table
    {
        [Key]
        public int TableID { get; set; }
        [Required(ErrorMessage = "Table Number is required")]
        [Range(1, 25, ErrorMessage = "Table Number must be a positive number")]
        public int TableNumber { get; set; }
        public bool Smoking { get; set; }
        [Range(2, 8, ErrorMessage = "Minimum of 1, and a maximum of 8, people per table.")]
        public int Capacity { get; set; }
        public bool Available { get; set; }

        // Navigation Properties
        public virtual ICollection<Bill> Bills { get; set; }
        public virtual ICollection<Reservation> Reservations { get; set; }

        // Make a new table available
        public Table()
        {
            Available = true;
        }
    }
}
