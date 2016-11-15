using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel;
using eRestaurantSystem.Data.Entities;
using eRestaurantSystem.Data.POCOs;
using eRestaurantSystem.Data.DTOs;
using eRestaurantSystem.DAL;
#endregion

namespace eRestaurantSystem.BLL
{
    [DataObject]
    public class ItemsController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<MenuCategoryFoodItemsDTO> MenuCategoryFoodItems_GetDTO()
        {
            using (var context = new eRestaurantContext())
            {
                var results = from food in context.Items
                              group food by new { food.MenuCategory.Description } into tempdataset
                              select new MenuCategoryFoodItemsDTO
                              {
                                  MenuCategoryDescription = tempdataset.Key.Description,
                                  FoodItems = (from x in tempdataset
                                               select new MenuCategoryFoodItemsPOCO
                                               {
                                                   ItemID = x.ItemID,
                                                   FoodDescription = x.Description,
                                                   CurrentPrice = x.CurrentPrice,
                                                   TimesServed = x.BillItems.Count()
                                               }).ToList()
                              };
                return results.ToList();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<MenuCategoryFoodItemsPOCO> MenuCategoryFoodItems_GetPOCO()
        {
            using (var context = new eRestaurantContext())
            {
                var results = from food in context.Items
                              orderby food.MenuCategory.Description
                              select new MenuCategoryFoodItemsPOCO
                              {
                                  MenuCatgegoryDescription = food.MenuCategory.Description,
                                  ItemID = food.ItemID,
                                  FoodDescription = food.Description,
                                  CurrentPrice = food.CurrentPrice,
                                  TimesServed = food.BillItems.Count()
                              };
                return results.ToList();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<CategoryMenuItems> CategoryMenuItems_GetPOCO()
        {
            using (var context = new eRestaurantContext())
            {
                var results = from cat in context.Items
                              orderby cat.MenuCategory.Description, cat.Description
                              select new CategoryMenuItems
                              {
                                  CategoryDescription = cat.MenuCategory.Description,
                                  ItemDescription = cat.Description,
                                  Price = cat.CurrentPrice,
                                  Calories = cat.Calories,
                                  Comment = cat.Comment
                              };

                return results.ToList(); // this was .Dump() in Linqpad
            }
        }
    }
}
