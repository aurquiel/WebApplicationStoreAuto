using System;
using System.Linq;
using System.Web.Http;
using WebApplicationRemote.Models;
using WebApplicationRemote.Models.AnswerModel;

namespace WebApplicationRemote.Controllers
{
    public class AccessController : ApiController
    {
        [HttpPost]
        public Reply Login([FromBody] LoginViewModel model)
        {
            Reply reply = new Reply();
            try
            {
                using (AutogestionTiendasEntities db = new AutogestionTiendasEntities())
                {
                    if (db.StoreEmployee.Where(d => d.stremp_alias == model.stremp_alias && d.stremp_audit_deleted != true && d.Store.store_code == model.store_code).Count() > 0 && db.Store.Where(a => a.store_code == model.store_code && a.store_audit_deleted != true).Count() > 0)
                    {
                        var query = (from c in db.StoreEmployee
                                     where c.stremp_alias == model.stremp_alias
                                     select new StoreEmployeeUserAnswer()
                                     {
                                         stremp_id = c.stremp_id,
                                         stremp_alias = c.stremp_alias,
                                         stremp_store_id = c.Store.store_id,
                                         store_code = c.Store.store_code,
                                     });

                        reply.Message = "Usuario de tienda obtenido con exito.";
                        reply.Data = query.ToList();
                        reply.statusOperation = true;
                    }
                    else
                    {
                        reply.Message = "Error el usuario de tienda no existe.";
                        reply.Data = null;
                        reply.statusOperation = false;
                    }
                }
            }
            catch(Exception ex)
            {
                reply.Message = "Error al intentar obtener usuario, Excepcion: " + ex.Message;
                reply.Data = null;
                reply.statusOperation = false;
            }
            
            return reply;
        }
    }
}
