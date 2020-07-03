using PromotionEngine.DataModel;
using PromotionEngine.Models;
using System.Linq;

namespace PromotionEngine.Business
{
    public class PromotionBusiness
    {
        public PromotionFormulaResponseModel GetPromotion(int promotionId)
        {
            PromotionFormulaResponseModel promotionFormulaResponseModel = new PromotionFormulaResponseModel();

            using (PromotionEngineEntities query = new PromotionEngineEntities())
            {
                Promotion promotion = query.Promotions.Where(promo => promo.PromotionId == promotionId).SingleOrDefault();
                promotionFormulaResponseModel.PromotionId = promotion.PromotionId;
                promotionFormulaResponseModel.PromotionName = promotion.PromotionName;

                foreach (PromotionFormula formula in promotion.PromotionFormulas)
                {
                    promotionFormulaResponseModel.PromotionFormulas.Add(new FormulaResponseModel
                    {
                        PromotionId = formula.PromotionId,
                        PromotionFormulaId = formula.PromotionFormulaId,
                        PromotionValue = formula.PromotionValue,
                        ItemNames = formula.ItemNames,
                        ItemQty = formula.ItemQty,
                        FormulaDescription = formula.FormulaDescription
                    });
                }
            }

            return promotionFormulaResponseModel;
        }
    }
}