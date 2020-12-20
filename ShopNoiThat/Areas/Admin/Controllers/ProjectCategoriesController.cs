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
    public class ProjectCategoriesController : Controller
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();

        // GET: Admin/ProjectCategories
        public ActionResult Index()
        {
            return View(db.ProjectCategories.ToList());
        }

        // GET: Admin/ProjectCategories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProjectCategory projectCategory = db.ProjectCategories.Find(id);
            if (projectCategory == null)
            {
                return HttpNotFound();
            }
            return View(projectCategory);
        }

        // GET: Admin/ProjectCategories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/ProjectCategories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Title,MetaTitle,Status")] ProjectCategory projectCategory)
        {
            if (ModelState.IsValid)
            {
                projectCategory.MetaTitle= ConvertToSEO.Convert(projectCategory.Title);
                db.ProjectCategories.Add(projectCategory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(projectCategory);
        }

        // GET: Admin/ProjectCategories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProjectCategory projectCategory = db.ProjectCategories.Find(id);
            if (projectCategory == null)
            {
                return HttpNotFound();
            }
            return View(projectCategory);
        }

        // POST: Admin/ProjectCategories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Title,MetaTitle,Status")] ProjectCategory projectCategory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(projectCategory).State = EntityState.Modified;
                projectCategory.MetaTitle = ConvertToSEO.Convert(projectCategory.Title);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(projectCategory);
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {

            ProjectCategory projectCategory = db.ProjectCategories.Find(id);
            db.ProjectCategories.Remove(projectCategory);
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
