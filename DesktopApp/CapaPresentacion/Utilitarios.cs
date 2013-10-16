using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Facturacion.CapaPresentacion
{
    class Utilitarios
    {
        public static void ResetearControlesDeFormularios(Control form)
        {

            foreach (Control c in form.Controls)
            {
                var textBox = c as TextBox;
                var comboBox = c as ComboBox;

                if (textBox != null)
                    (textBox).Clear();

                if (comboBox != null)
                    comboBox.SelectedIndex = 0;

                if (c.HasChildren)
                    Utilitarios.ResetearControlesDeFormularios(c);
            }
        }
    }
}
