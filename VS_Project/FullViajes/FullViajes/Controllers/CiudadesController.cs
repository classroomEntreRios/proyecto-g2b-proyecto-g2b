﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using FullViajes.Models;

namespace FullViajes.Controllers
{
    public class CiudadesController : ApiController
    {
        private FullViajesEntities db = new FullViajesEntities();








        // GET: api/Ciudades                         RETORNA LAS CIUDADES
        public IQueryable<Ciudad> GetCiudad()
        {
            return db.Ciudad;
        }







        // GET: api/Ciudades/5
        [ResponseType(typeof(Ciudad))]              //DEVUELVE DETALLES DE CIUDAD , RECIBE ID
        public IHttpActionResult GetCiudad(long id)
        {
            Ciudad ciudad = db.Ciudad.Find(id);
            if (ciudad == null)
            {
                return NotFound(); //NO SE ENCONTRÓ LA CIUDAD
            }

            return Ok(ciudad);
        }








        // PUT: api/Ciudades/5                      //MODIFICA UNA CIUDAD, RECIBE EL FORM Y EL ID
        [Route("api/Ciudades/editar")]
        [HttpPost]
        [ResponseType(typeof(void))]
        public IHttpActionResult PutCiudad(long id, Ciudad ciudad)
        {
            if (!ModelState.IsValid) //COMPRUEBA QUE EL FORM RECIBIDO SEA VALIDO
            {
                ModelState.AddModelError("Error", "DATOS INGRESADOS NO VALIDOS");
                return BadRequest(ModelState);
            }

            if (id != ciudad.id_ciudad)
            {
                ModelState.AddModelError("Error", "VALOR DE ID NO COINCIDE CON ID DEL FORM");
                return BadRequest(ModelState);//comprueba sean el mismo id del form recibido y el que se modifica
            }

            //chequeo que las nuevas coordenadas no se encuentren registradas salvo la del mismo id
            Ciudad coordenadascheck = db.Ciudad.Where(a => a.coordenadas == ciudad.coordenadas && a.id_ciudad != ciudad.id_ciudad).FirstOrDefault();
            if (coordenadascheck != null)
            {
                ModelState.AddModelError("Error", "LAS COORDENADAS YA SE ENCUENTRA EN LA BASE DE DATOS");
                return BadRequest(ModelState);
            }


            //compruebo que el cp no se encuentre ya registrado salvo el del mismo id q es el que se esta modificando
            //Ciudad cpcheck = db.Ciudad.Where(a => a.cp == ciudad.cp && a.id_ciudad != ciudad.id_ciudad).FirstOrDefault();
            //if (cpcheck != null)
            //{
            //   ModelState.AddModelError("CP", "EL CODIGO POSTAL YA SE ENCUENTRA EN LA BASE DE DATOS");
            // return BadRequest(ModelState);
            //}


            db.Entry(ciudad).State = EntityState.Modified;    //modifica

            try
            {
                db.SaveChanges();  //guarda cambios
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CiudadExists(id)) //si id no existia en las ciudades retorna error
                {
                    ModelState.AddModelError("Error", "LA CIUDAD NO SE ENCUENTRA EN LA BASE DE DATOS");
                    return NotFound();//
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }










        // POST: api/Ciudades                           //AGREGA UNA CIUDAD
        [Route("api/Ciudades/register")]
        [HttpPost]
        [ResponseType(typeof(Ciudad))]
        public IHttpActionResult Register(Ciudad ciudad)
        {

            foreach (var modelValue in ModelState.Values) { modelValue.Errors.Clear(); }
            if (!ModelState.IsValid)//comprueba que el modelo sea valido
            {
                ModelState.AddModelError("Error", "DATOS INGRESADOS NO VALIDOS");
                return BadRequest(ModelState);
            }


            Ciudad coordenadascheck = db.Ciudad.Where(a => a.coordenadas == ciudad.coordenadas).FirstOrDefault();
            if (coordenadascheck != null)
            {
                ModelState.AddModelError("Error", "LAS COORDENADAS YA SE ENCUENTRA EN LA BASE DE DATOS");
                return BadRequest(ModelState);
            }



            //SI LA DESCRIPCION DE USUARIO ES VACIA CREO UNA CADENA PARA RELLENAR EL CAMPO
            if (ciudad.descripcion == null)
            {
                ciudad.descripcion = "El Administrador: no agregó descripción de ésta ciudad";
            }


            db.Ciudad.Add(ciudad);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = ciudad.id_ciudad }, ciudad);
        }









        // DELETE: api/Ciudades/5
        [ResponseType(typeof(Ciudad))]
        public IHttpActionResult DeleteCiudad(long id)
        {
            Ciudad ciudad = db.Ciudad.Find(id);
            if (ciudad == null)
            {
                ModelState.AddModelError("CIUDAD", "LA CIUDAD NO SE ENCUENTRA EN LA BASE DE DATOS");
                return NotFound(); //
            }

            db.Ciudad.Remove(ciudad);
            db.SaveChanges();

            return Ok(ciudad);
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CiudadExists(long id)   //funcion para ver si existe la ciudad en la base de datos
        {
            return db.Ciudad.Count(e => e.id_ciudad == id) > 0;
        }
    }
}