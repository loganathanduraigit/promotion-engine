using System.Collections.Generic;

namespace PromotionEngine.Models
{
    public class PromotionFormulaResponseModel
    {
        public PromotionFormulaResponseModel()
        {
            PromotionFormulas = new List<FormulaResponseModel>();
        }
        public int PromotionId { get; set; }
        public string PromotionName { get; set; }

        public List<FormulaResponseModel> PromotionFormulas { get; set; }
    }
}