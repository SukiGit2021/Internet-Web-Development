using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FIT5032_Ass_version7.Models;

namespace FIT5032_Ass_version7.Controllers
{
    public class PropertySizesController : Controller
    {
        private Entities db = new Entities();

        // GET: PropertySizes
        public ActionResult Index()
        {
            return View(db.PropertySizeSet.ToList());
        }

        // GET: PropertySizes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PropertySize propertySize = db.PropertySizeSet.Find(id);
            if (propertySize == null)
            {
                return HttpNotFound();
            }
            return View(propertySize);
        }

        // GET: PropertySizes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PropertySizes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,PropertyType,PropertyDescription")] PropertySize propertySize)
        {
            if (ModelState.IsValid)
            {
                db.PropertySizeSet.Add(propertySize);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(propertySize);
        }

        // GET: PropertySizes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PropertySize propertySize = db.PropertySizeSet.Find(id);
            if (propertySize == null)
            {
                return HttpNotFound();
            }
            return View(propertySize);
        }

        // POST: PropertySizes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,PropertyType,PropertyDescription")] PropertySize propertySize)
        {
            if (ModelState.IsValid)
            {
                db.Entry(propertySize).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(propertySize);
        }

        // GET: PropertySizes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PropertySize propertySize = db.PropertySizeSet.Find(id);
            if (propertySize == null)
            {
                return HttpNotFound();
            }
            return View(propertySize);
        }

        // POST: PropertySizes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PropertySize propertySize = db.PropertySizeSet.Find(id);
            db.PropertySizeSet.Remove(propertySize);
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
