using PromotionEngine.Business;
using PromotionEngine.DataModel;
using PromotionEngine.Models;
using System.Linq;
using System.Web.Http;

namespace PromotionEngine.Controllers
{
    public class PromotionController : ApiController
    {

        [Route("api/ApplyPromotion")]
        [HttpPost]
        public PromotionResponseModel ApplyPromotion(PromotionRequestModel request)
        {
            PromotionResponseModel response = new PromotionResponseModel();
            PromotionBusiness promotionBusiness = new PromotionBusiness();

            response.TotalCost = 0;
            //Retrieve SKU Promotion data from database 
            response.PromotionApplied = promotionBusiness.GetPromotion(request.PromotionId); 

            using (PromotionEngineEntities query = new PromotionEngineEntities())
            {
                //Retrieve SKU price from databse 
                var dbItems = (from cartItems in request.CartItems
                                   join items in query.Items
                                   on cartItems.ItemName equals items.ItemName
                                   select new { cartItems.ItemQty, items.ItemName, items.ItemPrice }).ToList();

                foreach(FormulaResponseModel formula in response.PromotionApplied.PromotionFormulas)
                {
                    string[] formulaItemNames =  formula.ItemNames.Split('&');

                    //Logic to calculate the purchase of 'n' items of a SKU for a fixed price
                    if(formulaItemNames.Length>0 && formulaItemNames.Length == 1)
                    {
                        foreach(var dbitem in dbItems)
                        {
                            if(dbitem.ItemName == formulaItemNames.Single())
                            {
                                response.TotalCost += (((dbitem.ItemQty - (dbitem.ItemQty % formula.ItemQty)) / (formula.ItemQty)) * formula.PromotionValue) +
                                ((dbitem.ItemQty % formula.ItemQty) * dbitem.ItemPrice);
                            }
                        }
                    }

                    //Logic to calculate the purchase of SKU 1 & SKU 2 ,.SKU 'n' for a fixed price 
                    else if (formulaItemNames.Length>1)
                    {
                        var filteredDBItems = (from filtereddbItems in dbItems
                                             join filter in formulaItemNames
                                            on filtereddbItems.ItemName equals filter
                                            select new { filtereddbItems.ItemQty, filtereddbItems.ItemName, filtereddbItems.ItemPrice }).ToList();

                        if (formulaItemNames.Length == filteredDBItems.Count())
                        {
                            int itemsFixedPrice = filteredDBItems.Min(q => q.ItemQty);

                            response.TotalCost += itemsFixedPrice * formula.PromotionValue;

                            foreach (var item in filteredDBItems)
                            {
                                response.TotalCost += ((item.ItemQty - itemsFixedPrice) * item.ItemPrice);
                            }
                        }
                        else
                        {
                            foreach(var item in filteredDBItems)
                            {
                                response.TotalCost += (item.ItemQty * item.ItemPrice);
                            }
                        }    

                    }
                }
            }
            
            return response;
        }

        [Route("api/GetPromotion/{promotionId}")]
        [HttpGet]
        public PromotionFormulaResponseModel GetPromotion(int promotionId)
        {
            PromotionBusiness promotionBusiness = new PromotionBusiness();
            //Retrieve SKU Promotion data from database 
            return promotionBusiness.GetPromotion(promotionId);
        }

        [Route("api/AddPromotion")]
        [HttpPost]
        public PromotionFormulaResponseModel AddPromotion(PromotionFormulaRequestModel request)
        {
            PromotionBusiness promotionBusiness = new PromotionBusiness();
            using (PromotionEngineEntities query = new PromotionEngineEntities())
            {
                Promotion promotion = new Promotion
                {
                    PromotionName = request.PromotionName
                };          
                                 
                foreach (FormulaRequestModel formula in request.PromotionFormulas)
                {
                    promotion.PromotionFormulas.Add(
                        new PromotionFormula
                        {
                            PromotionId = promotion.PromotionId,
                            ItemQty = formula.ItemQty,
                            ItemNames = formula.ItemNames,
                            PromotionValue = formula.PromotionValue,
                            FormulaDescription = formula.FormulaDescription,
                        }); 
                }

                query.Promotions.Add(promotion);
                query.SaveChanges();

                //Retrieve SKU Promotion data from database 
                return promotionBusiness.GetPromotion(promotion.PromotionId);
            }
            
        }
    }
}
