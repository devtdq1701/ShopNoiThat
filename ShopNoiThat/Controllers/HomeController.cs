using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopNoiThat.Controllers
{
    public class HomeController : Controller
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();
        public ActionResult Index()
        {
            return View();
        }
        [ChildActionOnly]
        public ActionResult MainMenuMobile()
        {
            return PartialView(db.ProductCategories.Where(x => x.Status == true && x.ParentID==null).OrderBy(x => x.Order).ToList());
        }
        [ChildActionOnly]
        public ActionResult MainMenu()
        {
            return PartialView(db.ProductCategories.Where(x => x.Status == true).OrderBy(x => x.Order).ToList());
        }
        [ChildActionOnly]
        public ActionResult Brand()
        {
            return PartialView(db.Logoes.Where(x => x.Status == true).ToList());
        }
        [ChildActionOnly]
        public ActionResult News()
        {
            return PartialView(db.Newses.Where(x => x.Status == true).OrderByDescending(x=>x.CreatedDate).ToList());
        }
        [ChildActionOnly]
        public ActionResult Project()
        {
            ViewBag.LastProject = db.Projects.Where(x => x.Status == true).OrderByDescending(x => x.CreatedDate).Take(1).ToList();
            return PartialView(db.Projects.Where(x => x.Status == true).OrderBy(x => x.CreatedDate).Take(3).ToList());
        }
        [ChildActionOnly]
        public ActionResult Product()
        {
            ViewBag.NewestProduct = db.Products.Where(x=>x.Quantity>0).OrderByDescending(x => x.CreatedDate).Take(12).ToList();
            ViewBag.ViewedestProduct = db.Products.Where(x => x.Quantity > 0).OrderByDescending(x => x.ViewCount).Take(12).ToList();
            return PartialView();
        }
        [ChildActionOnly]
        public ActionResult SlideTop()
        {
            return PartialView(db.Banners.Where(x=>x.Type==1 && x.Status==true).ToList());
        }
        [ChildActionOnly]
        public ActionResult SlideMid()
        {
            ViewBag.Truoc=db.Banners.Where(x => x.Type == 3 && x.Status == true).OrderBy(x=>x.ID).ToList();
            ViewBag.Giua = db.Banners.Where(x => x.Type == 4 && x.Status == true).OrderBy(x => x.ID).ToList();
            ViewBag.Sau = db.Banners.Where(x => x.Type == 5 && x.Status == true).OrderBy(x => x.ID).ToList();
            return PartialView();
        }
    }
}