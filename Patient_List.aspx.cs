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

            BindPatientInfo();
        }
    }

    // Backend controls handlers ready without backend DB logic

    private void BindPatientInfo()
    {
        try
        {
            string query = @"SELECT patient_id, 
                            id,
                            title,
                            first_name,
                            last_name,gender,
                            DOB,
                            age
                         FROM Registration
                         ORDER BY id DESC";

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvPatientInfo.DataSource = dt;
                gvPatientInfo.DataBind();
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
        }
    }



}