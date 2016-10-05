using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel;
using eRestaurantSystem.Data.Entities;
using eRestaurantSystem.Data.POCOs;
using eRestaurantSystem.DAL;
#endregion

namespace eRestaurantSystem.BLL
{
    [DataObject]
    public class WaiterController
    {
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<Waiter>WaiterList_All()
        {
            // setup for transactions
            using (var context = new eRestaurantContext())
            {
                return context.Waiters.ToList();
            }

        }

        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<WaiterContact> WaiterContacts_Get()
        {
            using (var context = new eRestaurantContext())
            {
                var results = from x in context.Waiters
                              orderby x.LastName ascending
                              select new WaiterContact
                              {
                                  Name = x.LastName + ", " + x.FirstName,
                                  Phone = x.Phone,
                                  Address = x.Address
                              };
                return results.ToList();
            }
        }
    }
}
