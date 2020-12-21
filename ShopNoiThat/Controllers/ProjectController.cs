using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopNoiThat.Controllers
{
    public class ProjectController : Controller
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();
        public ActionResult Index()
        {
            ViewBag.ChungCu = db.Projects.Where(x => x.Status == true && x.CategoryID == 1).ToList();
            ViewBag.BietThu = db.Projects.Where(x => x.Status == true && x.CategoryID == 2).ToList();
            ViewBag.Team = db.Members.Where(x => x.Status == true).ToList();
            ViewBag.News = db.Newses.OrderByDescending(x => x.CreatedDate).Take(5).ToList();
            return View();
        }
        public ActionResult DetailProject(int id)
        {
            var project = db.Projects.Find(id);
            ViewBag.Project = db.Projects.Where(x => x.CategoryID == project.CategoryID && x.ID != id).ToList();
            ViewBag.CategoryName = db.ProjectCategories.Find(project.CategoryID).Title;
            return View(project);
        }
        public JsonResult SendContact(Contact d)
        {
            var contact = new Contact();
            contact.FullName = d.FullName;
            contact.Email = d.Email;
            contact.Comment = d.Comment;
            contact.Mobile = d.Mobile;
            DateTime now = DateTime.Now;
            contact.SentDate = now;
            db.Contacts.Add(contact);
            db.SaveChanges();
            return Json(new { Erros = true });
        }
    }
}