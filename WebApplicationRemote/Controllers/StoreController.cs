using System;
using System.Linq;
using System.Web.Http;
using WebApplicationRemote.Models;
using WebApplicationRemote.Models.AnswerModel;

namespace WebApplicationRemote.Controllers
{
    public class StoreController : ApiController
    {
        [HttpGet]
        public Reply GetStores()
        {
            Reply reply = new Reply();
            try
            {
                using (AutogestionTiendasEntities db = new AutogestionTiendasEntities())
                {
                    if(db.Store.Where(d => d.store_audit_deleted == false).Count() > 0)
                    {
                        var query = (from c in db.Store
                                     where c.store_audit_deleted == false
                                     orderby c.store_code
                                     select new StoresAnswer()
                                     {
                                         store_id = c.store_id,
                                         store_code = c.store_code
                                     });

                        reply.Message = "Tiendas obtenidas con exito.";
                        reply.Data = query.ToList();
                        reply.statusOperation = true;
                    }
                    else
                    {
                        reply.Message = "Error no exiten tiendas disponibles en la base de datos.";
                        reply.Data = null;
                        reply.statusOperation = false;
                    }         
                }
            }
            catch (Exception ex)
            {
                reply.Message = "Error al intentar obtener tiendas, Excepcion: " + ex.Message;
                reply.statusOperation = false;
            }

            return reply;
        }
    }
}
