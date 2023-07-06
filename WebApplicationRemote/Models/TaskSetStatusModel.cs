using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationRemote.Models
{
    public class TaskSetStatusModel
    {
        public int id { get; set; }
        public int task_status_id { get; set; }
        public int task_status_local { get; set; }
        public string task_status_local_message { get; set; }
    }
}