using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Patient_Service : System.Web.UI.Page
{
    private string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"] != null 
        ? ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString 
        : "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadPatients();
            LoadServices();
        }
    }

    private void LoadPatients()
    {
        string query = @"SELECT patient_id, title, first_name, last_name,
                                gender, age, contact, dr_name
                         FROM Registration
                         ORDER BY patient_id DESC";

        using (SqlConnection con = new SqlConnection(connStr))
        using (SqlCommand cmd = new SqlCommand(query, con))
        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        {
            DataTable dt = new DataTable();

            da.Fill(dt);

            rptPatients.DataSource = dt;
            rptPatients.DataBind();
        }
    }

    protected void btnAddService_Click(object sender, EventArgs e)
    {
        string patientId = hdnPatientId.Value;
        string serviceName = ddlService.SelectedValue;
        string serviceDate = txtServiceDate.Text.Trim();
        string quantity = txtQty.Text.Trim();
        string rate = txtRate.Text.Trim();
        string amount = txtAmount.Text.Trim();

        if (string.IsNullOrEmpty(patientId))
        {
            Response.Write("<script>alert('Please select a patient first.');</script>");
            return;
        }

        if (string.IsNullOrEmpty(serviceName))
        {
            Response.Write("<script>alert('Please select a service.');</script>");
            return;
        }

        string serviceId = "SV" + DateTime.Now.ToString("yyyyMMddHHmmssfff");

        string query = @"INSERT INTO Patient_Service
                    (service_id, patient_id, service_name, service_date,
                     quantity, rate, amount, status, Date)
                    VALUES
                    (@service_id, @patient_id, @service_name, @service_date,
                     @quantity, @rate, @amount, @status, @Date)";

        using (SqlConnection con = new SqlConnection(connStr))
        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@service_id", serviceId);
            cmd.Parameters.AddWithValue("@patient_id", patientId);
            cmd.Parameters.AddWithValue("@service_name", serviceName);
            cmd.Parameters.AddWithValue("@service_date", serviceDate);
            cmd.Parameters.AddWithValue("@quantity", quantity);
            cmd.Parameters.AddWithValue("@rate", rate);
            cmd.Parameters.AddWithValue("@amount", amount);
            cmd.Parameters.AddWithValue("@status", "Active");
            cmd.Parameters.AddWithValue("@Date", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));

            con.Open();
            cmd.ExecuteNonQuery();
        }

        Response.Write("<script>alert('Service added successfully.');</script>");
    }


    private void LoadServices()
    {
        ddlService.Items.Clear();

        ddlService.Items.Add(new ListItem("-- Select Investigation --", ""));

        ddlService.Items.Add(new ListItem("Complete Blood Count (CBC) - ₹300", "Complete Blood Count (CBC)"));
        ddlService.Items.Add(new ListItem("Erythrocyte Sedimentation Rate (ESR) - ₹120", "Erythrocyte Sedimentation Rate (ESR)"));
        ddlService.Items.Add(new ListItem("Urine Routine & Microscopic - ₹150", "Urine Routine & Microscopic"));
        ddlService.Items.Add(new ListItem("Blood Group & Rh Type - ₹150", "Blood Group & Rh Type"));

        ddlService.Items.Add(new ListItem("Blood Sugar Fasting (FBS) - ₹80", "Blood Sugar Fasting (FBS)"));
        ddlService.Items.Add(new ListItem("Blood Sugar PP (PPBS) - ₹80", "Blood Sugar PP (PPBS)"));
        ddlService.Items.Add(new ListItem("Lipid Profile - ₹750", "Lipid Profile"));
        ddlService.Items.Add(new ListItem("Liver Function Test (LFT) - ₹650", "Liver Function Test (LFT)"));
        ddlService.Items.Add(new ListItem("Kidney Function Test (KFT) - ₹600", "Kidney Function Test (KFT)"));
        ddlService.Items.Add(new ListItem("HbA1c (Glycated Hemoglobin) - ₹450", "HbA1c (Glycated Hemoglobin)"));

        ddlService.Items.Add(new ListItem("Thyroid Profile (T3, T4, TSH) - ₹550", "Thyroid Profile (T3, T4, TSH)"));
        ddlService.Items.Add(new ListItem("Vitamin D3 (25-OH) - ₹1100", "Vitamin D3 (25-OH)"));
        ddlService.Items.Add(new ListItem("Vitamin B12 - ₹950", "Vitamin B12"));
        ddlService.Items.Add(new ListItem("Dengue Serology (NS1 + IgM/IgG) - ₹900", "Dengue Serology (NS1 + IgM/IgG)"));
        ddlService.Items.Add(new ListItem("Widal Test - ₹220", "Widal Test"));

        ddlService.Items.Add(new ListItem("Digital Chest X-Ray (PA View) - ₹500", "Digital Chest X-Ray (PA View)"));
        ddlService.Items.Add(new ListItem("ECG (12 Lead Rest) - ₹350", "ECG (12 Lead Rest)"));
        ddlService.Items.Add(new ListItem("Ultrasound Abdomen & Pelvis - ₹1200", "Ultrasound Abdomen & Pelvis"));
    }
}