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
    public class BannerGroupsController : BaseController
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();

        // GET: Admin/BannerGroups
        public ActionResult Index()
        {
            return View(db.BannerGroups.ToList());
        }

        // GET: Admin/BannerGroups/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BannerGroup bannerGroup = db.BannerGroups.Find(id);
            if (bannerGroup == null)
            {
                return HttpNotFound();
            }
            return View(bannerGroup);
        }

        // GET: Admin/BannerGroups/Create
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        // POST: Admin/BannerGroups/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Title,Status,ParentID")] BannerGroup bannerGroup)
        {
            if (ModelState.IsValid)
            {
                db.BannerGroups.Add(bannerGroup);
                db.SaveChanges();
                SetAlert("Thêm loại banner thành công", "success");
                return RedirectToAction("Index");
            }
            SetViewBag();
            return View(bannerGroup);
        }

        // GET: Admin/BannerGroups/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BannerGroup bannerGroup = db.BannerGroups.Find(id);
            if (bannerGroup == null)
            {
                return HttpNotFound();
            }
            SetViewBag(id);
            return View(bannerGroup);
        }

        // POST: Admin/BannerGroups/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Title,Status,ParentID")] BannerGroup bannerGroup)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bannerGroup).State = EntityState.Modified;
                db.SaveChanges();
                SetAlert("Sửa loại banner thành công", "success");
                return RedirectToAction("Index");
            }
            SetViewBag(bannerGroup.ID);
            return View(bannerGroup);
        }

        // GET: Admin/BannerGroups/Delete/5
        [HttpDelete]
        public ActionResult Delete(int id)
        {

            BannerGroup bannerGroup = db.BannerGroups.Find(id);
            db.BannerGroups.Remove(bannerGroup);
            db.SaveChanges();
            SetAlert("Xoá loại banner thành công", "success");
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
        public void SetViewBag(int? selectedID = null)
        {
            ViewBag.ParentID = new SelectList(db.BannerGroups.Where(x => x.Status == true && x.ParentID == null).ToList(), "ID", "Title", selectedID);

        }
    }
}
