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
    public class UsersController : BaseController
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();
        public int CheckUserName(string userName)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName);
            if (result != null)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }
        // GET: Admin/Users
        public ActionResult Index()
        {
            return View(db.Users.ToList());
        }

        // GET: Admin/Users/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            user.Password = Encryptor.MD5Hash(user.Password);
            return View(user);
        }

        // GET: Admin/Users/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Users/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,UserName,Password,Email,Mobile,Name,Address,Sex")] User user)
        {
            if (ModelState.IsValid)
            {
                var result = CheckUserName(user.UserName);
                if (result == 1)
                {

                    ModelState.AddModelError("", "User Name đã tồn tại");
                }
                else
                {
                    user.Password = Encryptor.MD5Hash(user.Password);
                    db.Users.Add(user);
                    db.SaveChanges();
                    SetAlert("Thêm user thành công", "alert-success");
                    return RedirectToAction("Index");
                }
            }

            return View(user);
        }

        // GET: Admin/Users/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: Admin/Users/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,UserName,Password,Email,Mobile,Name,Address,Sex")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                SetAlert("Sửa user thành công", "success");
                return RedirectToAction("Index");
            }
            return View(user);
        }

        [HttpDelete]
        public ActionResult Delete(long id)
        {

            User user = db.Users.Find(id);
            db.Users.Remove(user);
            db.SaveChanges();
            SetAlert("Xoá user thành công", "success");
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
