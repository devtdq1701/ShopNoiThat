using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Model.EF;

namespace ShopNoiThat.Areas.Admin.Controllers
{
    public class BannersController : BaseController
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();

        // GET: Admin/Banners
        public ActionResult Index()
        {
            var banners = db.Banners.Include(b => b.BannerGroup);
            return View(banners.ToList());
        }

        // GET: Admin/Banners/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Banner banner = db.Banners.Find(id);
            if (banner == null)
            {
                return HttpNotFound();
            }
            return View(banner);
        }

        // GET: Admin/Banners/Create
        public ActionResult Create()
        {
            ViewBag.Type = new SelectList(db.BannerGroups.Where(x=>x.ParentID.HasValue && x.Status==true), "ID", "Title");
            return View();
        }

        // POST: Admin/Banners/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Title,Link,Type,Status,Image")] Banner banner)
        {
            if (ModelState.IsValid)
            {
                db.Banners.Add(banner);
                db.SaveChanges();
                SetAlert("Thêm banner thành công", "success");
                return RedirectToAction("Index");
            }

            ViewBag.Type = new SelectList(db.BannerGroups.Where(x => x.ParentID.HasValue && x.Status == true), "ID", "Title");
            return View(banner);
        }

        // GET: Admin/Banners/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Banner banner = db.Banners.Find(id);
            if (banner == null)
            {
                return HttpNotFound();
            }
            ViewBag.Type = new SelectList(db.BannerGroups.Where(x => x.ParentID.HasValue && x.Status == true), "ID", "Title");
            return View(banner);
        }

        // POST: Admin/Banners/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Title,Link,Type,Status,Image")] Banner banner)
        {
            if (ModelState.IsValid)
            {
                db.Entry(banner).State = EntityState.Modified;
                SetAlert("Sửa banner thành công", "success");
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Type = new SelectList(db.BannerGroups.Where(x => x.ParentID.HasValue && x.Status == true), "ID", "Title");
            return View(banner);
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {

            Banner banner = db.Banners.Find(id);
            db.Banners.Remove(banner);
            db.SaveChanges();
            SetAlert("Xoá banner thành công", "success");
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
