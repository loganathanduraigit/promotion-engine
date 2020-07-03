namespace PromotionEngine.Models
{
    public class FormulaResponseModel
    {
        public int PromotionFormulaId { get; set; }
        public int PromotionId { get; set; }
        public int ItemQty { get; set; }
        public string ItemNames { get; set; }
        public int PromotionValue { get; set; }
        public string FormulaDescription { get; set; }
    }   
}