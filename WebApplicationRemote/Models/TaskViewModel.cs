using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationRemote.Models
{
    public class TaskViewModel
    {
        public int task_store_id { get; set; }
        public int task_stremp_id { get; set; }
        public int task_status_id { get; set; }
        public string task_token { get; set; }
        public System.DateTime task_date { get; set; }
        public string task_description { get; set; }
        public string task_moderator_message { get; set; }
        public int task_status_local { get; set; }
        public string task_status_local_message { get; set; }
        public int task_audit_id { get; set; }
        public System.DateTime task_audit_date { get; set; }
        public bool task_audit_deleted { get; set; }
    }
}