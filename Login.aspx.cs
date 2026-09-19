using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class ecommerce_customer : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };

    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(),
            System.Guid.NewGuid().ToString(),
            "ShowMessage('" + Message + "','" + type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnlogin_ServerClick(object sender, EventArgs e)
    {
        if (txtemail.Text.Length > 0 && txtpassword.Text.Length > 0)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                string get_query = "SELECT * FROM ecommerce_backend WHERE backend_name = @name";
                using (SqlCommand get_cmd = new SqlCommand(get_query, con))
                {
                    get_cmd.Parameters.AddWithValue("@name", txtemail.Text.Trim());

                    using (SqlDataReader get_data = get_cmd.ExecuteReader())
                    {
                        if (get_data.Read())
                        {
                            string UserID = get_data["id"].ToString();
                            string Name = get_data["backend_name"].ToString();
                            string Contactno = get_data["backend_mobileno"].ToString();
                            string email = get_data["backend_email"].ToString();
                            string user_type = get_data["backend_role"].ToString();
                            string Password = get_data["backend_password"].ToString();

                            if (Name == txtemail.Text.Trim() && Password == txtpassword.Text)
                            {
                                Session["id"] = UserID;
                                Session["backend_name"] = Name;
                                Session["backend_mobileno"] = Contactno;
                                Session["backend_email"] = email;
                                Session["backend_role"] = user_type;

                                if (user_type == "admin")
                                    Response.Redirect("Dashboard.aspx");
                                else
                                    Response.Redirect("all-orders.aspx");
                            }
                            else
                            {
                                ShowMessage("Invalid User Name or Password! Please try again!", MessageType.Error);
                            }
                        }
                        else
                        {
                            ShowMessage("Invalid User Name or Password! Please try again!", MessageType.Error);
                        }
                    }
                }
            }
        }
        else
        {
            ShowMessage("Please enter Email and Password.", MessageType.Error);
        }
    }
}