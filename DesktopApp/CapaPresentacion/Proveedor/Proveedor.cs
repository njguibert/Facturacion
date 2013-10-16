using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Facturacion.CapaNegocios;
using Facturacion.CapaDatos;
namespace Facturacion.CapaPresentacion
{
    public partial class Proveedor : Form
    {
        Facturacion.CapaDatos.Proveedor p;
        ProveedorController c=new ProveedorController();
        public Proveedor()
        {
            InitializeComponent();
            
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (p==null) p= new Facturacion.CapaDatos.Proveedor();
            p.nombre = txtnombre.Text;
            p.observacion = txtobs.Text;
            p.razonsocial = txtrazon.Text;
            p.rut = Convert.ToInt64(txtrut.Text.ToString());
            p.telefono = Convert.ToInt32(txttel.Text.ToString());
            p.celular = Convert.ToInt32(txtcel.Text.ToString());
            p.ciudad = txtciudad.Text;
            p.direccion = txtdireccion.Text;
            if (c.crearProveedor(p))
            {
                MessageBox.Show("Proveedor Agregado Correctamente", "Mensaje del Sistema", 0, MessageBoxIcon.Information);
                Utilitarios.ResetearControlesDeFormularios(this);
                txtcodigo.Focus();
            }
            else
            {
                MessageBox.Show("ERROR al agregar Proveedor!", "Mensaje del Sistema", 0, MessageBoxIcon.Error);
            }
            p = null;

        }

        private void textBox1_KeyUp(object sender, KeyEventArgs e)
        {

        }

        private void txtcodigo_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F1)
            {
                MessageBox.Show("Buscar por nombre");
            }
            if (e.KeyCode == Keys.Enter)
            {
                p = c.FindbyCodigo(Convert.ToInt32(txtcodigo.Text));
                if (p != null)
                {
                    //Si existe cargo la informacion
                    txtnombre.Text = p.nombre;
                    txtrazon.Text = p.razonsocial;
                    txtciudad.Text = p.ciudad;
                    txtdireccion.Text = p.direccion;
                    txtobs.Text = p.observacion;
                    txttel.Text = p.telefono.ToString();
                    txtcel.Text = p.celular.ToString();
                    txtrut.Text = p.rut.ToString();
                }
                else
                {
                    DialogResult dialogo = MessageBox.Show("Proveedor no encontrado, es nuevo?", "Nuevo Proveedor?", MessageBoxButtons.YesNo);
                    if (dialogo == DialogResult.Yes)
                    {
                        txtnombre.Focus();
                    }
                }
            }
        }
    }
}
