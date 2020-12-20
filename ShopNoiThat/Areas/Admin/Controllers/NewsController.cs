using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using ShopNoiThat.Common;

namespace ShopNoiThat.Areas.Admin.Controllers
{
    public class NewsController : Controller
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();

        // GET: Admin/News
        public ActionResult Index()
        {
            var newses = db.Newses.Include(n => n.Category);
            return View(newses.ToList());
        }

        // GET: Admin/News/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.Newses.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // GET: Admin/News/Create
        public ActionResult Create()
        {
            ViewBag.CategoryID = new SelectList(db.Categories.Where(x => x.Status == true), "ID", "Title");
            return View();
        }

        // POST: Admin/News/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "ID,Title,ShortDesc,MetaTitle,ContentHtml,Image,CreatedDate,CreatedBy,UpdatedDate,UpdatedBy,CategoryID,ViewCount,Status")] News news)
        {
            if (ModelState.IsValid)
            {
                DateTime now = DateTime.Now;
                news.CreatedDate = now;
                news.CreatedBy = Session[CommonConstants.USER_SESSION].ToString();
                news.MetaTitle = ConvertToSEO.Convert(news.Title);
                news.ViewCount = 0;
                db.Newses.Add(news);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryID = new SelectList(db.Categories.Where(x=>x.Status==true), "ID", "Title", news.CategoryID);
            return View(news);
        }

        // GET: Admin/News/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.Newses.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryID = new SelectList(db.Categories.Where(x => x.Status == true), "ID", "Title", news.CategoryID);
            return View(news);
        }

        // POST: Admin/News/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "ID,Title,ShortDesc,MetaTitle,ContentHtml,Image,CreatedDate,CreatedBy,UpdatedDate,UpdatedBy,CategoryID,ViewCount,Status")] News news)
        {
            if (ModelState.IsValid)
            {
                db.Entry(news).State = EntityState.Modified;
                DateTime now = DateTime.Now;
                news.UpdatedDate = now;
                news.UpdatedBy = Session[CommonConstants.USER_SESSION].ToString();
                news.MetaTitle = ConvertToSEO.Convert(news.Title);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryID = new SelectList(db.Categories.Where(x => x.Status == true), "ID", "Title", news.CategoryID);
            return View(news);
        }

        [HttpDelete]
        public ActionResult Delete(long id)
        {

            News news = db.Newses.Find(id);
            db.Newses.Remove(news);
            db.SaveChanges();
            return Json(new { Success = true });
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
