using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Facturacion.CapaDatos;
using System.Data;


namespace Facturacion.CapaNegocios
{
    public class ProveedorController
    {
        public Proveedor FindbyCodigo(int c)
        {
            ModeloDominioContainer modelo = new ModeloDominioContainer();
            Proveedor p=(Proveedor)modelo.Empresas.Where(a => a.id == c).FirstOrDefault();
            return p;
        }
        public bool crearProveedor(Proveedor p)
        {
            
           ModeloDominioContainer modelo = new ModeloDominioContainer();
           Proveedor pr =(Proveedor)modelo.Empresas.FirstOrDefault(c => c.id == p.id);
           if (pr != null)
           {
               modelo.Empresas.Attach(modelo.Empresas.Single(c => c.id == p.id));
               modelo.Empresas.ApplyCurrentValues(p);
           }
            modelo.SaveChanges();
            return true;
        }
    }
}
