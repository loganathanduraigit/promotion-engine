using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace PromotionEngine.Models
{
    public class PromotionRequestModel
    {
        public PromotionRequestModel()
        {
            CartItems = new List<CartItemModel>();
        }

        [Required]
        public int PromotionId { get; set; }

        [Required]
        public List<CartItemModel> CartItems { get; set; }
    }
 
}