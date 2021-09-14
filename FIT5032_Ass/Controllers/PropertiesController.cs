using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FIT5032_Ass.Models;

namespace FIT5032_Ass.Controllers
{
    public class PropertiesController : Controller
    {
        private Entities db = new Entities();

        // GET: Properties
        public ActionResult Index()
        {
            var propertySet = db.PropertySet.Include(p => p.AspNetUsers).Include(p => p.Agency);
            return View(propertySet.ToList());
        }

        // GET: Properties/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Property property = db.PropertySet.Find(id);
            if (property == null)
            {
                return HttpNotFound();
            }
            return View(property);
        }

        // GET: Properties/Create
        public ActionResult Create()
        {
            ViewBag.AspNetUsersId = new SelectList(db.AspNetUsers, "Id", "Email");
            ViewBag.AgencyId = new SelectList(db.AgencySet, "Id", "name");
            return View();
        }

        // POST: Properties/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,type,price,discount,address,description,AspNetUsersId,AgencyId")] Property property)
        {
            if (ModelState.IsValid)
            {
                db.PropertySet.Add(property);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AspNetUsersId = new SelectList(db.AspNetUsers, "Id", "Email", property.AspNetUsersId);
            ViewBag.AgencyId = new SelectList(db.AgencySet, "Id", "name", property.AgencyId);
            return View(property);
        }

        // GET: Properties/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Property property = db.PropertySet.Find(id);
            if (property == null)
            {
                return HttpNotFound();
            }
            ViewBag.AspNetUsersId = new SelectList(db.AspNetUsers, "Id", "Email", property.AspNetUsersId);
            ViewBag.AgencyId = new SelectList(db.AgencySet, "Id", "name", property.AgencyId);
            return View(property);
        }

        // POST: Properties/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,type,price,discount,address,description,AspNetUsersId,AgencyId")] Property property)
        {
            if (ModelState.IsValid)
            {
                db.Entry(property).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AspNetUsersId = new SelectList(db.AspNetUsers, "Id", "Email", property.AspNetUsersId);
            ViewBag.AgencyId = new SelectList(db.AgencySet, "Id", "name", property.AgencyId);
            return View(property);
        }

        // GET: Properties/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Property property = db.PropertySet.Find(id);
            if (property == null)
            {
                return HttpNotFound();
            }
            return View(property);
        }

        // POST: Properties/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Property property = db.PropertySet.Find(id);
            db.PropertySet.Remove(property);
            db.SaveChanges();
            return RedirectToAction("Index");
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
