using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationRemote.Models.AnswerModel
{
    public class TaskStatusAnswer
    {
        public int task_status_id { get; set; }
        public string task_token { get; set; }
        public string task_moderator_message { get; set; }
    }
}