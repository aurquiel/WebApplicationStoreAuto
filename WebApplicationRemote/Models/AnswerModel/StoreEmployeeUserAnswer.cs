using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationRemote.Models.AnswerModel
{
    public class StoreEmployeeUserAnswer
    {
        public int stremp_id { get; set; }
        public string stremp_alias { get; set; }
        public int stremp_store_id { get; set; }
        public int store_code { get; set; }
    }
}