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
    public class ProjectsController : BaseController
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();

        // GET: Admin/Projects
        public ActionResult Index()
        {
            var projects = db.Projects.Include(p => p.ProjectCategory);
            return View(projects.ToList());
        }

        // GET: Admin/Projects/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Project project = db.Projects.Find(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            return View(project);
        }

        // GET: Admin/Projects/Create
        public ActionResult Create()
        {
            ViewBag.CategoryID = new SelectList(db.ProjectCategories, "ID", "Title");
            return View();
        }

        // POST: Admin/Projects/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "ID,Title,MetaTitle,ShortDesc,Image,Content,CreatedDate,CreatedBy,UpdatedDate,UpdatedBy,Status,CategoryID")] Project project)
        {
            if (ModelState.IsValid)
            {
                DateTime now = DateTime.Now;
                project.CreatedDate = now;
                project.CreatedBy = Session[CommonConstants.USER_SESSION].ToString();
                project.MetaTitle = ConvertToSEO.Convert(project.Title);
                db.Projects.Add(project);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryID = new SelectList(db.ProjectCategories, "ID", "Title", project.CategoryID);
            return View(project);
        }

        // GET: Admin/Projects/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Project project = db.Projects.Find(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryID = new SelectList(db.ProjectCategories, "ID", "Title", project.CategoryID);
            return View(project);
        }

        // POST: Admin/Projects/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "ID,Title,MetaTitle,ShortDesc,Image,Content,CreatedDate,CreatedBy,UpdatedDate,UpdatedBy,Status,CategoryID")] Project project)
        {
            if (ModelState.IsValid)
            {
                db.Entry(project).State = EntityState.Modified;
                DateTime now = DateTime.Now;
                project.UpdatedDate = now;
                project.UpdatedBy = Session[CommonConstants.USER_SESSION].ToString();
                project.MetaTitle = ConvertToSEO.Convert(project.Title);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryID = new SelectList(db.ProjectCategories, "ID", "Title", project.CategoryID);
            return View(project);
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {

            Project project = db.Projects.Find(id);
            db.Projects.Remove(project);
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
