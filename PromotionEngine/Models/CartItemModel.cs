using System.ComponentModel.DataAnnotations;

namespace PromotionEngine.Models
{
    public class CartItemModel
    {
        [Required]
        public string ItemName { get; set; }
        [Required]
        public int ItemQty { get; set; }
    }
}