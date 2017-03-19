using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Core;

namespace RegistrationApp
{
    public partial class Default : Page
    {

        RegistrationInsert_Result insertItem = new RegistrationInsert_Result();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void RegistrationInsert(RegistrationInsert_Result item)
        {
            try
            {
                var lastNameTextbox = this.registrationFormView.FindControl("LastNameTextBox") as TextBox;
                var name = $"{item.Name} {lastNameTextbox.Text}";

                RegistrationDatabaseEntities entities = new RegistrationDatabaseEntities();
                entities.RegistrationInsert(item.Username, name, item.Email, item.DateOfBirth, item.Phone);
            }
            catch(EntityCommandExecutionException ex)
            {
                if (ex.InnerException.Message.Contains("Violation of PRIMARY KEY constraint 'PK_Registration'"))
                {
                    // Display user name already taken error
                }
            }
            catch(Exception ex)
            {
                // Handle general exceptions - would have separate exception handler for username already exists exception
            }
        }
    }
}