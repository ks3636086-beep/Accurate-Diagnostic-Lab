using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
    public enum MessageType { Success, Error, Info, Warning };

    Master mst = new Master();
    protected void ShowMessage(string Message, MessageType type)
    {
        //ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }


    protected void btnRegisterPatient_Click(object sender, EventArgs e)
    {
        string query = @"INSERT INTO Registration
                    (title, first_name, last_name, gender, DOB, age, type,
                     contact, email, referral_type, referral_name, dr_name,
                     rider, external_visit_id, remark, PRO)
                    VALUES
                    (@title, @first_name, @last_name, @gender, @DOB, @age, @type,
                     @contact, @email, @referral_type, @referral_name, @dr_name,
                     @rider, @external_visit_id, @remark, @PRO)";

        using (SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@title", ddlTitle.SelectedValue);
            cmd.Parameters.AddWithValue("@first_name", txtFirstName.Text.Trim());
            cmd.Parameters.AddWithValue("@last_name", txtLastName.Text.Trim());
            cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
            cmd.Parameters.AddWithValue("@DOB", txtDOB.Text.Trim());
            cmd.Parameters.AddWithValue("@age", txtAge.Text.Trim());
            cmd.Parameters.AddWithValue("@type", ddlAgeType.SelectedValue);
            cmd.Parameters.AddWithValue("@contact", txtMobile.Text.Trim());
            cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@referral_type", ddlReferralType.SelectedValue);
            cmd.Parameters.AddWithValue("@referral_name", txtReferralName.Text.Trim());
            cmd.Parameters.AddWithValue("@dr_name", txtDoctorName.Text.Trim());
            cmd.Parameters.AddWithValue("@rider", ddlRider.SelectedValue);
            cmd.Parameters.AddWithValue("@external_visit_id", txtExternalVisitID.Text.Trim());
            cmd.Parameters.AddWithValue("@remark", txtRemarks.Text.Trim());
            cmd.Parameters.AddWithValue("@PRO", ddlPRO.SelectedValue);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        Response.Write("<script>alert('Patient registered successfully!');</script>");
    }
}