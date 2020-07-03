using System.Collections.Generic;

namespace PromotionEngine.Models
{
    public class PromotionFormulaRequestModel
    {
        public PromotionFormulaRequestModel()
        {
            PromotionFormulas = new List<FormulaRequestModel>();
        } 
        public string PromotionName { get; set; }

        public List<FormulaRequestModel> PromotionFormulas { get; set; }
    }
}