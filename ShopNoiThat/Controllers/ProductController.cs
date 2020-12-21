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
        public ActionResult Category(long id, string sortOrder, int? page=1)
        {
            var products = from s in db.Products
                           select s;
            
            int pageSize = 18;
            int pageNumber = (page ?? 1);
            var Category = db.ProductCategories.Find(id);
            switch (sortOrder)
            {
                case "1":
                    products = db.Products.Where(x => x.CategoryID == id).OrderBy(x => x.Price);
                    break;
                case "2":
                    db.Products.Where(x => x.CategoryID == id).OrderByDescending(x => x.Price);
                    break;
                default:
                    products = db.Products.Where(x => x.CategoryID == id).OrderByDescending(x => x.CreatedDate);
                    break;
            }
            ViewBag.CurrentSort = sortOrder;
            ViewBag.Category = Category.Title;
            ViewBag.Meta = Category.MetaTitle;
            ViewBag.Id = id;
            ViewBag.Banner = Category.BannerImage;
            ViewBag.CatgoryList = db.ProductCategories.Where(x => x.ParentID == Category.ParentID && x.Status == true).ToList();
            return View(products.ToPagedList(pageNumber, pageSize));
        }
        public JsonResult RateProduct(Comment d)
        {
            var comment = new Comment();
            comment.Name = d.Name;
            comment.Email = d.Email;
            comment.Content = d.Content;
            comment.Mobile = d.Mobile;
            DateTime now = DateTime.Now;
            comment.SentDate = now;
            comment.Status = false;
            db.Comments.Add(comment);
            db.SaveChanges();
            return Json(new { Erros = true, Message = "QTV sẽ phê duyệt cmt của bạn sớm" });
        }
        public JsonResult BookOnline(BookOnlineCustomer d)
        {
            var bookOnlineCustomer = new BookOnlineCustomer();
            bookOnlineCustomer.FullName = d.FullName;
            bookOnlineCustomer.Email = d.Email;
            bookOnlineCustomer.Note = d.Note;
            bookOnlineCustomer.Mobile = d.Mobile;
            DateTime now = DateTime.Now;
            bookOnlineCustomer.SentDate = now;
            bookOnlineCustomer.Status = "Chưa xử lý";
            bookOnlineCustomer.Sex = d.Sex;
            bookOnlineCustomer.ProductID = d.ProductID;
            db.BookOnlineCustomers.Add(bookOnlineCustomer);
            db.SaveChanges();
            return Json(new { Erros = true, Title="Success", msg="Đặt hàng thành công, Chúng tôi sẽ liên hệ đến bạn sớm nhất"});
        }
        public JsonResult Registration(AdvisoryCustomer d)
        {
            var customer = new AdvisoryCustomer();
            customer.FullName = d.FullName;
            customer.Email = d.Email;
            customer.Note = d.Note;
            customer.Mobile = d.Mobile;
            DateTime now = DateTime.Now;
            customer.SentDate = now;
            customer.Status = "Chưa xử lý";
            customer.Sex = d.Sex;
            customer.ProductID = d.ProductID;
            db.AdvisoryCustomers.Add(customer);
            db.SaveChanges();
            return Json(new { Erros = true, Title = "Success", msg = "Chúng tôi sẽ liên hệ đến bạn sớm nhất" });
        }
    }
}