using Microsoft.VisualStudio.TestTools.UnitTesting;
using PromotionEngine.Controllers;
using PromotionEngine.Models;

namespace PromotionEngine.Tests
{
    [TestClass]
    public class PromotionTest
    {
        [TestMethod]
        public void ScenarioA()
        {
            PromotionController promotionController = new PromotionController();

            PromotionRequestModel request = new PromotionRequestModel();
            PromotionResponseModel response = new PromotionResponseModel();

            request.PromotionId = 1;

            request.CartItems.Add(
                new CartItemModel
                {
                    ItemName = "A",
                    ItemQty = 1
                });

            request.CartItems.Add(new CartItemModel
            {
                ItemName = "B",
                ItemQty = 1
            });

            request.CartItems.Add(new CartItemModel
            {
                ItemName = "C",
                ItemQty = 1
            });

            response = promotionController.ApplyPromotion(request);

            Assert.AreEqual(100, response.TotalCost);

        }
        [TestMethod]
        public void ScenarioB()
        {
            PromotionController promotionController = new PromotionController();

            PromotionRequestModel request = new PromotionRequestModel();
            PromotionResponseModel response = new PromotionResponseModel();

            request.PromotionId = 1;

            request.CartItems.Add(
                new CartItemModel
                {
                    ItemName = "A",
                    ItemQty = 5
                });

            request.CartItems.Add(new CartItemModel
            {
                ItemName = "B",
                ItemQty = 5
            });

            request.CartItems.Add(new CartItemModel
            {
                ItemName = "C",
                ItemQty = 1
            });
             
            response = promotionController.ApplyPromotion(request);

            Assert.AreEqual(370, response.TotalCost);

        }
        [TestMethod]
        public void ScenarioC()
        {
            PromotionController promotionController = new PromotionController();

            PromotionRequestModel request = new PromotionRequestModel();
            PromotionResponseModel response = new PromotionResponseModel();

            request.PromotionId = 1;

            request.CartItems.Add(
                new CartItemModel
                {
                    ItemName = "A",
                    ItemQty = 3
                });

            request.CartItems.Add(new CartItemModel
            {
                ItemName = "B",
                ItemQty = 5
            });

            request.CartItems.Add(new CartItemModel
            {
                ItemName = "C",
                ItemQty = 1
            });

            request.CartItems.Add(new CartItemModel
            {
                ItemName = "D",
                ItemQty = 1
            });

            response = promotionController.ApplyPromotion(request);

            Assert.AreEqual(280, response.TotalCost);

        } 
    }
}
