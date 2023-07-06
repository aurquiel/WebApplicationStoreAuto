using System;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using WebApplicationRemote.Models;
using WebApplicationRemote.Models.AnswerModel;

namespace WebApplicationRemote.Controllers
{
    public class TaskController : ApiController
    {
        [HttpPost]
        public async Task<Reply> MakeTask([FromBody] TaskViewModel model)
        {
            Reply reply = new Reply();
            try
            {
                using (AutogestionTiendasEntities db = new AutogestionTiendasEntities())
                {
                    Models.Task a = new Models.Task { task_store_id = model.task_store_id, task_stremp_id = model.task_stremp_id, task_token = model.task_token, task_status_id = model.task_status_id, task_date = model.task_date, task_description = model.task_description, task_moderator_message = model.task_moderator_message, task_status_local = model.task_status_local, task_status_local_message = model.task_status_local_message, task_audit_id = model.task_audit_id, task_audit_date = model.task_audit_date, task_audit_deleted = model.task_audit_deleted };
                    db.Task.Add(a);
                    if(await db.SaveChangesAsync() > 0)
                    {
                        int id = a.task_id;
                        reply.Data = id;
                        reply.Message = "Tarea creada con exito.";
                        reply.statusOperation = true;
                    }
                    else
                    {
                        reply.Data = null;
                        reply.Message = "Error al crear tarea.";
                        reply.statusOperation = false;
                    }  
                }
            }
            catch (Exception ex)
            {
                reply.Message = "Error al crear tarea, Excepcion: " + ex.Message;
                reply.statusOperation = false;
            }

            return reply;
        }

        [HttpPost]
        public Reply GetStatusTask([FromBody] TaskStatusModel model)
        {
            Reply reply = new Reply();
            try
            {
                using (AutogestionTiendasEntities db = new AutogestionTiendasEntities())
                {
                    if(db.Task.Where(d => d.task_id == model.task_id && d.task_audit_deleted == false).Count() > 0)
                    {
                        var query = (from c in db.Task
                                     where c.task_id == model.task_id && c.task_audit_deleted == false
                                     select new TaskStatusAnswer()
                                     {
                                         task_status_id = c.task_status_id,
                                         task_token = c.task_token,
                                         task_moderator_message = c.task_moderator_message
                                     });

                        reply.Message = "Estatus de la tarea obtenido con exito.";
                        reply.Data = query.ToList();
                        reply.statusOperation = true;
                    }
                    else
                    {
                        reply.Message = "Error al obenter estatus, la tarea no existe.";
                        reply.Data = model.task_id;
                        reply.statusOperation = false;
                    }
                }
            }
            catch (Exception ex)
            {
                reply.Message = "Error al obtener status de la tarea, Excepcion: " + ex.Message;
                reply.statusOperation = false;
            }

            return reply;
        }

        [HttpPost]
        public async Task<Reply> SetStatusTask([FromBody] TaskSetStatusModel model)
        {
            Reply reply = new Reply();
            try
            {
                using (AutogestionTiendasEntities db = new AutogestionTiendasEntities())
                {
                    if(db.Task.Where(d => d.task_id == model.id && d.task_audit_deleted == false).Count() > 0)
                    {
                        var query = (from d in db.Task
                                     where d.task_id == model.id && d.task_audit_deleted == false
                                     select d).FirstOrDefault();

                        query.task_status_id = model.task_status_id;
                        query.task_status_local = model.task_status_local;
                        query.task_status_local_message = model.task_status_local_message;

                        if(await db.SaveChangesAsync() > 0)
                        {
                            var query2 = (from c in db.Task
                                          where c.task_id == model.id && c.task_audit_deleted == false
                                          select new TaskStatusAnswer()
                                          {
                                              task_status_id = c.task_status_id
                                          });

                            reply.Message = "Estatus de la tarea actualizado con exito.";
                            reply.Data = query2.ToList();
                            reply.statusOperation = true;
                        }
                        else
                        {
                            reply.Message = "Error al actualizar estatus de la tarea, no fue posible guardarla en la base de datos.";
                            reply.Data = model.id;
                            reply.statusOperation = false;
                        }
                    }
                    else
                    {
                        reply.Message = "Error al actualizar estatus de la tarea, tarea no existe.";
                        reply.Data = model.id;
                        reply.statusOperation = false;
                    }  
                }
            }
            catch (Exception ex)
            {
                reply.Message = "Error al actualizar estatus de la tarea, Excepcion: " + ex.Message;
                reply.Data = model.id;
                reply.statusOperation = false;
            }

            return reply;
        }

    }
}
