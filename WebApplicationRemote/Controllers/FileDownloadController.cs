using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Http;

namespace WebApplicationRemote.Controllers
{
    public class FileDownloadController : ApiController
    {
        [HttpGet]
        public HttpResponseMessage GetTotalPosCaja()
        {
            var result = new HttpResponseMessage(HttpStatusCode.OK);

            var fileName = "Total POS.jar";
            var filePath = HttpContext.Current.Server.MapPath($"~/App_Data/TotalPosCaja/{fileName}");

            var fileBytes = File.ReadAllBytes(filePath);

            var fileMemStream = new MemoryStream(fileBytes);

            result.Content = new StreamContent(fileMemStream);

            var headers = result.Content.Headers;

            headers.ContentDisposition = new ContentDispositionHeaderValue("attachment");
            headers.ContentDisposition.FileName = fileName;

            headers.ContentType = new MediaTypeHeaderValue("application/jar");

            headers.ContentLength = fileMemStream.Length;

            return result;
        }

        [HttpGet]
        public HttpResponseMessage GetTotalPosAdministrativo()
        {
            var result = new HttpResponseMessage(HttpStatusCode.OK);

            var fileName = "Total POS.jar";
            var filePath = HttpContext.Current.Server.MapPath($"~/App_Data/TotalPosAdministrativo/{fileName}");

            var fileBytes = File.ReadAllBytes(filePath);

            var fileMemStream = new MemoryStream(fileBytes);

            result.Content = new StreamContent(fileMemStream);

            var headers = result.Content.Headers;

            headers.ContentDisposition = new ContentDispositionHeaderValue("attachment");
            headers.ContentDisposition.FileName = fileName;

            headers.ContentType = new MediaTypeHeaderValue("application/jar");

            headers.ContentLength = fileMemStream.Length;

            return result;
        }
    }
}
