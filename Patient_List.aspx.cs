using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Patient_List : System.Web.UI.Page
{
    private string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"] != null 
        ? ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString 
        : "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPatientGrid();
        }
    }

    private void BindPatientGrid(string searchTerm = "")
    {
        try
        {
            if (string.IsNullOrEmpty(connStr))
            {
                lblMessage.Text = "Database connection string 'DefaultConnection' not configured.";
                lblMessage.Visible = true;
                return;
            }

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT id, 
                                    title, first_name, last_name, gender, DOB, age, type,
                                    contact, email, referral_type, referral_name, dr_name,
                                    rider, external_visit_id, remark, PRO
                                 FROM Registration";

                if (!string.IsNullOrWhiteSpace(searchTerm))
                {
                    query += @" WHERE first_name LIKE @search 
                                   OR last_name LIKE @search 
                                   OR contact LIKE @search 
                                   OR email LIKE @search 
                                   OR dr_name LIKE @search 
                                   OR referral_name LIKE @search 
                                   OR external_visit_id LIKE @search 
                                   OR PRO LIKE @search";
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrWhiteSpace(searchTerm))
                    {
                        cmd.Parameters.AddWithValue("@search", "%" + searchTerm.Trim() + "%");
                    }

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        gvPatients.DataSource = dt;
                        gvPatients.DataBind();

                        lblTotalCount.Text = dt.Rows.Count.ToString();
                        lblMessage.Visible = false;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Notice: Unable to query database (" + ex.Message + "). Please check database connection.";
            lblMessage.Visible = true;
            lblTotalCount.Text = "0";
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string search = txtSearch.Text.Trim();
        gvPatients.PageIndex = 0;
        BindPatientGrid(search);
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtSearch.Text = "";
        gvPatients.PageIndex = 0;
        BindPatientGrid();
    }

    protected void gvPatients_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvPatients.PageIndex = e.NewPageIndex;
        BindPatientGrid(txtSearch.Text.Trim());
    }
}