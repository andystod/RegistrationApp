using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationApp
{
    public partial class Search : Page
    {
        
        SortDirection sortDirection = SortDirection.Ascending;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                registrationGridView.Attributes["CurrentSortDir"] = "ASC";
            }
        }

        public List<RegistrationSearch_Result> GetRegistrationList(int maximumRows, int startRowIndex, out int totalRowCount, string sortByExpression)
        {
            RegistrationDatabaseEntities entities = new RegistrationDatabaseEntities();

            string sortDirectionSQL;

            if (sortDirection == SortDirection.Ascending)
            {
                sortDirectionSQL = "ASC";
            }
            else
            {
                sortDirectionSQL = "DESC";
            }
            var results = entities.RegistrationSearch(SearchTextBox.Text, sortDirectionSQL, startRowIndex, maximumRows).ToList();

            totalRowCount = results[0].Total.Value;
            return results;
        }

        // Adds an attribute to the gridview to record the sort direction
        private SortDirection GridViewSortDirection(GridView g, GridViewSortEventArgs e)
        {
            var d = e.SortDirection;

            //Check if GridView control has required Attribute
            if (g.Attributes["CurrentSortDir"] != null)
            {
                d = SortDirection.Ascending;
                if (g.Attributes["CurrentSortDir"] == "ASC")
                {
                    d = SortDirection.Descending;
                }

                g.Attributes["CurrentSortDir"] = (d == SortDirection.Ascending ? "ASC" : "DESC");
            }
            return d;
        }

        public void RegistrationGridView_UpdateItem(RegistrationSearch_Result item)
        {
            RegistrationDatabaseEntities entities = new RegistrationDatabaseEntities();
            entities.RegistrationUpdate(item.Username, item.Name, item.Email, item.Phone, item.Username);
        }

        public void RegistrationGridView_DeleteItem(string username)
        {
            RegistrationDatabaseEntities entities = new RegistrationDatabaseEntities();
            entities.RegistrationDelete(username);
        }

        protected void RegistrationGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            sortDirection = GridViewSortDirection(registrationGridView, e);
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            // Reset gridview paging and sorting settings before rebinding
            registrationGridView.PageIndex = 0;
            registrationGridView.Attributes["CurrentSortDir"] = "ASC";
            registrationGridView.DataBind();
        }
    }
}