using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopNoiThat.Controllers
{
    public class NewsController : Controller
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();
        public ActionResult Index(int? page = 1)
        {
            var news = db.Newses.OrderByDescending(x => x.CreatedDate).ToList();
            int pageSize = 7;
            int pageNumber = (page ?? 1);
            ViewBag.Category = db.Categories.Where(x => x.Status == true).OrderBy(x => x.Order).ToList();
            ViewBag.NewProduct = db.Products.OrderByDescending(x => x.CreatedDate).Take(5).ToList();
            ViewBag.News = db.Newses.OrderByDescending(x => x.CreatedDate).Take(5).ToList();
            return View(news.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Category(long id,int? page = 1)
        {
            var news = db.Newses.Where(x=>x.CategoryID==id).OrderByDescending(x => x.CreatedDate).ToList();
            int pageSize = 7;
            int pageNumber = (page ?? 1);
            ViewBag.CategoryName = db.Categories.Find(id).Title;
            ViewBag.Category = db.Categories.Where(x => x.Status == true).OrderBy(x => x.Order).ToList();
            ViewBag.NewProduct = db.Products.OrderByDescending(x => x.CreatedDate).Take(5).ToList();
            ViewBag.News = db.Newses.OrderByDescending(x => x.CreatedDate).Take(5).ToList();
            return View(news.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult DetailNews(long id)
        {
            ViewBag.Category = db.Categories.Where(x => x.Status == true).OrderBy(x => x.Order).ToList();
            ViewBag.NewProduct = db.Products.OrderByDescending(x => x.CreatedDate).Take(5).ToList();
            ViewBag.News = db.Newses.OrderByDescending(x => x.CreatedDate).Take(5).ToList();
            return View(db.Newses.Find(id));
        }
    }
}