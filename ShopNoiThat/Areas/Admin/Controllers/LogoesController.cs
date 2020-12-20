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
    public class LogoesController : BaseController
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();

        // GET: Admin/Logoes
        public ActionResult Index()
        {
            return View(db.Logoes.ToList());
        }

        // GET: Admin/Logoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Logo logo = db.Logoes.Find(id);
            if (logo == null)
            {
                return HttpNotFound();
            }
            return View(logo);
        }

        // GET: Admin/Logoes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Logoes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Image,Title,Status")] Logo logo)
        {
            if (ModelState.IsValid)
            {
                db.Logoes.Add(logo);
                db.SaveChanges();
                SetAlert("Thêm thương hiệu thành công", "success");
                return RedirectToAction("Index");
            }

            return View(logo);
        }

        // GET: Admin/Logoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Logo logo = db.Logoes.Find(id);
            if (logo == null)
            {
                return HttpNotFound();
            }
            return View(logo);
        }

        // POST: Admin/Logoes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Image,Title,Status")] Logo logo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(logo).State = EntityState.Modified;
                db.SaveChanges();
                SetAlert("Sửa nhãn hàng thành công", "success");
                return RedirectToAction("Index");
            }
            return View(logo);
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {

            Logo logo = db.Logoes.Find(id);
            db.Logoes.Remove(logo);
            db.SaveChanges();
            SetAlert("Xoá nhãn hàng thành công", "success");
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
