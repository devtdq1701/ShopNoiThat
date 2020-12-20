using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;

namespace ShopNoiThat.Controllers
{
    public class ProductController : Controller
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();
        
        public ActionResult Detail(long id)
        {
            var model = db.Products.Find(id);
            // Tăng số lần xem
            model.ViewCount++;
            db.SaveChanges();

            var images = model.Images;
            XElement xImages;
            List<string> listImagesReturn = new List<string>();
            if (images == null)
            {
                listImagesReturn = null;
            }
            else
            {
                xImages = XElement.Parse(images);
                foreach (XElement element in xImages.Elements())
                {
                    listImagesReturn.Add(element.Value);
                }
            }
            ViewBag.Images = listImagesReturn;
            ViewBag.SameProducts = db.Products.Where(x => x.CategoryID == model.CategoryID && x.ID != id).OrderByDescending(x => x.CreatedDate).ToList();
            var Category = db.ProductCategories.Find(model.CategoryID);
            ViewBag.CategoryName = Category.Title;
            ViewBag.Meta = Category.MetaTitle;
            ViewBag.Id = Category.ID;
            return View(model);
        }
        public ActionResult Search(string keyword,int? page = 1)
        {
            var products = db.Products.Where(x=>x.Title.Contains(keyword)).OrderByDescending(x=>x.CreatedDate);
            int pageSize = 12;
            int pageNumber = (page ?? 1);
            ViewBag.totalRecord = products.Count();
            ViewBag.Keyword = keyword;
            if (String.IsNullOrEmpty(keyword))
            {
                ViewBag.totalRecord = 0;
            }
            return View(products.ToPagedList(pageNumber, pageSize));
        }
    }
}