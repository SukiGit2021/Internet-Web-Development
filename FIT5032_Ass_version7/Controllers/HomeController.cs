using FIT5032_Ass_version7.Models;
using FIT5032_Ass_version7.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FIT5032_Ass_version7.Controllers
{
    [RequireHttps]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult geolocation()
        {
            ViewBag.Message = "map";

            return View();
        }
        public ActionResult Functionspage()
        {
            ViewBag.Message = "Multiple functions";

            return View();
        }

        public ActionResult dateConstraint(string date = "1234")
        {
            if ("1234" == date)
                return View();
            DateTime convertedDate = DateTime.Parse(date);
            ViewBag.eventDate = convertedDate;
            return View();
        }

        public ActionResult Send_Email()
        {
            return View(new SendEmailViewModel());
        }

        [HttpPost]
        public ActionResult Send_Email(SendEmailViewModel model,HttpPostedFileBase postedFileBase)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    String toEmail = model.ToEmail;
                    String subject = model.Subject;
                    String contents = model.Contents;

                    EmailSender es = new EmailSender();
                    es.Send(toEmail, subject, contents,postedFileBase);

                    ViewBag.Result = "Email has been send.";

                    ModelState.Clear();

                    return View(new SendEmailViewModel());
                }
                catch
                {
                    return View();
                }
            }

            return View();
        }

}
}