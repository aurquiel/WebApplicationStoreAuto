using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationRemote.Models.AnswerModel
{
    public class Reply
    {
        public string Message { get; set; }
        public object Data { get; set; }
        public bool statusOperation { get; set; }
    }
}