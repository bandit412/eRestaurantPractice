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
    [Table("BillItems")]
    public class BillItem
    {
        [Key]
        [Column(Order = 1)]
        public int BillID { get; set; }
        [Key]
        [Column(Order = 2)]
        public int ItemID { get; set; }
        [Range(0, int.MaxValue, ErrorMessage = "Quantity for a new item must be greater than or equal to zero")]
        public int Quantity { get; set; }
        [Range(0.00, double.MaxValue, ErrorMessage = "Sale Price must be greater than or equal to 0.00")]
        public decimal SalePrice { get; set; }
        [Range(0.00, double.MaxValue, ErrorMessage = "Unit Cost must be greater than or equal to 0.00")]
        public decimal UnitCost { get; set; }
        public string Notes { get; set; }

        // Naviagtion Properties
        public virtual Bill Bills { get; set; }
        public virtual Item Items { get; set; }
    }
}
