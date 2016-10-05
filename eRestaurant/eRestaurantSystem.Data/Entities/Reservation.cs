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
    public class Reservation
    {
        public int ReservationID { get; set; }

        [Required]
        [StringLength(40)]
        public string CustomerName { get; set; }
        public DateTime ReservationDate { get; set; }
        [Range(1, 16)]
        public int NumberInParty { get; set; }
        [StringLength(15)]
        public string ContactPhone { get; set; }
        // TODO: (in BLL) Validate acceptable values using constants above
        [Required, StringLength(1, MinimumLength = 1)]
        public string ReservationStatus { get; set; }
        [StringLength(1)]
        public string EventCode { get; set; }

        public virtual SpecialEvent Event { get; set; }
        public virtual ICollection<Table> Tables { get; set; }
    }
}
